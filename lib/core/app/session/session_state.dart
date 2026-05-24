import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/features/authentication/data/models/user_model.dart';

part 'session_state.freezed.dart';

@freezed
sealed class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;

  // Cleaned up: No more crypto token strings, just your structured user data!
  const factory SessionState.authenticated({required UserModel user}) =
      _Authenticated;

  const factory SessionState.unauthenticated() = _Unauthenticated;
}
