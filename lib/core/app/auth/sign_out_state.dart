import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';

part 'sign_out_state.freezed.dart';

/// Transient state of the sign-out actions: spinner flags + the latest failure
/// (surfaced via BlocListener). On success the session flips to unauthenticated
/// (driving the router to `/login`), so there is no "saved" flag here.
///
/// `isSigningOut` tracks the single-session `POST /logout`; `isSigningOutAll`
/// tracks the every-device `POST /logout-all`. The two are kept independent so
/// each row's spinner only spins for its own action while sharing one failure
/// surface.
@freezed
abstract class SignOutState with _$SignOutState {
  const factory SignOutState({
    @Default(false) bool isSigningOut,
    @Default(false) bool isSigningOutAll,
    Failure? failure,
  }) = _SignOutState;
}
