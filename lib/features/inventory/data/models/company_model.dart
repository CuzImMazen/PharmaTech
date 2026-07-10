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
}
