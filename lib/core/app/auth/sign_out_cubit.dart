import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/app/auth/sign_out_state.dart';
import 'package:pharmacy_app/core/app/session/session_cubit.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/token/token_store.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

/// Orchestrates sign-out as the inverse of login.
///
/// [signOut] calls `POST /logout` (revokes the current refresh token) and
/// [signOutAll] calls `POST /logout-all` (revokes *every* access + refresh
/// token for this user across all devices/sessions). Both — only on success —
/// clear the in-memory tokens, persisted tokens, cached user, and flip the
/// session to unauthenticated (the router auto-redirects to `/login`). On
/// failure they block: stay signed in and surface the failure for a retry.
class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(const SignOutState());

  Future<void> signOut() async {
    if (state.isSigningOut) return;
    emit(state.copyWith(isSigningOut: true, failure: null));

    final authRepository = sl<AuthRepository>();
    final tokenStore = sl<TokenStore>();

    // Prefer the in-memory refresh token; fall back to persisted storage.
    final refreshToken =
        tokenStore.refreshToken ?? await authRepository.getRefreshToken();

    final result = await authRepository.logout(refreshToken: refreshToken);

    if (isClosed) return;

    result.fold(
      (failure) =>
          emit(state.copyWith(isSigningOut: false, failure: failure)),
      (_) async => _clearSession(),
    );
  }

  /// Signs the user out of *every* device/session by revoking all their tokens
  /// server-side. The current device is included, so afterwards a full login
  /// is required here too.
  Future<void> signOutAll() async {
    if (state.isSigningOutAll) return;
    emit(state.copyWith(isSigningOutAll: true, failure: null));

    final authRepository = sl<AuthRepository>();

    // logout-all takes no body — it revokes all of the user's tokens.
    final result = await authRepository.logoutAll();

    if (isClosed) return;

    result.fold(
      (failure) =>
          emit(state.copyWith(isSigningOutAll: false, failure: failure)),
      (_) async => _clearSession(),
    );
  }

  /// Shared success path: clear everything in the inverse order of login's
  /// persistence, then flip the session so the router redirects to `/login`.
  Future<void> _clearSession() async {
    final authRepository = sl<AuthRepository>();
    final tokenStore = sl<TokenStore>();

    tokenStore.clear();
    await authRepository.clearAllTokens();
    await authRepository.clearUserCache();
    if (isClosed) return;
    emit(const SignOutState());
    // Flip the session → AppStateNotifier re-emits → router → /login.
    sl<SessionCubit>().setUnauthenticated();
  }

  void clearFailure() {
    if (isClosed) return;
    if (state.failure != null) {
      emit(state.copyWith(failure: null));
    }
  }
}
