import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import '../../../core/enums/enums.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool rememberMe,
    @Default(false) bool acceptTerms,

    @Default(ScreenState.initial) ScreenState status,

    Failure? failure,
  }) = _LoginState;
}
