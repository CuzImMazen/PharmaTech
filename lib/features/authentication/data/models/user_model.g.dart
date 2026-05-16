// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  fatherName: json['father_name'] as String?,
  lastName: json['last_name'] as String,
  phoneNumber: json['phone_number'] as String,
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  tokenType: json['token_type'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'email': instance.email,
  'first_name': instance.firstName,
  'father_name': instance.fatherName,
  'last_name': instance.lastName,
  'phone_number': instance.phoneNumber,
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'token_type': instance.tokenType,
};
