import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/base_unit_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/company_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_category.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';

part 'product_form_state.freezed.dart';

/// State for the Add/Edit Product form. Field *values* (text inputs, toggles)
/// live in [TextEditingController]s / widget state on the screen; this object
/// owns the option lists (categories/units/companies), the dropdown selections,
/// and the async submit outcome.
@freezed
abstract class ProductFormState with _$ProductFormState {
  const factory ProductFormState({
    // ---- Options ----
    @Default(<ProductCategoryModel>[]) List<ProductCategoryModel> categories,
    // Base unit options = `unit` type (Tablet, Capsule, Ml…).
    @Default(<BaseUnitModel>[]) List<BaseUnitModel> baseUnits,
    // Selling unit options = `packaging` type (Box, Bottle, Vial…).
    @Default(<BaseUnitModel>[]) List<BaseUnitModel> sellingUnits,
    @Default(<CompanyModel>[]) List<CompanyModel> companies,
    @Default(false) bool isOptionsLoading,
    @Default(false) bool hasCategoriesError,
    @Default(false) bool hasBaseUnitsError,
    @Default(false) bool hasSellingUnitsError,
    @Default(false) bool hasCompaniesError,

    // ---- Dropdown selections (nullable = none selected) ----
    ProductCategoryModel? selectedCategory,
    BaseUnitModel? selectedBaseUnit,
    BaseUnitModel? selectedSellingUnit,
    CompanyModel? selectedCompany,

    @Default(false) bool prescriptionRequired,
    @Default(false) bool allowPartialSelling,

    // ---- Submit outcome ----
    @Default(false) bool isSaving,
    @Default(false) bool saved,
    Failure? failure,

    // Populated on a successful create/update so the screen can forward it.
    ProductDetailModel? savedProduct,
  }) = _ProductFormState;
}
