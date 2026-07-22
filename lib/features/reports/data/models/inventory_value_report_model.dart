import 'package:json_annotation/json_annotation.dart';

part 'inventory_value_report_model.g.dart';

/// Response from `GET /reports/inventory-value`.
@JsonSerializable(createToJson: false)
class InventoryValueReportModel {
  const InventoryValueReportModel({
    required this.summary,
    required this.products,
  });

  final InventoryValueSummary summary;

  @JsonKey(fromJson: _productsFromJson)
  final List<InventoryValueProduct> products;

  factory InventoryValueReportModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryValueReportModelFromJson(json);

  static List<InventoryValueProduct> _productsFromJson(dynamic value) {
    if (value is List) {
      return value
          .map((e) => InventoryValueProduct.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

@JsonSerializable(createToJson: false)
class InventoryValueSummary {
  const InventoryValueSummary({
    required this.totalCostValue,
    required this.totalSellingValue,
    required this.totalPotentialProfit,
    required this.overallMargin,
  });

  @JsonKey(name: 'total_cost_value', fromJson: _doubleFromJson)
  final double totalCostValue;

  @JsonKey(name: 'total_selling_value', fromJson: _doubleFromJson)
  final double totalSellingValue;

  @JsonKey(name: 'total_potential_profit', fromJson: _doubleFromJson)
  final double totalPotentialProfit;

  @JsonKey(name: 'overall_margin', fromJson: _doubleFromJson)
  final double overallMargin;

  factory InventoryValueSummary.fromJson(Map<String, dynamic> json) =>
      _$InventoryValueSummaryFromJson(json);

  static double _doubleFromJson(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
}

@JsonSerializable(createToJson: false)
class InventoryValueProduct {
  const InventoryValueProduct({
    required this.productId,
    required this.brandName,
    this.arName,
    required this.category,
    required this.totalQuantity,
    required this.costValue,
    required this.sellingValue,
    required this.potentialProfit,
  });

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'brand_name')
  final String brandName;

  @JsonKey(name: 'ar_name')
  final String? arName;

  final String category;

  @JsonKey(name: 'total_quantity')
  final int totalQuantity;

  @JsonKey(name: 'cost_value', fromJson: _doubleFromJson)
  final double costValue;

  @JsonKey(name: 'selling_value', fromJson: _doubleFromJson)
  final double sellingValue;

  @JsonKey(name: 'potential_profit', fromJson: _doubleFromJson)
  final double potentialProfit;

  factory InventoryValueProduct.fromJson(Map<String, dynamic> json) =>
      _$InventoryValueProductFromJson(json);

  static double _doubleFromJson(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
}
