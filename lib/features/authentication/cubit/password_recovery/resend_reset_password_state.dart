import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';

part 'resend_reset_password_state.freezed.dart';

@freezed
class ResendResetPasswordState with _$ResendResetPasswordState {
  const factory ResendResetPasswordState({
    @Default(0) int remainingSeconds,
    @Default(InitialState()) ScreenState screenState,
  }) = _ResendResetPasswordState;

  const ResendResetPasswordState._();

  bool get canResend => remainingSeconds == 0 && screenState is! LoadingState;
}
