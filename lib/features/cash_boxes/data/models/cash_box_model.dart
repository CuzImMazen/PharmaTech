import 'package:json_annotation/json_annotation.dart';

part 'cash_box_model.g.dart';

/// The pharmacy's single cash box. Mirrors the backend `CashBoxResource`
/// (`GET /cash-boxes`, `POST /cash-boxes`). There is one box per pharmacy;
/// `GET /cash-boxes` returns 404 when none exists yet.
@JsonSerializable()
class CashBoxModel {
  const CashBoxModel({
    required this.id,
    required this.openingBalance,
    required this.currentBalance,
    this.createdAt,
    this.updatedAt,
  });

  final int id;

  @JsonKey(name: 'opening_balance')
  final double openingBalance;

  @JsonKey(name: 'current_balance')
  final double currentBalance;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  factory CashBoxModel.fromJson(Map<String, dynamic> json) =>
      _$CashBoxModelFromJson(json);
}
