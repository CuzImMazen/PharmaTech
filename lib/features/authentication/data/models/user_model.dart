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
  final String? phoneNumber;

  final String? avatar;

  UserModel({
    required this.email,
    required this.firstName,
    this.fatherName,
    required this.lastName,
    this.phoneNumber,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
