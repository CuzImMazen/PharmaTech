import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/authentication/data/models/complete_profile/complete_profile_response_model.dart';
part 'complete_profile_state.freezed.dart';

@freezed
class CompleteProfileState with _$CompleteProfileState {
  const factory CompleteProfileState.initial() = _Initial;
  const factory CompleteProfileState.loading() = _Loading;
  const factory CompleteProfileState.success(
    CompleteProfileResponseModel response,
  ) = _Success;
  const factory CompleteProfileState.failure(Failure failure) = _Failure;
}
