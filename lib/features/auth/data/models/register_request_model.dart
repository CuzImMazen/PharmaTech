import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String pharmacyName;
  final String cityId;
  final String detailedAddress;
  final String pharmacyLicense;
  final String email;
  final String password;
  final String passwordConfirmation;

  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.pharmacyName,
    required this.cityId,
    required this.detailedAddress,
    required this.pharmacyLicense,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
