import 'package:json_annotation/json_annotation.dart';

part 'supplier_prices_report_model.g.dart';

/// Response from `GET /reports/supplier-prices`.
@JsonSerializable(createToJson: false)
class SupplierPricesReportModel {
  const SupplierPricesReportModel({
    this.dateFrom,
    this.dateTo,
    required this.products,
  });

  @JsonKey(name: 'date_from')
  final String? dateFrom;

  @JsonKey(name: 'date_to')
  final String? dateTo;

  @JsonKey(fromJson: _productsFromJson)
  final List<SupplierPriceProduct> products;

  factory SupplierPricesReportModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierPricesReportModelFromJson(json);

  static List<SupplierPriceProduct> _productsFromJson(dynamic value) {
    if (value is List) {
      return value
          .map((e) => SupplierPriceProduct.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

@JsonSerializable(createToJson: false)
class SupplierPriceProduct {
  const SupplierPriceProduct({
    required this.productId,
    required this.brandName,
    this.arName,
    required this.category,
    required this.minCost,
    required this.maxCost,
    required this.avgCost,
    required this.purchases,
  });

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'brand_name')
  final String brandName;

  @JsonKey(name: 'ar_name')
  final String? arName;

  final String category;

  @JsonKey(name: 'min_cost', fromJson: _doubleFromJson)
  final double minCost;

  @JsonKey(name: 'max_cost', fromJson: _doubleFromJson)
  final double maxCost;

  @JsonKey(name: 'avg_cost', fromJson: _doubleFromJson)
  final double avgCost;

  @JsonKey(fromJson: _purchasesFromJson)
  final List<SupplierPurchaseRow> purchases;

  factory SupplierPriceProduct.fromJson(Map<String, dynamic> json) =>
      _$SupplierPriceProductFromJson(json);

  static List<SupplierPurchaseRow> _purchasesFromJson(dynamic value) {
    if (value is List) {
      return value
          .map((e) => SupplierPurchaseRow.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  static double _doubleFromJson(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
}

@JsonSerializable(createToJson: false)
class SupplierPurchaseRow {
  const SupplierPurchaseRow({
    required this.supplierId,
    required this.supplierName,
    this.invoiceNumber,
    this.invoiceDate,
    this.batchNumber,
    required this.unitCost,
    required this.unitSellingPrice,
    required this.margin,
  });

  @JsonKey(name: 'supplier_id')
  final int supplierId;

  @JsonKey(name: 'supplier_name')
  final String supplierName;

  @JsonKey(name: 'invoice_number')
  final String? invoiceNumber;

  @JsonKey(name: 'invoice_date')
  final String? invoiceDate;

  @JsonKey(name: 'batch_number')
  final String? batchNumber;

  @JsonKey(name: 'unit_cost', fromJson: _doubleFromJson)
  final double unitCost;

  @JsonKey(name: 'unit_selling_price', fromJson: _doubleFromJson)
  final double unitSellingPrice;

  @JsonKey(fromJson: _doubleFromJson)
  final double margin;

  factory SupplierPurchaseRow.fromJson(Map<String, dynamic> json) =>
      _$SupplierPurchaseRowFromJson(json);

  static double _doubleFromJson(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
}
