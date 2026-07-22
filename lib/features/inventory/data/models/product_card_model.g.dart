// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCardModel _$ProductCardModelFromJson(Map<String, dynamic> json) =>
    ProductCardModel(
      id: (json['id'] as num).toInt(),
      name: json['brand_name'] as String,
      arName: json['ar_name'] as String,
      category: ProductCategoryModel.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      status: ProductCardModel._parseStockStatus(json['stock_status']),
      price: json['selling_price'] as num,
      quantity: json['total_quantity'] as num,
      minStock: json['min_stock'] as num,
      nearestExpiration: json['nearest_expiry'] as String?,
      baseUnit: json['base_unit'] == null
          ? null
          : BaseUnitModel.fromJson(json['base_unit'] as Map<String, dynamic>),
    );
