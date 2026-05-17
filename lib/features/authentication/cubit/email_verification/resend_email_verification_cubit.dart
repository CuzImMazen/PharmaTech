import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';
import 'package:pharmacy_app/features/authentication/cubit/email_verification/resend_email_verification_state.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

class ResendEmailVerificationCubit extends Cubit<ResendEmailVerificationState> {
  ResendEmailVerificationCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const ResendEmailVerificationState()) {
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

  Future<void> resendEmailVerificationLink(String email) async {
    if (!state.canResend) return;

    emit(state.copyWith(screenState: const LoadingState()));
    final result = await _authRepository.resendVerificationEmail(email: email);
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
