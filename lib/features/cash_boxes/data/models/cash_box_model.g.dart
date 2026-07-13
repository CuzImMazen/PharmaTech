// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_box_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashBoxModel _$CashBoxModelFromJson(Map<String, dynamic> json) => CashBoxModel(
  id: (json['id'] as num).toInt(),
  openingBalance: (json['opening_balance'] as num).toDouble(),
  currentBalance: (json['current_balance'] as num).toDouble(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);
