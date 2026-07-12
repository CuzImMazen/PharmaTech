// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashTransactionModel _$CashTransactionModelFromJson(
  Map<String, dynamic> json,
) => CashTransactionModel(
  id: (json['id'] as num).toInt(),
  transactionType: CashTransactionModel._parseTransactionType(
    json['transaction_type'],
  ),
  amount: (json['amount'] as num).toDouble(),
  referenceType: json['reference_type'] as String?,
  referenceId: (json['reference_id'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  transactionTime: json['transaction_time'] as String,
  createdBy: CashTransactionModel._parseCreatedBy(json['created_by']),
  createdAt: json['created_at'] as String?,
);

CashTransactionUser _$CashTransactionUserFromJson(Map<String, dynamic> json) =>
    CashTransactionUser(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );
