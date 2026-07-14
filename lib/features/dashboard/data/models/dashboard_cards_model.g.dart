// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_cards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardCardsModel _$DashboardCardsModelFromJson(Map<String, dynamic> json) =>
    DashboardCardsModel(
      yesterdayRevenue: (json['yesterday_revenue'] as num).toDouble(),
      yesterdayWeekChangePercent: (json['yesterday_week_change_percent'] as num)
          .toDouble(),
      totalProducts: (json['total_products'] as num).toInt(),
      inStockProducts: (json['in_stock_products'] as num).toInt(),
      stockAlertsCount: (json['stock_alerts_count'] as num).toInt(),
      outOfStockCount: (json['out_of_stock_count'] as num).toInt(),
      todaySalesCount: (json['today_sales_count'] as num).toInt(),
      todaySalesChangePercent: (json['today_sales_change_percent'] as num)
          .toDouble(),
    );
