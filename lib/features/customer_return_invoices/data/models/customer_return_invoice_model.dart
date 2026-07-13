import 'package:json_annotation/json_annotation.dart';

import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';

part 'customer_return_invoice_model.g.dart';

/// A customer return invoice. Mirrors the backend
/// `CustomerReturnInvoiceResource` (`GET /customer-return-invoices`,
/// `GET /customer-return-invoices/{id}`). The index endpoint omits `items`
/// (loaded only on show / create-response / cancel).
///
/// Reuses the existing [SalesInvoiceProductModel] for the nested product on
/// items (it already carries `brand_name`, `ar_name`, `barcode`, and
/// `selling_price`), and [CustomerModel] for the (nullable) customer.
@JsonSerializable(createToJson: false)
class CustomerReturnInvoiceModel {
  const CustomerReturnInvoiceModel({
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
    this.customer,
    this.originalSalesInvoiceId,
    this.items,
    this.createdBy,
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

  final CustomerModel? customer;

  @JsonKey(name: 'original_sales_invoice_id')
  final int? originalSalesInvoiceId;

  /// Loaded on show + create-response + cancel-response; omitted on index.
  @JsonKey(fromJson: _parseItems)
  final List<CustomerReturnItemModel>? items;

  @JsonKey(name: 'created_by', fromJson: _parseCreatedBy)
  final CustomerReturnInvoiceUser? createdBy;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  bool get isCancelled => status == ReturnInvoiceStatus.cancelled;

  factory CustomerReturnInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerReturnInvoiceModelFromJson(json);

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

  static CustomerReturnInvoiceUser? _parseCreatedBy(dynamic value) {
    if (value is! Map<String, dynamic>) return null;
    return CustomerReturnInvoiceUser.fromJson(value);
  }

  static List<CustomerReturnItemModel>? _parseItems(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;
    return value
        .whereType<Map<String, dynamic>>()
        .map(CustomerReturnItemModel.fromJson)
        .toList();
  }
}

/// A line item on a customer return invoice. The backend resource returns the
/// server-computed `line_total` and the nested `product`. Return items carry a
/// `unit_price` (the price being refunded per unit) plus optional tax/discount.
@JsonSerializable(createToJson: false)
class CustomerReturnItemModel {
  const CustomerReturnItemModel({
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

  /// Reuses the sales-invoice product view (brand_name, ar_name, barcode,
  /// selling_price) — the nested product shape is identical for returns.
  final SalesInvoiceProductModel? product;

  factory CustomerReturnItemModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerReturnItemModelFromJson(json);
}

/// Minimal user view of who created the return invoice.
@JsonSerializable(createToJson: false)
class CustomerReturnInvoiceUser {
  const CustomerReturnInvoiceUser({required this.id, this.firstName, this.lastName});

  final int id;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  String get displayName => [firstName, lastName]
      .whereType<String>()
      .where((s) => s.isNotEmpty)
      .join(' ');

  factory CustomerReturnInvoiceUser.fromJson(Map<String, dynamic> json) =>
      _$CustomerReturnInvoiceUserFromJson(json);
}

/// How a return was refunded to the customer. Matches the backend enum column.
enum ReturnRefundMethod { cash, credit }

/// Lifecycle status of a customer return invoice. Matches the backend enum
/// column. Mirrors the shape of [InvoiceStatus] from purchase-invoices.
enum ReturnInvoiceStatus { completed, cancelled, pending }
