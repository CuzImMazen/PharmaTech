import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  CompanyModel(this.id, this.name, this.phone, this.email, this.address);

  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  /// Id-based equality so a pre-selected company (from an existing supplier)
  /// matches a freshly-fetched one in a `CustomDropdownField` by id, not
  /// by instance identity.
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is CompanyModel && other.id == id);

  @override
  int get hashCode => id.hashCode;
}
