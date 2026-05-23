// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      message: json['message'] as String?,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      pharmacy: json['pharmacy'] == null
          ? null
          : PharmacyModel.fromJson(json['pharmacy'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      isNewUser: json['is_new_user'] as bool?,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user.toJson(),
      'pharmacy': instance.pharmacy?.toJson(),
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'is_new_user': instance.isNewUser,
    };
