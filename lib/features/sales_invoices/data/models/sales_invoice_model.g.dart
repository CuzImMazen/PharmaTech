// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesInvoiceModel _$SalesInvoiceModelFromJson(
  Map<String, dynamic> json,
) => SalesInvoiceModel(
  id: (json['id'] as num).toInt(),
  invoiceNumber: json['invoice_number'] as String,
  invoiceDate: json['invoice_date'] as String,
  subtotal: (json['subtotal'] as num).toDouble(),
  taxTotal: (json['tax_total'] as num).toDouble(),
  discountTotal: (json['discount_total'] as num).toDouble(),
  grandTotal: (json['grand_total'] as num).toDouble(),
  amountPaid: (json['amount_paid'] as num).toDouble(),
  amountDue: (json['amount_due'] as num).toDouble(),
  paymentMethod: SalesInvoiceModel._parsePaymentMethod(json['payment_method']),
  paymentStatus: SalesInvoiceModel._parsePaymentStatus(json['payment_status']),
  status: SalesInvoiceModel._parseInvoiceStatus(json['status']),
  notes: json['notes'] as String?,
  customer: json['customer'] == null
      ? null
      : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
  createdBy: SalesInvoiceModel._parseCreatedBy(json['created_by']),
  items: SalesInvoiceModel._parseItems(json['items']),
  customerDebt: json['customer_debt'] == null
      ? null
      : CustomerDebtModel.fromJson(
          json['customer_debt'] as Map<String, dynamic>,
        ),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

SalesInvoiceItemModel _$SalesInvoiceItemModelFromJson(
  Map<String, dynamic> json,
) => SalesInvoiceItemModel(
  id: (json['id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  sellingPrice: (json['selling_price'] as num).toDouble(),
  tax: (json['tax'] as num).toDouble(),
  discount: (json['discount'] as num).toDouble(),
  lineTotal: (json['line_total'] as num).toDouble(),
  product: json['product'] == null
      ? null
      : SalesInvoiceProductModel.fromJson(
          json['product'] as Map<String, dynamic>,
        ),
);

SalesInvoiceProductModel _$SalesInvoiceProductModelFromJson(
  Map<String, dynamic> json,
) => SalesInvoiceProductModel(
  id: (json['id'] as num).toInt(),
  brandName: json['brand_name'] as String,
  arName: json['ar_name'] as String?,
  barcode: json['barcode'] as String?,
  sellingPrice: (json['selling_price'] as num?)?.toDouble(),
);

SalesInvoiceUser _$SalesInvoiceUserFromJson(Map<String, dynamic> json) =>
    SalesInvoiceUser(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );
