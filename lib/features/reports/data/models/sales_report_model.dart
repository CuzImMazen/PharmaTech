import 'package:json_annotation/json_annotation.dart';

part 'sales_report_model.g.dart';

/// Response from `GET /reports/sales`.
@JsonSerializable(createToJson: false)
class SalesReportModel {
  const SalesReportModel({
    required this.period,
    required this.dateFrom,
    required this.dateTo,
    required this.summary,
    required this.breakdown,
  });

  final String period;

  @JsonKey(name: 'date_from')
  final String dateFrom;

  @JsonKey(name: 'date_to')
  final String dateTo;

  final SalesReportSummary summary;

  @JsonKey(fromJson: _breakdownFromJson)
  final List<SalesBreakdownPoint> breakdown;

  factory SalesReportModel.fromJson(Map<String, dynamic> json) =>
      _$SalesReportModelFromJson(json);

  static List<SalesBreakdownPoint> _breakdownFromJson(dynamic value) {
    if (value is List) {
      return value
          .map((e) => SalesBreakdownPoint.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

@JsonSerializable(createToJson: false)
class SalesReportSummary {
  const SalesReportSummary({
    required this.totalInvoices,
    required this.totalRevenue,
    required this.totalDiscount,
    required this.totalTax,
    required this.totalCollected,
    required this.totalOutstanding,
    required this.avgInvoiceValue,
    required this.unitsSold,
  });

  @JsonKey(name: 'total_invoices')
  final int totalInvoices;

  @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)
  final double totalRevenue;

  @JsonKey(name: 'total_discount', fromJson: _doubleFromJson)
  final double totalDiscount;

  @JsonKey(name: 'total_tax', fromJson: _doubleFromJson)
  final double totalTax;

  @JsonKey(name: 'total_collected', fromJson: _doubleFromJson)
  final double totalCollected;

  @JsonKey(name: 'total_outstanding', fromJson: _doubleFromJson)
  final double totalOutstanding;

  @JsonKey(name: 'avg_invoice_value', fromJson: _doubleFromJson)
  final double avgInvoiceValue;

  @JsonKey(name: 'units_sold')
  final int unitsSold;

  factory SalesReportSummary.fromJson(Map<String, dynamic> json) =>
      _$SalesReportSummaryFromJson(json);

  static double _doubleFromJson(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
}

@JsonSerializable(createToJson: false)
class SalesBreakdownPoint {
  const SalesBreakdownPoint({
    required this.periodLabel,
    required this.invoiceCount,
    required this.revenue,
    required this.discount,
    required this.tax,
    required this.collected,
    required this.outstanding,
  });

  @JsonKey(name: 'period_label')
  final String periodLabel;

  @JsonKey(name: 'invoice_count')
  final int invoiceCount;

  @JsonKey(fromJson: _doubleFromJson)
  final double revenue;

  @JsonKey(fromJson: _doubleFromJson)
  final double discount;

  @JsonKey(fromJson: _doubleFromJson)
  final double tax;

  @JsonKey(fromJson: _doubleFromJson)
  final double collected;

  @JsonKey(fromJson: _doubleFromJson)
  final double outstanding;

  factory SalesBreakdownPoint.fromJson(Map<String, dynamic> json) =>
      _$SalesBreakdownPointFromJson(json);

  static double _doubleFromJson(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
}
