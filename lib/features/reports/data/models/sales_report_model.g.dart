// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesReportModel _$SalesReportModelFromJson(Map<String, dynamic> json) =>
    SalesReportModel(
      period: json['period'] as String,
      dateFrom: json['date_from'] as String,
      dateTo: json['date_to'] as String,
      summary: SalesReportSummary.fromJson(
        json['summary'] as Map<String, dynamic>,
      ),
      breakdown: SalesReportModel._breakdownFromJson(json['breakdown']),
    );

SalesReportSummary _$SalesReportSummaryFromJson(Map<String, dynamic> json) =>
    SalesReportSummary(
      totalInvoices: (json['total_invoices'] as num).toInt(),
      totalRevenue: SalesReportSummary._doubleFromJson(json['total_revenue']),
      totalDiscount: SalesReportSummary._doubleFromJson(json['total_discount']),
      totalTax: SalesReportSummary._doubleFromJson(json['total_tax']),
      totalCollected: SalesReportSummary._doubleFromJson(
        json['total_collected'],
      ),
      totalOutstanding: SalesReportSummary._doubleFromJson(
        json['total_outstanding'],
      ),
      avgInvoiceValue: SalesReportSummary._doubleFromJson(
        json['avg_invoice_value'],
      ),
      unitsSold: (json['units_sold'] as num).toInt(),
    );

SalesBreakdownPoint _$SalesBreakdownPointFromJson(Map<String, dynamic> json) =>
    SalesBreakdownPoint(
      periodLabel: json['period_label'] as String,
      invoiceCount: (json['invoice_count'] as num).toInt(),
      revenue: SalesBreakdownPoint._doubleFromJson(json['revenue']),
      discount: SalesBreakdownPoint._doubleFromJson(json['discount']),
      tax: SalesBreakdownPoint._doubleFromJson(json['tax']),
      collected: SalesBreakdownPoint._doubleFromJson(json['collected']),
      outstanding: SalesBreakdownPoint._doubleFromJson(json['outstanding']),
    );
