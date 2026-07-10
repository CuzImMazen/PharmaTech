import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_form/product_form_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/base_unit_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/company_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_category.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/inventory/data/repo/product_detail_repository.dart';

/// Drives the Add/Edit Product form. Loads the category/unit/company options
/// (reusing [InventoryRepository]) and submits a create (POST) or update (PUT)
/// via [ProductDetailRepository]. Text-field values live in controllers on the
/// screen; this cubit owns the dropdown selections, toggles, and outcome.
class ProductFormCubit extends Cubit<ProductFormState> {
  ProductFormCubit({
    required this.productDetailRepository,
    required this.inventoryRepository,
  }) : super(const ProductFormState());

  final ProductDetailRepository productDetailRepository;
  final InventoryRepository inventoryRepository;

  /// Loads categories, units, companies concurrently. Each section tracks its
  /// own error flag so the dropdown can show a per-field retry affordance.
  Future<void> loadOptions() async {
    if (isClosed) return;
    emit(
      state.copyWith(
        isOptionsLoading: true,
        hasCategoriesError: false,
        hasUnitsError: false,
        hasCompaniesError: false,
      ),
    );

    await Future.wait([
      _loadCategories(),
      _loadUnits(),
      _loadCompanies(),
    ]);

    if (isClosed) return;
    emit(state.copyWith(isOptionsLoading: false));
  }

  Future<void> reloadCategories() => _loadCategories();
  Future<void> reloadUnits() => _loadUnits();
  Future<void> reloadCompanies() => _loadCompanies();

  Future<void> _loadCategories() async {
    if (isClosed) return;
    emit(state.copyWith(hasCategoriesError: false));
    final result = await inventoryRepository.fetchCategories(perPage: 200);
    if (isClosed) return;
    result.fold(
      (_) => emit(state.copyWith(hasCategoriesError: true)),
      (items) => emit(state.copyWith(categories: items)),
    );
  }

  Future<void> _loadUnits() async {
    if (isClosed) return;
    emit(state.copyWith(hasUnitsError: false));
    final result = await inventoryRepository.fetchUnits(
      perPage: 200,
      type: 'packaging',
    );
    if (isClosed) return;
    result.fold(
      (_) => emit(state.copyWith(hasUnitsError: true)),
      (items) => emit(state.copyWith(units: items)),
    );
  }

  Future<void> _loadCompanies() async {
    if (isClosed) return;
    emit(state.copyWith(hasCompaniesError: false));
    final result = await inventoryRepository.fetchCompanies(perPage: 200);
    if (isClosed) return;
    result.fold(
      (_) => emit(state.copyWith(hasCompaniesError: true)),
      (items) => emit(state.copyWith(companies: items)),
    );
  }

  // ---- Selection setters ----

  void selectCategory(ProductCategoryModel? category) =>
      emit(state.copyWith(selectedCategory: category));

  void selectBaseUnit(BaseUnitModel? unit) =>
      emit(state.copyWith(selectedBaseUnit: unit));

  void selectSellingUnit(BaseUnitModel? unit) =>
      emit(state.copyWith(selectedSellingUnit: unit));

  void selectCompany(CompanyModel? company) =>
      emit(state.copyWith(selectedCompany: company));

  void togglePrescriptionRequired(bool value) =>
      emit(state.copyWith(prescriptionRequired: value));

  void toggleAllowPartialSelling(bool value) =>
      emit(state.copyWith(allowPartialSelling: value));

  /// Submits the form. [body] is the snake_case map built by the screen from
  /// its controllers + dropdown selections. When [productId] is null this is a
  /// create (POST); otherwise an update (PUT).
  Future<void> submit({int? productId, required Map<String, dynamic> body}) async {
    if (isClosed) return;
    emit(state.copyWith(isSaving: true, failure: null, saved: false));

    final result = productId == null
        ? productDetailRepository.createProduct(body)
        : productDetailRepository.updateProduct(productId, body);

    final outcome = await result;
    if (isClosed) return;

    outcome.fold(
      (failure) => emit(
        state.copyWith(isSaving: false, failure: failure, saved: false),
      ),
      (product) => emit(
        state.copyWith(
          isSaving: false,
          failure: null,
          saved: true,
          savedProduct: product,
        ),
      ),
    );
  }

  void clearFailure() {
    if (isClosed) return;
    if (state.failure != null) {
      emit(state.copyWith(failure: null));
    }
  }
}
