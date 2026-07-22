// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_products_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopProductsReportModel _$TopProductsReportModelFromJson(
  Map<String, dynamic> json,
) => TopProductsReportModel(
  dateFrom: json['date_from'] as String,
  dateTo: json['date_to'] as String,
  limit: (json['limit'] as num).toInt(),
  products: TopProductsReportModel._productsFromJson(json['products']),
);

TopProductItem _$TopProductItemFromJson(Map<String, dynamic> json) =>
    TopProductItem(
      rank: (json['rank'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      brandName: json['brand_name'] as String,
      arName: json['ar_name'] as String?,
      category: json['category'] as String,
      sellingPrice: TopProductItem._doubleFromJson(json['selling_price']),
      buyingPrice: TopProductItem._doubleFromJson(json['buying_price']),
      totalUnitsSold: (json['total_units_sold'] as num).toInt(),
      totalRevenue: TopProductItem._doubleFromJson(json['total_revenue']),
    );
