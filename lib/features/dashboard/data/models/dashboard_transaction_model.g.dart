// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardTransactionModel _$DashboardTransactionModelFromJson(
  Map<String, dynamic> json,
) => DashboardTransactionModel(
  id: (json['id'] as num).toInt(),
  type: DashboardTransactionModel._parseType(json['type']),
  invoiceNumber: json['invoice_number'] as String,
  invoiceDate: json['invoice_date'] as String,
  amount: DashboardTransactionModel._parseAmount(json['amount']),
  paymentStatus: json['payment_status'] as String,
  createdAt: json['created_at'] as String?,
);
