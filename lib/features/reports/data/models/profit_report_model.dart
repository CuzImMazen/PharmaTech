import 'package:json_annotation/json_annotation.dart';

part 'profit_report_model.g.dart';

/// Response from `GET /reports/profit`.
@JsonSerializable(createToJson: false)
class ProfitReportModel {
  const ProfitReportModel({
    required this.dateFrom,
    required this.dateTo,
    required this.summary,
    required this.products,
  });

  @JsonKey(name: 'date_from')
  final String dateFrom;

  @JsonKey(name: 'date_to')
  final String dateTo;

  final ProfitReportSummary summary;

  @JsonKey(fromJson: _productsFromJson)
  final List<ProfitProductItem> products;

  factory ProfitReportModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitReportModelFromJson(json);

  static List<ProfitProductItem> _productsFromJson(dynamic value) {
    if (value is List) {
      return value
          .map((e) => ProfitProductItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

@JsonSerializable(createToJson: false)
class ProfitReportSummary {
  const ProfitReportSummary({
    required this.totalRevenue,
    required this.totalCost,
    required this.totalProfit,
    required this.overallMargin,
  });

  @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)
  final double totalRevenue;

  @JsonKey(name: 'total_cost', fromJson: _doubleFromJson)
  final double totalCost;

  @JsonKey(name: 'total_profit', fromJson: _doubleFromJson)
  final double totalProfit;

  @JsonKey(name: 'overall_margin', fromJson: _doubleFromJson)
  final double overallMargin;

  factory ProfitReportSummary.fromJson(Map<String, dynamic> json) =>
      _$ProfitReportSummaryFromJson(json);

  static double _doubleFromJson(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
}

@JsonSerializable(createToJson: false)
class ProfitProductItem {
  const ProfitProductItem({
    required this.productId,
    required this.brandName,
    this.arName,
    required this.category,
    required this.totalUnitsSold,
    required this.avgCostPrice,
    required this.sellingPrice,
    required this.priceDifference,
    required this.totalRevenue,
    required this.totalCost,
    required this.totalProfit,
    required this.profitMargin,
  });

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'brand_name')
  final String brandName;

  @JsonKey(name: 'ar_name')
  final String? arName;

  final String category;

  @JsonKey(name: 'total_units_sold')
  final int totalUnitsSold;

  @JsonKey(name: 'avg_cost_price', fromJson: _doubleFromJson)
  final double avgCostPrice;

  @JsonKey(name: 'selling_price', fromJson: _doubleFromJson)
  final double sellingPrice;

  @JsonKey(name: 'price_difference', fromJson: _doubleFromJson)
  final double priceDifference;

  @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)
  final double totalRevenue;

  @JsonKey(name: 'total_cost', fromJson: _doubleFromJson)
  final double totalCost;

  @JsonKey(name: 'total_profit', fromJson: _doubleFromJson)
  final double totalProfit;

  @JsonKey(name: 'profit_margin', fromJson: _doubleFromJson)
  final double profitMargin;

  factory ProfitProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProfitProductItemFromJson(json);

  static double _doubleFromJson(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
}
