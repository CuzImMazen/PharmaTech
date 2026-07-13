import 'package:json_annotation/json_annotation.dart';

part 'cash_transaction_model.g.dart';

/// A movement on the pharmacy's cash box. Mirrors the backend
/// `CashTransactionResource` (`GET /cash-boxes/transactions`). The running
/// balance is NOT per-transaction — it lives only on `cash_boxes.current_balance`.
@JsonSerializable(createToJson: false)
class CashTransactionModel {
  const CashTransactionModel({
    required this.id,
    required this.transactionType,
    required this.amount,
    this.referenceType,
    this.referenceId,
    this.notes,
    required this.transactionTime,
    this.createdBy,
    this.createdAt,
  });

  final int id;

  @JsonKey(name: 'transaction_type', fromJson: _parseTransactionType)
  final CashTransactionType transactionType;

  final double amount;

  @JsonKey(name: 'reference_type')
  final String? referenceType;

  @JsonKey(name: 'reference_id')
  final int? referenceId;

  final String? notes;

  @JsonKey(name: 'transaction_time')
  final String transactionTime;

  /// Name of the user who recorded the transaction, when loaded.
  @JsonKey(name: 'created_by', fromJson: _parseCreatedBy)
  final CashTransactionUser? createdBy;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  factory CashTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$CashTransactionModelFromJson(json);

  static CashTransactionType _parseTransactionType(dynamic value) {
    return CashTransactionType.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => CashTransactionType.manualIn,
    );
  }

  static CashTransactionUser? _parseCreatedBy(dynamic value) {
    if (value == null) return null;
    if (value is! Map<String, dynamic>) return null;
    return CashTransactionUser.fromJson(value);
  }
}

/// The 8 cash-box movement types the backend records. `_in` suffix means money
/// into the box; `_out` means money out.
enum CashTransactionType {
  purchaseOut,
  saleIn,
  customerReturnOut,
  supplierReturnIn,
  customerDebtPaymentIn,
  supplierDebtPaymentOut,
  manualIn,
  manualOut,
}

extension CashTransactionTypeX on CashTransactionType {
  /// `true` when this movement increases the box balance.
  bool get isIn => name.endsWith('In');

  /// `true` when this movement decreases the box balance.
  bool get isOut => !isIn;

  /// Backend value stored in the `transaction_type` enum column (snake_case).
  String get backendValue {
    return switch (this) {
      CashTransactionType.purchaseOut => 'purchase_out',
      CashTransactionType.saleIn => 'sale_in',
      CashTransactionType.customerReturnOut => 'customer_return_out',
      CashTransactionType.supplierReturnIn => 'supplier_return_in',
      CashTransactionType.customerDebtPaymentIn => 'customer_debt_payment_in',
      CashTransactionType.supplierDebtPaymentOut => 'supplier_debt_payment_out',
      CashTransactionType.manualIn => 'manual_in',
      CashTransactionType.manualOut => 'manual_out',
    };
  }
}

/// A minimal view of the user who recorded a transaction (the backend
/// `UserResource` is far richer than we need here).
@JsonSerializable(createToJson: false)
class CashTransactionUser {
  const CashTransactionUser({required this.id, this.firstName, this.lastName});

  final int id;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  /// Best-effort display name.
  String get displayName => [
    firstName,
    lastName,
  ].whereType<String>().where((s) => s.isNotEmpty).join(' ');

  factory CashTransactionUser.fromJson(Map<String, dynamic> json) =>
      _$CashTransactionUserFromJson(json);
}
