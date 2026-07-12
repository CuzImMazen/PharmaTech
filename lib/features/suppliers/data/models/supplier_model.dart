import 'package:json_annotation/json_annotation.dart';

import 'package:pharmacy_app/features/inventory/data/models/company_model.dart';

part 'supplier_model.g.dart';

/// A supplier for the pharmacy. Mirrors the backend `SupplierResource`
/// (`GET /suppliers`, `POST/PUT /suppliers/{id}`).
@JsonSerializable()
class SupplierModel {
  const SupplierModel({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.notes,
    this.deletedAt,
    this.company,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String? notes;

  /// ISO-8601 datetime string; non-null only when the supplier is soft-deleted.
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  /// The supplier's manufacturer/company, or `null` when none is set.
  final CompanyModel? company;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  /// Whether this supplier is currently soft-deleted.
  bool get isDeleted => deletedAt != null;

  factory SupplierModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierModelFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is SupplierModel && other.id == id);

  @override
  int get hashCode => id.hashCode;
}
