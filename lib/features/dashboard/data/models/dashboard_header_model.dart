import 'package:json_annotation/json_annotation.dart';

part 'dashboard_header_model.g.dart';

/// Today-at-a-glance figures for the dashboard header.
/// Mirrors the backend `GET /dashboard/header` payload.
@JsonSerializable(createToJson: false)
class DashboardHeaderModel {
  const DashboardHeaderModel({
    required this.todayRevenue,
    required this.todayRevenueChangePercent,
    required this.todayInvoiceCount,
    required this.todayAvgInvoice,
    required this.todayUnitsSold,
  });

  @JsonKey(name: 'today_revenue')
  final double todayRevenue;

  @JsonKey(name: 'today_revenue_change_percent')
  final double todayRevenueChangePercent;

  @JsonKey(name: 'today_invoice_count')
  final int todayInvoiceCount;

  @JsonKey(name: 'today_avg_invoice')
  final double todayAvgInvoice;

  @JsonKey(name: 'today_units_sold')
  final int todayUnitsSold;

  factory DashboardHeaderModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardHeaderModelFromJson(json);
}
