// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyModel _$PharmacyModelFromJson(Map<String, dynamic> json) =>
    PharmacyModel(
      name: json['name'] as String,
      governorateId: (json['governorate_id'] as num).toInt(),
      cityId: (json['city_id'] as num).toInt(),
      licenseNumber: json['license_number'] as String,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$PharmacyModelToJson(PharmacyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'governorate_id': instance.governorateId,
      'city_id': instance.cityId,
      'address': instance.address,
      'license_number': instance.licenseNumber,
    };
