// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_debt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDebtModel _$CustomerDebtModelFromJson(Map<String, dynamic> json) =>
    CustomerDebtModel(
      id: (json['id'] as num).toInt(),
      customerId: (json['customer_id'] as num).toInt(),
      salesInvoiceId: (json['sales_invoice_id'] as num?)?.toInt(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      remainingAmount: (json['remaining_amount'] as num).toDouble(),
      dueDate: json['due_date'] as String?,
      status: CustomerDebtModel._parseDebtStatus(json['status']),
      customer: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
