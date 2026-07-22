// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_value_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryValueReportModel _$InventoryValueReportModelFromJson(
  Map<String, dynamic> json,
) => InventoryValueReportModel(
  summary: InventoryValueSummary.fromJson(
    json['summary'] as Map<String, dynamic>,
  ),
  products: InventoryValueReportModel._productsFromJson(json['products']),
);

InventoryValueSummary _$InventoryValueSummaryFromJson(
  Map<String, dynamic> json,
) => InventoryValueSummary(
  totalCostValue: InventoryValueSummary._doubleFromJson(
    json['total_cost_value'],
  ),
  totalSellingValue: InventoryValueSummary._doubleFromJson(
    json['total_selling_value'],
  ),
  totalPotentialProfit: InventoryValueSummary._doubleFromJson(
    json['total_potential_profit'],
  ),
  overallMargin: InventoryValueSummary._doubleFromJson(json['overall_margin']),
);

InventoryValueProduct _$InventoryValueProductFromJson(
  Map<String, dynamic> json,
) => InventoryValueProduct(
  productId: (json['product_id'] as num).toInt(),
  brandName: json['brand_name'] as String,
  arName: json['ar_name'] as String?,
  category: json['category'] as String,
  totalQuantity: (json['total_quantity'] as num).toInt(),
  costValue: InventoryValueProduct._doubleFromJson(json['cost_value']),
  sellingValue: InventoryValueProduct._doubleFromJson(json['selling_value']),
  potentialProfit: InventoryValueProduct._doubleFromJson(
    json['potential_profit'],
  ),
);
