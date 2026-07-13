// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_debt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDebtModel _$CustomerDebtModelFromJson(Map<String, dynamic> json) =>
    CustomerDebtModel(
      id: (json['id'] as num).toInt(),
      customerId: CustomerDebtModel._toInt(json['customer_id']),
      salesInvoiceId: CustomerDebtModel._toIntNullable(
        json['sales_invoice_id'],
      ),
      totalAmount: CustomerDebtModel._toDouble(json['total_amount']),
      paidAmount: CustomerDebtModel._toDouble(json['paid_amount']),
      remainingAmount: CustomerDebtModel._toDouble(json['remaining_amount']),
      dueDate: json['due_date'] as String?,
      status: CustomerDebtModel._parseDebtStatus(json['status']),
      customer: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      payments: CustomerDebtModel._parsePayments(json['payments']),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

CustomerDebtPaymentModel _$CustomerDebtPaymentModelFromJson(
  Map<String, dynamic> json,
) => CustomerDebtPaymentModel(
  id: (json['id'] as num).toInt(),
  cashTransactionId: CustomerDebtModel._toIntNullable(
    json['cash_transaction_id'],
  ),
  amount: CustomerDebtModel._toDouble(json['amount']),
  paymentDate: json['payment_date'] as String,
  notes: json['notes'] as String?,
  createdBy: CustomerDebtPaymentModel._parseCreatedBy(json['created_by']),
  createdAt: json['created_at'] as String?,
);

CustomerDebtPaymentUser _$CustomerDebtPaymentUserFromJson(
  Map<String, dynamic> json,
) => CustomerDebtPaymentUser(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
);
