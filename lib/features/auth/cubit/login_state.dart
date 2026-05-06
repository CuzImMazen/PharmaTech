import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool rememberMe,
    @Default(InitialState()) ScreenState screenState,
  }) = _LoginState;
}
