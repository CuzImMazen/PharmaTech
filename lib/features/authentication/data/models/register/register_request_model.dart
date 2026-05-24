import 'package:json_annotation/json_annotation.dart';

import 'register_details_model.dart';

part 'register_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterRequestModel extends RegisterDetailsModel {
  final String email;
  final String password;
  final String passwordConfirmation;

  RegisterRequestModel({
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.pharmacyName,
    required super.cityId,
    required super.governorateId,
    required super.address,
    required super.licenceNumber,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
