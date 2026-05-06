import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated({required String token}) =
      _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
}
