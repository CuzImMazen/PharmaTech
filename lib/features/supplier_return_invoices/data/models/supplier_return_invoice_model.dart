import 'package:json_annotation/json_annotation.dart';

import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';

part 'supplier_return_invoice_model.g.dart';

/// A supplier return invoice. Mirrors the backend
/// `SupplierReturnInvoiceResource` (`GET /supplier-return-invoices`,
/// `GET /supplier-return-invoices/{id}`). The index endpoint omits `items`
/// (loaded only on show / create-response / cancel).
@JsonSerializable(createToJson: false)
class SupplierReturnInvoiceModel {
  const SupplierReturnInvoiceModel({
    required this.id,
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.subtotal,
    required this.taxTotal,
    required this.discountTotal,
    required this.refundTotal,
    required this.refundMethod,
    required this.status,
    this.reason,
    this.notes,
    this.supplier,
    this.originalPurchaseInvoiceId,
    this.createdBy,
    this.items,
    this.createdAt,
    this.updatedAt,
  });

  final int id;

  @JsonKey(name: 'invoice_number')
  final String invoiceNumber;

  @JsonKey(name: 'invoice_date')
  final String invoiceDate;

  final double subtotal;

  @JsonKey(name: 'tax_total')
  final double taxTotal;

  @JsonKey(name: 'discount_total')
  final double discountTotal;

  @JsonKey(name: 'refund_total')
  final double refundTotal;

  @JsonKey(name: 'refund_method', fromJson: _parseRefundMethod)
  final ReturnRefundMethod refundMethod;

  @JsonKey(fromJson: _parseReturnStatus)
  final ReturnInvoiceStatus status;

  final String? reason;
  final String? notes;

  final SupplierModel? supplier;

  @JsonKey(name: 'original_purchase_invoice_id')
  final int? originalPurchaseInvoiceId;

  @JsonKey(name: 'created_by', fromJson: _parseCreatedBy)
  final PurchaseInvoiceUser? createdBy;

  /// Loaded on show + create-response + cancel-response; omitted on index.
  @JsonKey(fromJson: _parseItems)
  final List<SupplierReturnItemModel>? items;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  bool get isCancelled => status == ReturnInvoiceStatus.cancelled;

  factory SupplierReturnInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierReturnInvoiceModelFromJson(json);

  static ReturnRefundMethod _parseRefundMethod(dynamic value) {
    return ReturnRefundMethod.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => ReturnRefundMethod.cash,
    );
  }

  static ReturnInvoiceStatus _parseReturnStatus(dynamic value) {
    return ReturnInvoiceStatus.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => ReturnInvoiceStatus.completed,
    );
  }

  static PurchaseInvoiceUser? _parseCreatedBy(dynamic value) {
    if (value is! Map<String, dynamic>) return null;
    return PurchaseInvoiceUser.fromJson(value);
  }

  static List<SupplierReturnItemModel>? _parseItems(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;
    return value
        .whereType<Map<String, dynamic>>()
        .map(SupplierReturnItemModel.fromJson)
        .toList();
  }
}

/// How a supplier return is refunded. Matches the backend enum column.
enum ReturnRefundMethod { cash, credit }

/// Lifecycle status of a supplier return invoice. Matches the backend enum column.
enum ReturnInvoiceStatus { completed, cancelled, pending }

/// A line item on a supplier return invoice. The backend resource returns the
/// server-computed `line_total` and the nested `product`.
@JsonSerializable(createToJson: false)
class SupplierReturnItemModel {
  const SupplierReturnItemModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.tax,
    required this.discount,
    required this.lineTotal,
    this.product,
  });

  final int id;

  @JsonKey(name: 'product_id')
  final int productId;

  final int quantity;

  @JsonKey(name: 'unit_price')
  final double unitPrice;

  final double tax;
  final double discount;

  @JsonKey(name: 'line_total')
  final double lineTotal;

  final PurchaseInvoiceProductModel? product;

  factory SupplierReturnItemModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierReturnItemModelFromJson(json);
}
