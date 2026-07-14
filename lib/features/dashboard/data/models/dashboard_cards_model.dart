import 'package:json_annotation/json_annotation.dart';

part 'dashboard_cards_model.g.dart';

/// Four-card summary for the dashboard stats grid.
/// Mirrors the backend `GET /dashboard/cards` payload.
@JsonSerializable(createToJson: false)
class DashboardCardsModel {
  const DashboardCardsModel({
    required this.yesterdayRevenue,
    required this.yesterdayWeekChangePercent,
    required this.totalProducts,
    required this.inStockProducts,
    required this.stockAlertsCount,
    required this.outOfStockCount,
    required this.todaySalesCount,
    required this.todaySalesChangePercent,
  });

  @JsonKey(name: 'yesterday_revenue')
  final double yesterdayRevenue;

  @JsonKey(name: 'yesterday_week_change_percent')
  final double yesterdayWeekChangePercent;

  @JsonKey(name: 'total_products')
  final int totalProducts;

  @JsonKey(name: 'in_stock_products')
  final int inStockProducts;

  @JsonKey(name: 'stock_alerts_count')
  final int stockAlertsCount;

  @JsonKey(name: 'out_of_stock_count')
  final int outOfStockCount;

  @JsonKey(name: 'today_sales_count')
  final int todaySalesCount;

  @JsonKey(name: 'today_sales_change_percent')
  final double todaySalesChangePercent;

  factory DashboardCardsModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardCardsModelFromJson(json);
}
