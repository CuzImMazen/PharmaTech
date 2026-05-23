import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/error/failure_types.dart';
import 'package:pharmacy_app/core/services/google_auth_service.dart';
import 'package:pharmacy_app/core/token/token_store.dart';
import 'package:pharmacy_app/features/authentication/cubit/login/login_state.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authRepository,
    required this.tokenStore,
    required this.googleAuthService,
  }) : super(const LoginState.initial());

  final AuthRepository authRepository;
  final GoogleAuthService googleAuthService;
  final TokenStore tokenStore;

  Future<void> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(const LoginState.loading());

    final result = await authRepository.login(
      email: email,
      password: password,
      deviceName: 'mobile_app',
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        emit(LoginState.failure(failure));
      },
      (response) async {
        final accessToken = response.accessToken;
        final refreshToken = response.refreshToken;

        tokenStore.set(accessToken: accessToken, refreshToken: refreshToken);

        if (rememberMe) {
          await authRepository.saveAccessToken(accessToken);
          await authRepository.saveRefreshToken(refreshToken);
        } else {
          await authRepository.clearAllTokens();
        }

        if (isClosed) return;
        emit(LoginState.success(response));
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(const LoginState.googleLoading());

    final tokenResult = await googleAuthService.getGoogleIdToken();

    tokenResult.fold((failure) => emit(LoginState.failure(failure)), (
      idToken,
    ) async {
      if (idToken == null) {
        emit(
          const LoginState.failure(
            AuthFailure(
              AuthFailureType.googleSignInFailed,
              message: 'Google sign-in failed. No ID token received.',
            ),
          ),
        );
        return;
      }

      final loginResult = await authRepository.loginWithGoogle(
        idToken: idToken,
        deviceName: 'mobile_app',
      );

      if (isClosed) return;

      loginResult.fold((failure) => emit(LoginState.failure(failure)), (
        response,
      ) async {
        tokenStore.set(
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        );

        // Google login is persistent by default
        await authRepository.saveAccessToken(response.accessToken);
        await authRepository.saveRefreshToken(response.refreshToken);

        if (isClosed) return;
        emit(LoginState.success(response));
      });
    });
  }
}
