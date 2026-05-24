// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDetailsModel _$RegisterDetailsModelFromJson(
  Map<String, dynamic> json,
) => RegisterDetailsModel(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phoneNumber: json['phone_number'] as String,
  pharmacyName: json['pharmacy_name'] as String,
  governorateId: (json['governorate_id'] as num).toInt(),
  cityId: (json['city_id'] as num).toInt(),
  address: json['address'] as String,
  licenceNumber: json['licence_number'] as String,
);

Map<String, dynamic> _$RegisterDetailsModelToJson(
  RegisterDetailsModel instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone_number': instance.phoneNumber,
  'pharmacy_name': instance.pharmacyName,
  'governorate_id': instance.governorateId,
  'city_id': instance.cityId,
  'address': instance.address,
  'licence_number': instance.licenceNumber,
};
