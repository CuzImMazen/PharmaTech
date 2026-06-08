import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_model.g.dart';

@JsonSerializable()
class PharmacyModel {
  final String name;

  @JsonKey(name: 'governorate_id')
  final int governorateId;

  @JsonKey(name: 'city_id')
  final int cityId;

  final String? address;

  @JsonKey(name: 'license_number')
  final String licenseNumber;

  PharmacyModel({
    required this.name,
    required this.governorateId,
    required this.cityId,
    required this.licenseNumber,
    this.address,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyModelToJson(this);
}
