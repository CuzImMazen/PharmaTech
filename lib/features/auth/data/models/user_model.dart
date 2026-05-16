import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'father_name')
  final String? fatherName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'token_type')
  final String tokenType;

  UserModel({
    required this.email,
    required this.firstName,
    this.fatherName,
    required this.lastName,
    required this.phoneNumber,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
