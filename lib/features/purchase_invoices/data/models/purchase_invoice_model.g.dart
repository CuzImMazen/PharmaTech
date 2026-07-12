// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseInvoiceModel _$PurchaseInvoiceModelFromJson(
  Map<String, dynamic> json,
) => PurchaseInvoiceModel(
  id: (json['id'] as num).toInt(),
  invoiceNumber: json['invoice_number'] as String,
  invoiceDate: json['invoice_date'] as String,
  subtotal: (json['subtotal'] as num).toDouble(),
  taxTotal: (json['tax_total'] as num).toDouble(),
  discountTotal: (json['discount_total'] as num).toDouble(),
  grandTotal: (json['grand_total'] as num).toDouble(),
  amountPaid: (json['amount_paid'] as num).toDouble(),
  amountDue: (json['amount_due'] as num).toDouble(),
  paymentMethod: PurchaseInvoiceModel._parsePaymentMethod(
    json['payment_method'],
  ),
  paymentStatus: PurchaseInvoiceModel._parsePaymentStatus(
    json['payment_status'],
  ),
  status: PurchaseInvoiceModel._parseInvoiceStatus(json['status']),
  notes: json['notes'] as String?,
  supplier: json['supplier'] == null
      ? null
      : SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
  createdBy: PurchaseInvoiceModel._parseCreatedBy(json['created_by']),
  items: PurchaseInvoiceModel._parseItems(json['items']),
  supplierDebt: json['supplier_debt'] == null
      ? null
      : SupplierDebtModel.fromJson(
          json['supplier_debt'] as Map<String, dynamic>,
        ),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

PurchaseInvoiceItemModel _$PurchaseInvoiceItemModelFromJson(
  Map<String, dynamic> json,
) => PurchaseInvoiceItemModel(
  id: (json['id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  wholesalePrice: (json['wholesale_price'] as num).toDouble(),
  tax: (json['tax'] as num).toDouble(),
  discount: (json['discount'] as num).toDouble(),
  lineTotal: (json['line_total'] as num).toDouble(),
  product: json['product'] == null
      ? null
      : PurchaseInvoiceProductModel.fromJson(
          json['product'] as Map<String, dynamic>,
        ),
);

PurchaseInvoiceProductModel _$PurchaseInvoiceProductModelFromJson(
  Map<String, dynamic> json,
) => PurchaseInvoiceProductModel(
  id: (json['id'] as num).toInt(),
  brandName: json['brand_name'] as String,
  arName: json['ar_name'] as String?,
  barcode: json['barcode'] as String?,
  sellingPrice: (json['selling_price'] as num?)?.toDouble(),
);

PurchaseInvoiceUser _$PurchaseInvoiceUserFromJson(Map<String, dynamic> json) =>
    PurchaseInvoiceUser(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );
