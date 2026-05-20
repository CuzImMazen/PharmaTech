import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/token/token_store.dart';
import 'package:pharmacy_app/features/authentication/cubit/login/login_state.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';
import 'package:pharmacy_app/features/authentication/data/services/google_sign_in_service.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authRepository,
    required this.tokenStore,
    required this.googleSignInService,
  })
    : super(const LoginState.initial());

  final AuthRepository authRepository;
  final TokenStore tokenStore;
  final GoogleSignInService googleSignInService;
  static const String _deviceName = 'mobile_app';

  Future<void> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(const LoginState.loading());

    final result = await authRepository.login(
      email: email,
      password: password,
      deviceName: _deviceName,
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        emit(LoginState.failure(failure));
      },
      (response) async {
        final accessToken = response.user.accessToken;
        final refreshToken = response.user.refreshToken;

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

  Future<void> loginWithGoogle({required bool rememberMe}) async {
    emit(const LoginState.loading());

    try {
      final googleAuth = await googleSignInService.signIn();

      if (googleAuth == null) {
        emit(const LoginState.initial());
        return;
      }

      final result = await authRepository.loginWithGoogle(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
        serverAuthCode: googleAuth.serverAuthCode,
        deviceName: _deviceName,
      );

      if (isClosed) return;

      result.fold(
        (failure) {
          emit(LoginState.failure(failure));
        },
        (response) async {
          final accessToken = response.user.accessToken;
          final refreshToken = response.user.refreshToken;

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
    } catch (_) {
      if (isClosed) return;
      emit(LoginState.failure(const UnknownFailure()));
    }
  }
}
