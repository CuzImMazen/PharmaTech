import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/token/token_store.dart';
import 'package:pharmacy_app/features/authentication/cubit/login/login_state.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

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
}
