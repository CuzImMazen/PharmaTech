import 'package:json_annotation/json_annotation.dart';

import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';

part 'customer_debt_model.g.dart';

/// A debt owed to the pharmacy by a customer, created server-side from a
/// `payment_method: debt` sales invoice. Mirrors the backend
/// `CustomerDebtResource` (`GET /customer-debts`, `GET /customer-debts/{id}`).
@JsonSerializable(createToJson: false)
class CustomerDebtModel {
  const CustomerDebtModel({
    required this.id,
    required this.customerId,
    this.salesInvoiceId,
    required this.totalAmount,
    required this.paidAmount,
    required this.remainingAmount,
    this.dueDate,
    required this.status,
    this.customer,
    this.payments,
    this.createdAt,
    this.updatedAt,
  });

  final int id;

  @JsonKey(name: 'customer_id', fromJson: _toInt)
  final int customerId;

  @JsonKey(name: 'sales_invoice_id', fromJson: _toIntNullable)
  final int? salesInvoiceId;

  @JsonKey(name: 'total_amount', fromJson: _toDouble)
  final double totalAmount;

  @JsonKey(name: 'paid_amount', fromJson: _toDouble)
  final double paidAmount;

  @JsonKey(name: 'remaining_amount', fromJson: _toDouble)
  final double remainingAmount;

  @JsonKey(name: 'due_date')
  final String? dueDate;

  @JsonKey(fromJson: _parseDebtStatus)
  final CustomerDebtStatus status;

  /// Loaded on both index and show.
  final CustomerModel? customer;

  /// Payments made against this debt. Loaded on `show` only (omitted on index).
  @JsonKey(fromJson: _parsePayments)
  final List<CustomerDebtPaymentModel>? payments;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  factory CustomerDebtModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDebtModelFromJson(json);

  static CustomerDebtStatus _parseDebtStatus(dynamic value) {
    return CustomerDebtStatus.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => CustomerDebtStatus.open,
    );
  }

  static List<CustomerDebtPaymentModel>? _parsePayments(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;
    return value
        .whereType<Map<String, dynamic>>()
        .map(CustomerDebtPaymentModel.fromJson)
        .toList();
  }

  static int _toInt(dynamic value) => _parseNum(value)?.toInt() ?? 0;

  static int? _toIntNullable(dynamic value) => _parseNum(value)?.toInt();

  static double _toDouble(dynamic value) => _parseNum(value)?.toDouble() ?? 0.0;

  static num? _parseNum(dynamic value) {
    if (value == null) return null;
    if (value is num) return value;
    if (value is String) {
      final parsed = num.tryParse(value.trim());
      if (parsed != null) return parsed;
    }
    return null;
  }
}

/// The lifecycle of a customer debt. Matches the backend enum column
/// (`open`, `partial`, `paid`, `overdue`, `cancelled`).
enum CustomerDebtStatus { open, partial, paid, overdue, cancelled }

/// A single payment made against a customer debt. Mirrors the backend
/// `CustomerDebtPaymentResource` (loaded on `GET /customer-debts/{id}`). Each
/// payment is tied to a cash-box transaction.
@JsonSerializable(createToJson: false)
class CustomerDebtPaymentModel {
  const CustomerDebtPaymentModel({
    required this.id,
    this.cashTransactionId,
    required this.amount,
    required this.paymentDate,
    this.notes,
    this.createdBy,
    this.createdAt,
  });

  final int id;

  /// The linked cash-box transaction id. The backend resource omits this field
  /// for customer-debt payments, so it's treated as optional on the client.
  @JsonKey(name: 'cash_transaction_id', fromJson: CustomerDebtModel._toIntNullable)
  final int? cashTransactionId;

  @JsonKey(fromJson: CustomerDebtModel._toDouble)
  final double amount;

  @JsonKey(name: 'payment_date')
  final String paymentDate;

  final String? notes;

  @JsonKey(name: 'created_by', fromJson: _parseCreatedBy)
  final CustomerDebtPaymentUser? createdBy;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  factory CustomerDebtPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDebtPaymentModelFromJson(json);

  static CustomerDebtPaymentUser? _parseCreatedBy(dynamic value) {
    if (value is! Map<String, dynamic>) return null;
    return CustomerDebtPaymentUser.fromJson(value);
  }
}

/// Minimal user view of who recorded the payment.
@JsonSerializable(createToJson: false)
class CustomerDebtPaymentUser {
  const CustomerDebtPaymentUser({
    required this.id,
    this.firstName,
    this.lastName,
  });

  final int id;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  String get displayName => [
    firstName,
    lastName,
  ].whereType<String>().where((s) => s.isNotEmpty).join(' ');

  factory CustomerDebtPaymentUser.fromJson(Map<String, dynamic> json) =>
      _$CustomerDebtPaymentUserFromJson(json);
}
