import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(String token) = _Success;
  const factory LoginState.failure(Failure failure) = _Failure;
}
