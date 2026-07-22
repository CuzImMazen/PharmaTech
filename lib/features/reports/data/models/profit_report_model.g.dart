// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitReportModel _$ProfitReportModelFromJson(Map<String, dynamic> json) =>
    ProfitReportModel(
      dateFrom: json['date_from'] as String,
      dateTo: json['date_to'] as String,
      summary: ProfitReportSummary.fromJson(
        json['summary'] as Map<String, dynamic>,
      ),
      products: ProfitReportModel._productsFromJson(json['products']),
    );

ProfitReportSummary _$ProfitReportSummaryFromJson(Map<String, dynamic> json) =>
    ProfitReportSummary(
      totalRevenue: ProfitReportSummary._doubleFromJson(json['total_revenue']),
      totalCost: ProfitReportSummary._doubleFromJson(json['total_cost']),
      totalProfit: ProfitReportSummary._doubleFromJson(json['total_profit']),
      overallMargin: ProfitReportSummary._doubleFromJson(
        json['overall_margin'],
      ),
    );

ProfitProductItem _$ProfitProductItemFromJson(Map<String, dynamic> json) =>
    ProfitProductItem(
      productId: (json['product_id'] as num).toInt(),
      brandName: json['brand_name'] as String,
      arName: json['ar_name'] as String?,
      category: json['category'] as String,
      totalUnitsSold: (json['total_units_sold'] as num).toInt(),
      avgCostPrice: ProfitProductItem._doubleFromJson(json['avg_cost_price']),
      sellingPrice: ProfitProductItem._doubleFromJson(json['selling_price']),
      priceDifference: ProfitProductItem._doubleFromJson(
        json['price_difference'],
      ),
      totalRevenue: ProfitProductItem._doubleFromJson(json['total_revenue']),
      totalCost: ProfitProductItem._doubleFromJson(json['total_cost']),
      totalProfit: ProfitProductItem._doubleFromJson(json['total_profit']),
      profitMargin: ProfitProductItem._doubleFromJson(json['profit_margin']),
    );
