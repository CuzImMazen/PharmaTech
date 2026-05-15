import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_state.freezed.dart';

@freezed
sealed class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.authenticated({
    required String accessToken,
    required String refreshToken,
  }) = _Authenticated;
  const factory SessionState.unauthenticated() = _Unauthenticated;
}
