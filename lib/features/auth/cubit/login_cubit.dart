import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/token/token_store.dart';
import 'package:pharmacy_app/features/auth/cubit/login_state.dart';
import 'package:pharmacy_app/features/auth/data/repo/auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepository, required this.tokenStore})
    : super(const LoginState.initial());

  final AuthRepository authRepository;
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

    await result.fold(
      (failure) async {
        emit(LoginState.failure(failure));
      },
      (response) async {
        // Always keep tokens in memory so AuthInterceptor can use them
        tokenStore.set(
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        );

        // Persist tokens only when "Remember Me" is enabled
        if (rememberMe) {
          await authRepository.saveAccessToken(response.accessToken);
          await authRepository.saveRefreshToken(response.refreshToken);
        } else {
          // Remove any previously persisted tokens
          await authRepository.clearAllTokens();
        }

        emit(LoginState.success(response));
      },
    );
  }
}
