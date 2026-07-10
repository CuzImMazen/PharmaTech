import 'package:json_annotation/json_annotation.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/features/inventory/data/models/base_unit_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/company_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_category.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_medical_info_model.dart';

part 'product_detail_model.g.dart';

/// Full detail for a single product. Mirrors the backend `ProductResource`
/// (`GET /products/{id}`).
///
/// Note: the backend `ProductResource` does NOT return `stock_status` or
/// `stock_alert_severity` (those live only on `ProductCardResource`). The
/// status is therefore derived here from [totalQuantity] and [minStock] via
/// [computedStatus].
@JsonSerializable()
class ProductDetailModel {
  const ProductDetailModel({
    required this.id,
    required this.barcode,
    required this.brandName,
    required this.category,
    this.scientificName,
    this.arName,
    this.strength,
    this.prescriptionRequired = false,
    this.buyingPrice = 0,
    this.sellingPrice = 0,
    this.totalQuantity = 0,
    this.taxRate = 0,
    this.discountRate = 0,
    this.minStock = 0,
    this.unitsPerBase = 1,
    this.allowPartialSelling = false,
    this.nearestExpiry,
    this.shelf,
    this.baseUnit,
    this.sellingUnit,
    this.company,
    this.medicalInfo,
  });

  final int id;
  final String barcode;

  @JsonKey(name: 'brand_name')
  final String brandName;

  @JsonKey(name: 'scientific_name')
  final String? scientificName;

  @JsonKey(name: 'ar_name')
  final String? arName;

  final String? strength;

  @JsonKey(name: 'prescription_required')
  final bool prescriptionRequired;

  @JsonKey(name: 'buying_price')
  final num buyingPrice;

  @JsonKey(name: 'selling_price')
  final num sellingPrice;

  @JsonKey(name: 'total_quantity')
  final int totalQuantity;

  @JsonKey(name: 'tax_rate')
  final num taxRate;

  @JsonKey(name: 'discount_rate')
  final num discountRate;

  @JsonKey(name: 'min_stock')
  final int minStock;

  @JsonKey(name: 'units_per_base')
  final int unitsPerBase;

  @JsonKey(name: 'allow_partial_selling')
  final bool allowPartialSelling;

  @JsonKey(name: 'nearest_expiry')
  final String? nearestExpiry;

  final String? shelf;

  @JsonKey(name: 'base_unit')
  final BaseUnitModel? baseUnit;

  @JsonKey(name: 'selling_unit')
  final BaseUnitModel? sellingUnit;

  final CompanyModel? company;

  @JsonKey(name: 'medical_info', fromJson: ProductMedicalInfoModel.fromJsonOrNull)
  final ProductMedicalInfoModel? medicalInfo;

  final ProductCategoryModel category;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  /// Derives the stock status the same way the backend's card resource does:
  /// out (0), low (< min), otherwise available.
  MedicineStockStatus get computedStatus {
    if (totalQuantity <= 0) return MedicineStockStatus.out;
    if (minStock > 0 && totalQuantity < minStock) {
      return MedicineStockStatus.low;
    }
    return MedicineStockStatus.available;
  }
}
