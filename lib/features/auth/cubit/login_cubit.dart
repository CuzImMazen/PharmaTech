import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  void toggleAcceptTerms() {
    emit(state.copyWith(acceptTerms: !state.acceptTerms));
  }

  void test() {
    emit(state.copyWith(status: ScreenState.loading, failure: null));

    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(status: ScreenState.success));
    });
  }

  void testError() {
    emit(state.copyWith(status: ScreenState.loading, failure: null));

    Future.delayed(const Duration(seconds: 2), () {
      emit(
        state.copyWith(
          status: ScreenState.failure,
          failure: AuthFailure(AuthError.wrongPassword),
        ),
      );
    });
  }
}
