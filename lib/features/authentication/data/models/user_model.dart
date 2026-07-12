import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;

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

  /// ISO-8601 timestamp the email was verified at, or null. The backend's
  /// `GET /user` returns this raw column (not an `is_verified` boolean).
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;

  /// Backend user status: `active` | `suspended` | `inactive`.
  final String? status;

  UserModel({
    this.id,
    required this.email,
    required this.firstName,
    this.fatherName,
    required this.lastName,
    this.phoneNumber,
    this.avatar,
    this.emailVerifiedAt,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Convenience: whether the email has been verified.
  bool get isVerified => emailVerifiedAt != null;
}
