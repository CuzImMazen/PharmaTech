import 'package:json_annotation/json_annotation.dart';

part 'top_products_report_model.g.dart';

/// Response from `GET /reports/top-products`.
@JsonSerializable(createToJson: false)
class TopProductsReportModel {
  const TopProductsReportModel({
    required this.dateFrom,
    required this.dateTo,
    required this.limit,
    required this.products,
  });

  @JsonKey(name: 'date_from')
  final String dateFrom;

  @JsonKey(name: 'date_to')
  final String dateTo;

  final int limit;

  @JsonKey(fromJson: _productsFromJson)
  final List<TopProductItem> products;

  factory TopProductsReportModel.fromJson(Map<String, dynamic> json) =>
      _$TopProductsReportModelFromJson(json);

  static List<TopProductItem> _productsFromJson(dynamic value) {
    if (value is List) {
      return value
          .map((e) => TopProductItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

@JsonSerializable(createToJson: false)
class TopProductItem {
  const TopProductItem({
    required this.rank,
    required this.productId,
    required this.brandName,
    this.arName,
    required this.category,
    required this.sellingPrice,
    required this.buyingPrice,
    required this.totalUnitsSold,
    required this.totalRevenue,
  });

  final int rank;

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'brand_name')
  final String brandName;

  @JsonKey(name: 'ar_name')
  final String? arName;

  final String category;

  @JsonKey(name: 'selling_price', fromJson: _doubleFromJson)
  final double sellingPrice;

  @JsonKey(name: 'buying_price', fromJson: _doubleFromJson)
  final double buyingPrice;

  @JsonKey(name: 'total_units_sold')
  final int totalUnitsSold;

  @JsonKey(name: 'total_revenue', fromJson: _doubleFromJson)
  final double totalRevenue;

  factory TopProductItem.fromJson(Map<String, dynamic> json) =>
      _$TopProductItemFromJson(json);

  static double _doubleFromJson(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
}
