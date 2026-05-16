import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading() = _Loading;
  const factory ResetPasswordState.success() = _Success;
  const factory ResetPasswordState.failure(Failure failure) = _Failure;
}
