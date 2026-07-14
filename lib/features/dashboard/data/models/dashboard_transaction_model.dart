import 'package:json_annotation/json_annotation.dart';

part 'dashboard_transaction_model.g.dart';

/// A recent transaction on the dashboard.
/// Mirrors the backend `GET /dashboard/transactions` list items.
@JsonSerializable(createToJson: false)
class DashboardTransactionModel {
  const DashboardTransactionModel({
    required this.id,
    required this.type,
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.amount,
    required this.paymentStatus,
    this.createdAt,
  });

  final int id;

  @JsonKey(name: 'type', fromJson: _parseType)
  final DashboardTransactionType type;

  @JsonKey(name: 'invoice_number')
  final String invoiceNumber;

  @JsonKey(name: 'invoice_date')
  final String invoiceDate;

  @JsonKey(fromJson: _parseAmount)
  final double amount;

  @JsonKey(name: 'payment_status')
  final String paymentStatus;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  factory DashboardTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardTransactionModelFromJson(json);

  static DashboardTransactionType _parseType(dynamic value) {
    return DashboardTransactionType.values.firstWhere(
      (e) => e.backendValue == value.toString(),
      orElse: () => DashboardTransactionType.sale,
    );
  }

  static double _parseAmount(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}

enum DashboardTransactionType { sale, purchase, customerReturn, supplierReturn }

extension DashboardTransactionTypeX on DashboardTransactionType {
  String get backendValue {
    return switch (this) {
      DashboardTransactionType.sale => 'sale',
      DashboardTransactionType.purchase => 'purchase',
      DashboardTransactionType.customerReturn => 'customer_return',
      DashboardTransactionType.supplierReturn => 'supplier_return',
    };
  }

  bool get isIncoming {
    return switch (this) {
      DashboardTransactionType.sale => true,
      DashboardTransactionType.purchase => false,
      DashboardTransactionType.customerReturn => false,
      DashboardTransactionType.supplierReturn => true,
    };
  }
}
