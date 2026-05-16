import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';
import 'package:pharmacy_app/features/auth/cubit/resend_reset_password_state.dart';
import 'package:pharmacy_app/features/auth/data/repo/auth_repository.dart';

class ResendResetPasswordCubit extends Cubit<ResendResetPasswordState> {
  ResendResetPasswordCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const ResendResetPasswordState()) {
    startTimer();
  }
  final AuthRepository _authRepository;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    emit(state.copyWith(remainingSeconds: 60));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 1) {
        emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
      } else {
        _timer?.cancel();
        emit(state.copyWith(remainingSeconds: 0));
      }
    });
  }

  Future<void> resendPasswordLink(String email) async {
    if (!state.canResend) return;

    emit(state.copyWith(screenState: const LoadingState()));
    final result = await _authRepository.forgotPassword(email: email);
    result.fold(
      (failure) => emit(state.copyWith(screenState: FailureState(failure))),
      (_) {
        emit(state.copyWith(screenState: const SuccessState()));
        startTimer();
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
