import 'package:json_annotation/json_annotation.dart';

import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';

part 'customer_debt_model.g.dart';

/// A debt a customer owes the pharmacy, created server-side when a sales
/// invoice isn't fully paid. Mirrors the backend `CustomerDebtResource`
/// (nested inside the `SalesInvoiceResource` — there's no dedicated route).
/// Read-only from the client's perspective.
///
/// Reuses [SupplierDebtStatus] — the backend uses the same enum column
/// (`open, partial, paid, overdue, cancelled`) for both debt kinds, so we
/// share one enum to avoid drift. The status labels/tones in
/// `supplier_debt_card.dart` apply to it directly.
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
    this.createdAt,
    this.updatedAt,
  });

  final int id;

  @JsonKey(name: 'customer_id')
  final int customerId;

  @JsonKey(name: 'sales_invoice_id')
  final int? salesInvoiceId;

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

  final CustomerModel? customer;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  factory CustomerDebtModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDebtModelFromJson(json);

  static SupplierDebtStatus _parseDebtStatus(dynamic value) {
    return SupplierDebtStatus.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => SupplierDebtStatus.open,
    );
  }
}
