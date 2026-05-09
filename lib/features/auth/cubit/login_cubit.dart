import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  void test() {
    emit(LoginState.loading());

    Future.delayed(const Duration(seconds: 2), () {
      emit(LoginState.success("sample_token"));
    });
  }

  void testError() {
    emit(LoginState.loading());

    Future.delayed(const Duration(seconds: 2), () {
      emit(LoginState.failure(NetworkFailure()));
    });
  }
}
