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
  phoneNumber: json['phone_number'] as String?,
  avatar: json['avatar'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'email': instance.email,
  'first_name': instance.firstName,
  'father_name': instance.fatherName,
  'last_name': instance.lastName,
  'phone_number': instance.phoneNumber,
  'avatar': instance.avatar,
};
