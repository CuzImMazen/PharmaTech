// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_return_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierReturnInvoiceModel _$SupplierReturnInvoiceModelFromJson(
  Map<String, dynamic> json,
) => SupplierReturnInvoiceModel(
  id: (json['id'] as num).toInt(),
  invoiceNumber: json['invoice_number'] as String,
  invoiceDate: json['invoice_date'] as String,
  subtotal: (json['subtotal'] as num).toDouble(),
  taxTotal: (json['tax_total'] as num).toDouble(),
  discountTotal: (json['discount_total'] as num).toDouble(),
  refundTotal: (json['refund_total'] as num).toDouble(),
  refundMethod: SupplierReturnInvoiceModel._parseRefundMethod(
    json['refund_method'],
  ),
  status: SupplierReturnInvoiceModel._parseReturnStatus(json['status']),
  reason: json['reason'] as String?,
  notes: json['notes'] as String?,
  supplier: json['supplier'] == null
      ? null
      : SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
  originalPurchaseInvoiceId: (json['original_purchase_invoice_id'] as num?)
      ?.toInt(),
  createdBy: SupplierReturnInvoiceModel._parseCreatedBy(json['created_by']),
  items: SupplierReturnInvoiceModel._parseItems(json['items']),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

SupplierReturnItemModel _$SupplierReturnItemModelFromJson(
  Map<String, dynamic> json,
) => SupplierReturnItemModel(
  id: (json['id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unit_price'] as num).toDouble(),
  tax: (json['tax'] as num).toDouble(),
  discount: (json['discount'] as num).toDouble(),
  lineTotal: (json['line_total'] as num).toDouble(),
  product: json['product'] == null
      ? null
      : PurchaseInvoiceProductModel.fromJson(
          json['product'] as Map<String, dynamic>,
        ),
);
