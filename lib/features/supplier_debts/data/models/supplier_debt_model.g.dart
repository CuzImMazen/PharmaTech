// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_debt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierDebtModel _$SupplierDebtModelFromJson(Map<String, dynamic> json) =>
    SupplierDebtModel(
      id: (json['id'] as num).toInt(),
      supplierId: (json['supplier_id'] as num).toInt(),
      purchaseInvoiceId: (json['purchase_invoice_id'] as num?)?.toInt(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      remainingAmount: (json['remaining_amount'] as num).toDouble(),
      dueDate: json['due_date'] as String?,
      status: SupplierDebtModel._parseDebtStatus(json['status']),
      supplier: json['supplier'] == null
          ? null
          : SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
      payments: SupplierDebtModel._parsePayments(json['payments']),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

SupplierDebtPaymentModel _$SupplierDebtPaymentModelFromJson(
  Map<String, dynamic> json,
) => SupplierDebtPaymentModel(
  id: (json['id'] as num).toInt(),
  cashTransactionId: (json['cash_transaction_id'] as num).toInt(),
  amount: (json['amount'] as num).toDouble(),
  paymentDate: json['payment_date'] as String,
  notes: json['notes'] as String?,
  createdBy: SupplierDebtPaymentModel._parseCreatedBy(json['created_by']),
  createdAt: json['created_at'] as String?,
);

SupplierDebtPaymentUser _$SupplierDebtPaymentUserFromJson(
  Map<String, dynamic> json,
) => SupplierDebtPaymentUser(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
);
