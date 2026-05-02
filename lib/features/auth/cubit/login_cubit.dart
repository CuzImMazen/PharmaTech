import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';
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
    emit(state.copyWith(screenState: const LoadingState()));

    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(screenState: const SuccessState()));
    });
  }

  void testError() {
    emit(state.copyWith(screenState: const LoadingState()));

    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(screenState: FailureState(NetworkFailure())));
    });
  }
}
