import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/location/data/models/location_models.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.loading() = _Loading;

  const factory LocationState.loaded({
    required List<GovernorateModel> governorates,
  }) = _Loaded;

  const factory LocationState.failure({required Failure failure}) = _Failure;
}
