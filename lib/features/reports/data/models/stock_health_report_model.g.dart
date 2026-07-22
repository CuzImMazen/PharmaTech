// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_health_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockHealthReportModel _$StockHealthReportModelFromJson(
  Map<String, dynamic> json,
) => StockHealthReportModel(
  expiryDays: (json['expiry_days'] as num).toInt(),
  summary: StockHealthSummary.fromJson(json['summary'] as Map<String, dynamic>),
  expiringSoon: StockHealthReportModel._listFromJson(json['expiring_soon']),
  lowStock: StockHealthReportModel._listFromJson(json['low_stock']),
  deadStock: StockHealthReportModel._listFromJson(json['dead_stock']),
);

StockHealthSummary _$StockHealthSummaryFromJson(Map<String, dynamic> json) =>
    StockHealthSummary(
      expiringSoonCount: (json['expiring_soon_count'] as num).toInt(),
      lowStockCount: (json['low_stock_count'] as num).toInt(),
      deadStockCount: (json['dead_stock_count'] as num).toInt(),
    );

StockHealthProduct _$StockHealthProductFromJson(Map<String, dynamic> json) =>
    StockHealthProduct(
      productId: (json['product_id'] as num).toInt(),
      brandName: json['brand_name'] as String,
      arName: json['ar_name'] as String?,
      category: json['category'] as String?,
      quantityOnHand: (json['quantity_on_hand'] as num?)?.toInt(),
      expiryDate: json['expiry_date'] as String?,
      daysUntilExpiry: (json['days_until_expiry'] as num?)?.toInt(),
      stockValue: StockHealthProduct._doubleFromJson(json['stock_value']),
      currentStock: (json['current_stock'] as num?)?.toInt(),
      minStock: (json['min_stock'] as num?)?.toInt(),
      stockStatus: json['stock_status'] as String?,
    );
