import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';

part 'resend_email_verification_state.freezed.dart';

@freezed
sealed class ResendEmailVerificationState with _$ResendEmailVerificationState {
  const factory ResendEmailVerificationState({
    @Default(0) int remainingSeconds,
    @Default(InitialState()) ScreenState screenState,
  }) = _ResendEmailVerificationState;

  const ResendEmailVerificationState._();

  bool get canResend => remainingSeconds == 0 && screenState is! LoadingState;
}
