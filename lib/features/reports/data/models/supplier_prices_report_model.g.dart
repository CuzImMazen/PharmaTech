// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_prices_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierPricesReportModel _$SupplierPricesReportModelFromJson(
  Map<String, dynamic> json,
) => SupplierPricesReportModel(
  dateFrom: json['date_from'] as String?,
  dateTo: json['date_to'] as String?,
  products: SupplierPricesReportModel._productsFromJson(json['products']),
);

SupplierPriceProduct _$SupplierPriceProductFromJson(
  Map<String, dynamic> json,
) => SupplierPriceProduct(
  productId: (json['product_id'] as num).toInt(),
  brandName: json['brand_name'] as String,
  arName: json['ar_name'] as String?,
  category: json['category'] as String,
  minCost: SupplierPriceProduct._doubleFromJson(json['min_cost']),
  maxCost: SupplierPriceProduct._doubleFromJson(json['max_cost']),
  avgCost: SupplierPriceProduct._doubleFromJson(json['avg_cost']),
  purchases: SupplierPriceProduct._purchasesFromJson(json['purchases']),
);

SupplierPurchaseRow _$SupplierPurchaseRowFromJson(Map<String, dynamic> json) =>
    SupplierPurchaseRow(
      supplierId: (json['supplier_id'] as num).toInt(),
      supplierName: json['supplier_name'] as String,
      invoiceNumber: json['invoice_number'] as String?,
      invoiceDate: json['invoice_date'] as String?,
      batchNumber: json['batch_number'] as String?,
      unitCost: SupplierPurchaseRow._doubleFromJson(json['unit_cost']),
      unitSellingPrice: SupplierPurchaseRow._doubleFromJson(
        json['unit_selling_price'],
      ),
      margin: SupplierPurchaseRow._doubleFromJson(json['margin']),
    );
