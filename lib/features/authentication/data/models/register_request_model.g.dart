// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => RegisterRequestModel(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  pharmacyName: json['pharmacyName'] as String,
  cityId: json['cityId'] as String,
  detailedAddress: json['detailedAddress'] as String,
  pharmacyLicense: json['pharmacyLicense'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  passwordConfirmation: json['passwordConfirmation'] as String,
);

Map<String, dynamic> _$RegisterRequestModelToJson(
  RegisterRequestModel instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'phoneNumber': instance.phoneNumber,
  'pharmacyName': instance.pharmacyName,
  'cityId': instance.cityId,
  'detailedAddress': instance.detailedAddress,
  'pharmacyLicense': instance.pharmacyLicense,
  'email': instance.email,
  'password': instance.password,
  'passwordConfirmation': instance.passwordConfirmation,
};
