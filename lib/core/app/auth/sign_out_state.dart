import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';

part 'sign_out_state.freezed.dart';

/// Transient state of the sign-out action: a spinner flag + the latest failure
/// (surfaced via BlocListener). On success the session flips to unauthenticated
/// (driving the router to `/login`), so there is no "saved" flag here.
@freezed
abstract class SignOutState with _$SignOutState {
  const factory SignOutState({
    @Default(false) bool isSigningOut,
    Failure? failure,
  }) = _SignOutState;
}
