import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/authentication/data/models/login/login_response_model.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.googleLoading() =
      _GoogleLoading; // Google button loading
  const factory LoginState.success(LoginResponseModel response) = _Success;
  const factory LoginState.failure(Failure failure) = _Failure;
}
