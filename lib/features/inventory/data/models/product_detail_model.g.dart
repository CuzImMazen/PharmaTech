// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      id: (json['id'] as num).toInt(),
      barcode: json['barcode'] as String,
      brandName: json['brand_name'] as String,
      category: ProductCategoryModel.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      scientificName: json['scientific_name'] as String?,
      arName: json['ar_name'] as String?,
      strength: json['strength'] as String?,
      prescriptionRequired: json['prescription_required'] as bool? ?? false,
      buyingPrice: json['buying_price'] as num? ?? 0,
      sellingPrice: json['selling_price'] as num? ?? 0,
      totalQuantity: (json['total_quantity'] as num?)?.toInt() ?? 0,
      taxRate: json['tax_rate'] as num? ?? 0,
      discountRate: json['discount_rate'] as num? ?? 0,
      minStock: (json['min_stock'] as num?)?.toInt() ?? 0,
      unitsPerBase: (json['units_per_base'] as num?)?.toInt() ?? 1,
      allowPartialSelling: json['allow_partial_selling'] as bool? ?? false,
      nearestExpiry: json['nearest_expiry'] as String?,
      shelf: json['shelf'] as String?,
      baseUnit: json['base_unit'] == null
          ? null
          : BaseUnitModel.fromJson(json['base_unit'] as Map<String, dynamic>),
      sellingUnit: json['selling_unit'] == null
          ? null
          : BaseUnitModel.fromJson(
              json['selling_unit'] as Map<String, dynamic>,
            ),
      company: json['company'] == null
          ? null
          : CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      medicalInfo: ProductMedicalInfoModel.fromJsonOrNull(json['medical_info']),
      deletedAt: json['deleted_at'] as String?,
    );
