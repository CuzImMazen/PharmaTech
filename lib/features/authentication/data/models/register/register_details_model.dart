import 'package:json_annotation/json_annotation.dart';

part 'register_details_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterDetailsModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String pharmacyName;
  final int governorateId;
  final int cityId;
  final String address;
  final String licenceNumber;

  RegisterDetailsModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.pharmacyName,
    required this.governorateId,
    required this.cityId,
    required this.address,
    required this.licenceNumber,
  });

  factory RegisterDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDetailsModelToJson(this);
}
