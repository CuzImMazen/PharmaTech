// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_return_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerReturnInvoiceModel _$CustomerReturnInvoiceModelFromJson(
  Map<String, dynamic> json,
) => CustomerReturnInvoiceModel(
  id: (json['id'] as num).toInt(),
  invoiceNumber: json['invoice_number'] as String,
  invoiceDate: json['invoice_date'] as String,
  subtotal: (json['subtotal'] as num).toDouble(),
  taxTotal: (json['tax_total'] as num).toDouble(),
  discountTotal: (json['discount_total'] as num).toDouble(),
  refundTotal: (json['refund_total'] as num).toDouble(),
  refundMethod: CustomerReturnInvoiceModel._parseRefundMethod(
    json['refund_method'],
  ),
  status: CustomerReturnInvoiceModel._parseReturnStatus(json['status']),
  reason: json['reason'] as String?,
  notes: json['notes'] as String?,
  customer: json['customer'] == null
      ? null
      : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
  originalSalesInvoiceId: (json['original_sales_invoice_id'] as num?)?.toInt(),
  items: CustomerReturnInvoiceModel._parseItems(json['items']),
  createdBy: CustomerReturnInvoiceModel._parseCreatedBy(json['created_by']),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

CustomerReturnItemModel _$CustomerReturnItemModelFromJson(
  Map<String, dynamic> json,
) => CustomerReturnItemModel(
  id: (json['id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unit_price'] as num).toDouble(),
  tax: (json['tax'] as num).toDouble(),
  discount: (json['discount'] as num).toDouble(),
  lineTotal: (json['line_total'] as num).toDouble(),
  product: json['product'] == null
      ? null
      : SalesInvoiceProductModel.fromJson(
          json['product'] as Map<String, dynamic>,
        ),
);

CustomerReturnInvoiceUser _$CustomerReturnInvoiceUserFromJson(
  Map<String, dynamic> json,
) => CustomerReturnInvoiceUser(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
);
