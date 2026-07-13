import 'package:json_annotation/json_annotation.dart';

import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';

part 'supplier_debt_model.g.dart';

/// A debt owed to a supplier, created server-side from a `payment_method:
/// debt` purchase invoice. Mirrors the backend `SupplierDebtResource`
/// (`GET /supplier-debts`, `GET /supplier-debts/{id}`). Read-only from the
/// client's perspective — no create/update endpoints exist.
@JsonSerializable(createToJson: false)
class SupplierDebtModel {
  const SupplierDebtModel({
    required this.id,
    required this.supplierId,
    this.purchaseInvoiceId,
    required this.totalAmount,
    required this.paidAmount,
    required this.remainingAmount,
    this.dueDate,
    required this.status,
    this.supplier,
    this.payments,
    this.createdAt,
    this.updatedAt,
  });

  final int id;

  @JsonKey(name: 'supplier_id')
  final int supplierId;

  @JsonKey(name: 'purchase_invoice_id')
  final int? purchaseInvoiceId;

  @JsonKey(name: 'total_amount')
  final double totalAmount;

  @JsonKey(name: 'paid_amount')
  final double paidAmount;

  @JsonKey(name: 'remaining_amount')
  final double remainingAmount;

  @JsonKey(name: 'due_date')
  final String? dueDate;

  @JsonKey(fromJson: _parseDebtStatus)
  final SupplierDebtStatus status;

  /// Loaded on both index and show.
  final SupplierModel? supplier;

  /// Payments made against this debt. Loaded on `show` only (omitted on index).
  @JsonKey(fromJson: _parsePayments)
  final List<SupplierDebtPaymentModel>? payments;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  factory SupplierDebtModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierDebtModelFromJson(json);

  static SupplierDebtStatus _parseDebtStatus(dynamic value) {
    return SupplierDebtStatus.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => SupplierDebtStatus.open,
    );
  }

  static List<SupplierDebtPaymentModel>? _parsePayments(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;
    return value
        .whereType<Map<String, dynamic>>()
        .map(SupplierDebtPaymentModel.fromJson)
        .toList();
  }
}

/// The lifecycle of a supplier debt. Matches the backend enum column.
enum SupplierDebtStatus { open, partial, paid, overdue, cancelled }

/// A single payment made against a supplier debt. Mirrors the backend
/// `SupplierDebtPaymentResource` (loaded on `GET /supplier-debts/{id}`). Each
/// payment is tied to a cash-box transaction.
@JsonSerializable(createToJson: false)
class SupplierDebtPaymentModel {
  const SupplierDebtPaymentModel({
    required this.id,
    required this.cashTransactionId,
    required this.amount,
    required this.paymentDate,
    this.notes,
    this.createdBy,
    this.createdAt,
  });

  final int id;

  @JsonKey(name: 'cash_transaction_id')
  final int cashTransactionId;

  final double amount;

  @JsonKey(name: 'payment_date')
  final String paymentDate;

  final String? notes;

  @JsonKey(name: 'created_by', fromJson: _parseCreatedBy)
  final SupplierDebtPaymentUser? createdBy;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  factory SupplierDebtPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierDebtPaymentModelFromJson(json);

  static SupplierDebtPaymentUser? _parseCreatedBy(dynamic value) {
    if (value is! Map<String, dynamic>) return null;
    return SupplierDebtPaymentUser.fromJson(value);
  }
}

/// Minimal user view of who recorded the payment.
@JsonSerializable(createToJson: false)
class SupplierDebtPaymentUser {
  const SupplierDebtPaymentUser({
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

  factory SupplierDebtPaymentUser.fromJson(Map<String, dynamic> json) =>
      _$SupplierDebtPaymentUserFromJson(json);
}
