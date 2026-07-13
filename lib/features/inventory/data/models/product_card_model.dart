import 'package:json_annotation/json_annotation.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/features/inventory/data/models/base_unit_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_category.dart';

part 'product_card_model.g.dart';

@JsonSerializable()
class ProductCardModel {
  ProductCardModel({
    required this.id,
    required this.name,
    required this.arName,
    required this.category,
    required this.status,
    required this.price,
    required this.quantity,
    required this.minStock,
    this.nearestExpiration,
    this.baseUnit,
  });

  final int id;

  @JsonKey(name: 'brand_name')
  final String name;
  @JsonKey(name: 'ar_name')
  final String arName;

  final ProductCategoryModel category;

  @JsonKey(name: 'stock_status', fromJson: _parseStockStatus)
  final MedicineStockStatus status;

  @JsonKey(name: 'selling_price')
  final num price;

  @JsonKey(name: 'total_quantity')
  final num quantity;

  @JsonKey(name: 'min_stock')
  final num minStock;

  @JsonKey(name: 'nearest_expiry')
  final String? nearestExpiration;

  @JsonKey(name: 'base_unit')
  final BaseUnitModel? baseUnit;

  factory ProductCardModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCardModelFromJson(json);

  static MedicineStockStatus _parseStockStatus(dynamic value) {
    return MedicineStockStatus.values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => MedicineStockStatus.available,
    );
  }

  /// Value equality by [id] so a freshly built instance (e.g. from
  /// `ProductDetailModel.toProductCard()` for a seeded/scanned product) matches
  /// the same product in the dropdown's `items` list — without this the
  /// dropdown's `items.contains(value)` check falls back to identity and the
  /// selected product wouldn't render.
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is ProductCardModel && other.id == id);

  @override
  int get hashCode => id.hashCode;
}
