import 'package:json_annotation/json_annotation.dart';
import 'package:pharmacy_app/features/authentication/data/models/pharmacy_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/user_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponseModel {
  final String? message;
  final UserModel user;
  final PharmacyModel? pharmacy;

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'is_new_user')
  final bool? isNewUser;

  LoginResponseModel({
    this.message,
    required this.user,
    this.pharmacy,
    required this.accessToken,
    required this.refreshToken,
    this.isNewUser,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
