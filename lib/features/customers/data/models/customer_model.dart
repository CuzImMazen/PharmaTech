import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

/// A customer for the pharmacy. Mirrors the backend `CustomerResource`
/// (`GET /customers`, `POST/PUT /customers/{id}`).
@JsonSerializable(createToJson: false)
class CustomerModel {
  const CustomerModel({
    required this.id,
    required this.fullName,
    this.phone,
    this.notes,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int id;

  @JsonKey(name: 'full_name')
  final String fullName;

  final String? phone;
  final String? notes;

  /// ISO-8601 datetime string; non-null only when the customer is soft-deleted.
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  /// Whether this customer is currently soft-deleted.
  bool get isDeleted => deletedAt != null;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is CustomerModel && other.id == id);

  @override
  int get hashCode => id.hashCode;
}
