import 'package:json_annotation/json_annotation.dart';

part 'stock_health_report_model.g.dart';

/// Response from `GET /reports/stock-health`.
@JsonSerializable(createToJson: false)
class StockHealthReportModel {
  const StockHealthReportModel({
    required this.expiryDays,
    required this.summary,
    required this.expiringSoon,
    required this.lowStock,
    required this.deadStock,
  });

  @JsonKey(name: 'expiry_days')
  final int expiryDays;

  final StockHealthSummary summary;

  @JsonKey(name: 'expiring_soon', fromJson: _listFromJson)
  final List<StockHealthProduct> expiringSoon;

  @JsonKey(name: 'low_stock', fromJson: _listFromJson)
  final List<StockHealthProduct> lowStock;

  @JsonKey(name: 'dead_stock', fromJson: _listFromJson)
  final List<StockHealthProduct> deadStock;

  factory StockHealthReportModel.fromJson(Map<String, dynamic> json) =>
      _$StockHealthReportModelFromJson(json);

  static List<StockHealthProduct> _listFromJson(dynamic value) {
    if (value is List) {
      return value
          .map((e) => StockHealthProduct.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

@JsonSerializable(createToJson: false)
class StockHealthSummary {
  const StockHealthSummary({
    required this.expiringSoonCount,
    required this.lowStockCount,
    required this.deadStockCount,
  });

  @JsonKey(name: 'expiring_soon_count')
  final int expiringSoonCount;

  @JsonKey(name: 'low_stock_count')
  final int lowStockCount;

  @JsonKey(name: 'dead_stock_count')
  final int deadStockCount;

  factory StockHealthSummary.fromJson(Map<String, dynamic> json) =>
      _$StockHealthSummaryFromJson(json);
}

/// Shared row for all three stock-health sections.
/// Field availability differs by section:
/// - expiringSoon: `quantityOnHand`, `expiryDate`, `daysUntilExpiry`, `stockValue`
/// - lowStock: `currentStock`, `minStock`, `stockStatus`
/// - deadStock: `currentStock`
@JsonSerializable(createToJson: false)
class StockHealthProduct {
  const StockHealthProduct({
    required this.productId,
    required this.brandName,
    this.arName,
    this.category,
    this.quantityOnHand,
    this.expiryDate,
    this.daysUntilExpiry,
    this.stockValue,
    this.currentStock,
    this.minStock,
    this.stockStatus,
  });

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'brand_name')
  final String brandName;

  @JsonKey(name: 'ar_name')
  final String? arName;

  final String? category;

  @JsonKey(name: 'quantity_on_hand')
  final int? quantityOnHand;

  @JsonKey(name: 'expiry_date')
  final String? expiryDate;

  @JsonKey(name: 'days_until_expiry')
  final int? daysUntilExpiry;

  @JsonKey(name: 'stock_value', fromJson: _doubleFromJson)
  final double? stockValue;

  @JsonKey(name: 'current_stock')
  final int? currentStock;

  @JsonKey(name: 'min_stock')
  final int? minStock;

  @JsonKey(name: 'stock_status')
  final String? stockStatus;

  factory StockHealthProduct.fromJson(Map<String, dynamic> json) =>
      _$StockHealthProductFromJson(json);

  static double? _doubleFromJson(dynamic val) {
    if (val == null) return null;
    return (val as num).toDouble();
  }
}
