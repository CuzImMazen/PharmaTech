// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => RegisterRequestModel(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phoneNumber: json['phone_number'] as String,
  pharmacyName: json['pharmacy_name'] as String,
  cityId: (json['city_id'] as num).toInt(),
  governorateId: (json['governorate_id'] as num).toInt(),
  address: json['address'] as String,
  licenceNumber: json['licence_number'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  passwordConfirmation: json['password_confirmation'] as String,
);

Map<String, dynamic> _$RegisterRequestModelToJson(
  RegisterRequestModel instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone_number': instance.phoneNumber,
  'pharmacy_name': instance.pharmacyName,
  'governorate_id': instance.governorateId,
  'city_id': instance.cityId,
  'address': instance.address,
  'licence_number': instance.licenceNumber,
  'email': instance.email,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
};
