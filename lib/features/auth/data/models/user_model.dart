import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'father_name')
  final String fatherName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'licence_number')
  final String licenceNumber;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.fatherName,
    required this.lastName,
    required this.phoneNumber,
    required this.licenceNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
