import 'package:json_annotation/json_annotation.dart';

import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/customer_debt_model.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';

part 'sales_invoice_model.g.dart';

/// A sales invoice. Mirrors the backend `SalesInvoiceResource`
/// (`GET /sales-invoices`, `GET /sales-invoices/{id}`). The index endpoint
/// omits `items` (loaded only on show / create-response / cancel);
/// `customer_debt` is always present (null when none).
///
/// Reuses the [InvoicePaymentMethod], [InvoicePaymentStatus], and
/// [InvoiceStatus] enums from the purchase-invoices feature — they match the
/// backend's shared enum columns, so there's no drift.
@JsonSerializable(createToJson: false)
class SalesInvoiceModel {
  const SalesInvoiceModel({
    required this.id,
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.subtotal,
    required this.taxTotal,
    required this.discountTotal,
    required this.grandTotal,
    required this.amountPaid,
    required this.amountDue,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.status,
    this.notes,
    this.customer,
    this.createdBy,
    this.items,
    this.customerDebt,
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

  @JsonKey(name: 'grand_total')
  final double grandTotal;

  @JsonKey(name: 'amount_paid')
  final double amountPaid;

  @JsonKey(name: 'amount_due')
  final double amountDue;

  @JsonKey(name: 'payment_method', fromJson: _parsePaymentMethod)
  final InvoicePaymentMethod paymentMethod;

  @JsonKey(name: 'payment_status', fromJson: _parsePaymentStatus)
  final InvoicePaymentStatus paymentStatus;

  @JsonKey(fromJson: _parseInvoiceStatus)
  final InvoiceStatus status;

  final String? notes;

  final CustomerModel? customer;

  @JsonKey(name: 'created_by', fromJson: _parseCreatedBy)
  final SalesInvoiceUser? createdBy;

  /// Loaded on show + create-response + cancel-response; omitted on index.
  @JsonKey(fromJson: _parseItems)
  final List<SalesInvoiceItemModel>? items;

  /// Always present (null when the sale was fully paid, so no debt was created).
  @JsonKey(name: 'customer_debt')
  final CustomerDebtModel? customerDebt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  bool get isCancelled => status == InvoiceStatus.cancelled;

  factory SalesInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceModelFromJson(json);

  static InvoicePaymentMethod _parsePaymentMethod(dynamic value) {
    return InvoicePaymentMethod.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => InvoicePaymentMethod.cash,
    );
  }

  static InvoicePaymentStatus _parsePaymentStatus(dynamic value) {
    return InvoicePaymentStatus.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => InvoicePaymentStatus.unpaid,
    );
  }

  static InvoiceStatus _parseInvoiceStatus(dynamic value) {
    return InvoiceStatus.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => InvoiceStatus.completed,
    );
  }

  static SalesInvoiceUser? _parseCreatedBy(dynamic value) {
    if (value is! Map<String, dynamic>) return null;
    return SalesInvoiceUser.fromJson(value);
  }

  static List<SalesInvoiceItemModel>? _parseItems(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;
    return value
        .whereType<Map<String, dynamic>>()
        .map(SalesInvoiceItemModel.fromJson)
        .toList();
  }
}

/// A line item on a sales invoice. The backend resource returns the
/// server-computed `line_total` and the nested `product`. Sales items carry a
/// `selling_price` (the retail price charged) rather than a wholesale price,
/// and no batch/expiry inputs — stock is decremented server-side (FIFO).
@JsonSerializable(createToJson: false)
class SalesInvoiceItemModel {
  const SalesInvoiceItemModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.sellingPrice,
    required this.tax,
    required this.discount,
    required this.lineTotal,
    this.product,
  });

  final int id;

  @JsonKey(name: 'product_id')
  final int productId;

  final int quantity;

  @JsonKey(name: 'selling_price')
  final double sellingPrice;

  final double tax;
  final double discount;

  @JsonKey(name: 'line_total')
  final double lineTotal;

  final SalesInvoiceProductModel? product;

  factory SalesInvoiceItemModel.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceItemModelFromJson(json);
}

/// Minimal product view nested in a sales invoice item.
@JsonSerializable(createToJson: false)
class SalesInvoiceProductModel {
  const SalesInvoiceProductModel({
    required this.id,
    required this.brandName,
    this.arName,
    this.barcode,
    this.sellingPrice,
  });

  final int id;

  @JsonKey(name: 'brand_name')
  final String brandName;

  @JsonKey(name: 'ar_name')
  final String? arName;

  final String? barcode;

  @JsonKey(name: 'selling_price')
  final double? sellingPrice;

  factory SalesInvoiceProductModel.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceProductModelFromJson(json);
}

/// Minimal user view of who created the invoice.
@JsonSerializable(createToJson: false)
class SalesInvoiceUser {
  const SalesInvoiceUser({required this.id, this.firstName, this.lastName});

  final int id;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  String get displayName => [firstName, lastName]
      .whereType<String>()
      .where((s) => s.isNotEmpty)
      .join(' ');

  factory SalesInvoiceUser.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceUserFromJson(json);
}
