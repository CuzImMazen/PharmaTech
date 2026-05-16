import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = _Loading;
  const factory ForgetPasswordState.success() = _Success;
  const factory ForgetPasswordState.failure(Failure failure) = _Failure;
}
