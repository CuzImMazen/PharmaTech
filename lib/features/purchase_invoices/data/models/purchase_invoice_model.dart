import 'package:json_annotation/json_annotation.dart';

import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';

part 'purchase_invoice_model.g.dart';

/// A purchase invoice. Mirrors the backend `PurchaseInvoiceResource`
/// (`GET /purchase-invoices`, `GET /purchase-invoices/{id}`). The index
/// endpoint omits `items` (loaded only on show / create-response / cancel);
/// `supplier_debt` is always present (null when none).
@JsonSerializable(createToJson: false)
class PurchaseInvoiceModel {
  const PurchaseInvoiceModel({
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
    this.supplier,
    this.createdBy,
    this.items,
    this.supplierDebt,
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

  final SupplierModel? supplier;

  @JsonKey(name: 'created_by', fromJson: _parseCreatedBy)
  final PurchaseInvoiceUser? createdBy;

  /// Loaded on show + create-response + cancel-response; omitted on index.
  @JsonKey(fromJson: _parseItems)
  final List<PurchaseInvoiceItemModel>? items;

  /// Always present (null when the invoice isn't on credit/debt with a due).
  @JsonKey(name: 'supplier_debt')
  final SupplierDebtModel? supplierDebt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  bool get isCancelled => status == InvoiceStatus.cancelled;

  factory PurchaseInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseInvoiceModelFromJson(json);

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

  static PurchaseInvoiceUser? _parseCreatedBy(dynamic value) {
    if (value is! Map<String, dynamic>) return null;
    return PurchaseInvoiceUser.fromJson(value);
  }

  static List<PurchaseInvoiceItemModel>? _parseItems(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;
    return value
        .whereType<Map<String, dynamic>>()
        .map(PurchaseInvoiceItemModel.fromJson)
        .toList();
  }
}

/// How a purchase invoice was paid. Matches the backend enum column.
enum InvoicePaymentMethod { cash, credit, debt }

/// Payment progress on an invoice. Matches the backend enum column.
enum InvoicePaymentStatus { paid, partial, unpaid }

/// Lifecycle status of an invoice. Matches the backend enum column.
enum InvoiceStatus { completed, cancelled, pending }

/// A line item on a purchase invoice. The backend resource returns the
/// server-computed `line_total` and the nested `product`; `batch_number`,
/// `expiry_date`, and `selling_price` are request-only inputs (they flow into
/// `stock_batches`, not this resource).
@JsonSerializable(createToJson: false)
class PurchaseInvoiceItemModel {
  const PurchaseInvoiceItemModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.wholesalePrice,
    required this.tax,
    required this.discount,
    required this.lineTotal,
    this.product,
  });

  final int id;

  @JsonKey(name: 'product_id')
  final int productId;

  final int quantity;

  @JsonKey(name: 'wholesale_price')
  final double wholesalePrice;

  final double tax;
  final double discount;

  @JsonKey(name: 'line_total')
  final double lineTotal;

  final PurchaseInvoiceProductModel? product;

  factory PurchaseInvoiceItemModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseInvoiceItemModelFromJson(json);
}

/// Minimal product view nested in an invoice item. The backend `ProductResource`
/// is far richer than the invoice UI needs; we keep only the display fields.
@JsonSerializable(createToJson: false)
class PurchaseInvoiceProductModel {
  const PurchaseInvoiceProductModel({
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

  factory PurchaseInvoiceProductModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseInvoiceProductModelFromJson(json);
}

/// Minimal user view of who created the invoice.
@JsonSerializable(createToJson: false)
class PurchaseInvoiceUser {
  const PurchaseInvoiceUser({required this.id, this.firstName, this.lastName});

  final int id;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  String get displayName => [firstName, lastName]
      .whereType<String>()
      .where((s) => s.isNotEmpty)
      .join(' ');

  factory PurchaseInvoiceUser.fromJson(Map<String, dynamic> json) =>
      _$PurchaseInvoiceUserFromJson(json);
}
