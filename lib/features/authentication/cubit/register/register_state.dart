import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success() = _Success;
  const factory RegisterState.failure(Failure failure) = _Failure;
}
