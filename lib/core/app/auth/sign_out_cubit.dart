import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/app/auth/sign_out_state.dart';
import 'package:pharmacy_app/core/app/session/session_cubit.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/token/token_store.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

/// Orchestrates sign-out as the inverse of login. Calls the backend
/// `POST /logout` (revokes the refresh token), then — only on success — clears
/// the in-memory tokens, persisted tokens, cached user, and flips the session
/// to unauthenticated (the router auto-redirects to `/login`). On failure it
/// blocks: stays signed in and surfaces the failure for a retry.
class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(const SignOutState());

  Future<void> signOut() async {
    if (state.isSigningOut) return;
    emit(const SignOutState(isSigningOut: true));

    final authRepository = sl<AuthRepository>();
    final tokenStore = sl<TokenStore>();

    // Prefer the in-memory refresh token; fall back to persisted storage.
    final refreshToken =
        tokenStore.refreshToken ?? await authRepository.getRefreshToken();

    final result = await authRepository.logout(refreshToken: refreshToken);

    if (isClosed) return;

    result.fold(
      (failure) => emit(SignOutState(isSigningOut: false, failure: failure)),
      (_) async {
        // Clear everything, in the inverse order of login's persistence.
        tokenStore.clear();
        await authRepository.clearAllTokens();
        await authRepository.clearUserCache();
        if (isClosed) return;
        emit(const SignOutState());
        // Flip the session → AppStateNotifier re-emits → router → /login.
        sl<SessionCubit>().setUnauthenticated();
      },
    );
  }

  void clearFailure() {
    if (isClosed) return;
    if (state.failure != null) {
      emit(state.copyWith(failure: null));
    }
  }
}
