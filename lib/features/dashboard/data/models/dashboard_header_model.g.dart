// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_header_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardHeaderModel _$DashboardHeaderModelFromJson(
  Map<String, dynamic> json,
) => DashboardHeaderModel(
  todayRevenue: (json['today_revenue'] as num).toDouble(),
  todayRevenueChangePercent: (json['today_revenue_change_percent'] as num)
      .toDouble(),
  todayInvoiceCount: (json['today_invoice_count'] as num).toInt(),
  todayAvgInvoice: (json['today_avg_invoice'] as num).toDouble(),
  todayUnitsSold: (json['today_units_sold'] as num).toInt(),
);
