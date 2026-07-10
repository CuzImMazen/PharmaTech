import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/inventory_products_page.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';

class InventoryCubit extends Cubit<InventoryState> {
  InventoryCubit({required this.inventoryRepository})
    : super(const InventoryState());

  final InventoryRepository inventoryRepository;
  Timer? _searchDebounce;

  Future<void> loadProducts() {
    return _fetchProducts(reset: true);
  }

  /// Loads all filter options (categories, units, companies) concurrently.
  /// Each section tracks its own loading + error state independently, so a
  /// failed section surfaces its own retry affordance without affecting the
  /// sections that loaded fine.
  Future<void> loadFilterOptions() async {
    if (isClosed) return;

    emit(
      state.copyWith(
        isFilterOptionsLoading: true,
        isLoadingCategories: true,
        isLoadingUnits: true,
        isLoadingCompanies: true,
        hasCategoriesError: false,
        hasUnitsError: false,
        hasCompaniesError: false,
        failure: null,
      ),
    );

    // Fire all three concurrently; each resolves its own slice.
    await Future.wait([
      _loadCategories(),
      _loadUnits(),
      _loadCompanies(),
    ]);

    if (isClosed) return;
    emit(state.copyWith(isFilterOptionsLoading: false));
  }

  /// Re-fetches only the categories section (used by its per-section retry).
  Future<void> reloadCategories() => _loadCategories();

  /// Re-fetches only the packaging units section (used by its per-section
  /// retry).
  Future<void> reloadUnits() => _loadUnits();

  /// Re-fetches only the companies section (used by its per-section retry).
  Future<void> reloadCompanies() => _loadCompanies();

  Future<void> _loadCategories() async {
    if (isClosed) return;
    emit(state.copyWith(isLoadingCategories: true, hasCategoriesError: false));

    final result = await inventoryRepository.fetchCategories(perPage: 200);
    if (isClosed) return;

    result.fold(
      (_) => emit(state.copyWith(isLoadingCategories: false, hasCategoriesError: true)),
      (items) => emit(
        state.copyWith(isLoadingCategories: false, categories: items),
      ),
    );
  }

  Future<void> _loadUnits() async {
    if (isClosed) return;
    emit(state.copyWith(isLoadingUnits: true, hasUnitsError: false));

    final result = await inventoryRepository.fetchUnits(
      perPage: 200,
      type: 'packaging',
    );
    if (isClosed) return;

    result.fold(
      (_) => emit(state.copyWith(isLoadingUnits: false, hasUnitsError: true)),
      (items) => emit(state.copyWith(isLoadingUnits: false, units: items)),
    );
  }

  Future<void> _loadCompanies() async {
    if (isClosed) return;
    emit(state.copyWith(isLoadingCompanies: true, hasCompaniesError: false));

    final result = await inventoryRepository.fetchCompanies(perPage: 200);
    if (isClosed) return;

    result.fold(
      (_) => emit(state.copyWith(isLoadingCompanies: false, hasCompaniesError: true)),
      (items) => emit(
        state.copyWith(isLoadingCompanies: false, companies: items),
      ),
    );
  }

  Future<void> refreshProducts() {
    return _fetchProducts(reset: true, forceRefresh: true);
  }

  Future<void> loadNextPage() {
    if (state.isInitialLoading || state.isLoadingMore || !state.hasMore) {
      return Future.value();
    }

    return _fetchProducts(page: state.currentPage + 1, append: true);
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query, failure: null));
    _searchDebounce?.cancel();
    _searchDebounce = Timer(
      const Duration(milliseconds: 350),
      () => _fetchProducts(reset: true),
    );
  }

  void updateSortBy(String? sortBy) {
    emit(state.copyWith(sortBy: sortBy, failure: null));
    _fetchProducts(reset: true);
  }

  void updateStockStatus(String? stockStatus) {
    emit(
      state.copyWith(
        stockStatus: stockStatus?.isEmpty ?? true ? null : stockStatus,
        failure: null,
      ),
    );
  }

  void updateInStockOnly(bool inStockOnly) {
    emit(state.copyWith(inStockOnly: inStockOnly, failure: null));
  }

  void updateCategoryIds(Set<int> categoryIds) {
    emit(state.copyWith(categoryIds: categoryIds.toList(), failure: null));
  }

  void updateCompanyIds(Set<int> companyIds) {
    emit(state.copyWith(companyIds: companyIds.toList(), failure: null));
  }

  void updateBaseUnitId(int? baseUnitId) {
    emit(state.copyWith(baseUnitId: baseUnitId, failure: null));
  }

  void updatePrescriptionRequired(bool? prescriptionRequired) {
    emit(
      state.copyWith(prescriptionRequired: prescriptionRequired, failure: null),
    );
  }

  void updateExpiryFilters(Set<String> expiryFilters) {
    emit(state.copyWith(expiryFilters: expiryFilters.toList(), failure: null));
  }

  void updatePriceRange({num? minPrice, num? maxPrice}) {
    emit(state.copyWith(minPrice: minPrice, maxPrice: maxPrice, failure: null));
  }

  void clearFilters() {
    _searchDebounce?.cancel();
    emit(
      state.copyWith(
        searchQuery: '',
        sortBy: null,
        stockStatus: null,
        categoryIds: const [],
        companyIds: const [],
        baseUnitId: null,
        prescriptionRequired: null,
        expiryFilters: const [],
        minPrice: null,
        maxPrice: null,
        inStockOnly: false,
        failure: null,
      ),
    );
    _fetchProducts(reset: true);
  }

  void applyFilters() {
    _fetchProducts(reset: true);
  }

  Future<void> _fetchProducts({
    bool reset = false,
    bool append = false,
    bool forceRefresh = false,
    int? page,
  }) async {
    if (isClosed) return;

    final showInitialLoader = reset && state.products.isEmpty;

    if (showInitialLoader) {
      emit(
        state.copyWith(
          isInitialLoading: true,
          isRefreshing: forceRefresh,
          isLoadingMore: false,
          failure: null,
        ),
      );
    } else if (append) {
      emit(state.copyWith(isLoadingMore: true, failure: null));
    } else {
      emit(state.copyWith(isRefreshing: true, failure: null));
    }

    final String? categoryParam = state.categoryIds.isNotEmpty
        ? state.categoryIds.join(',') // Converts [1, 2, 3] into "1,2,3"
        : null;

    final String? companyParam = state.companyIds.isNotEmpty
        ? state.companyIds.join(',') // Converts [1, 2, 3] into "1,2,3"
        : null;

    final result = await inventoryRepository.fetchProducts(
      search: state.searchQuery,
      categoryId: categoryParam,
      companyId: companyParam,
      baseUnitId: state.baseUnitId,
      prescriptionRequired: state.prescriptionRequired,
      expiryFilter: state.expiryFilters,
      sortBy: state.sortBy,
      stockStatus: state.stockStatus,
      inStockOnly: state.inStockOnly,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
      page: page ?? 1,
      perPage: 25,
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isInitialLoading: false,
            isRefreshing: false,
            isLoadingMore: false,
            failure: failure,
          ),
        );
      },
      (InventoryProductsPage pageResult) {
        final products = append
            ? [...state.products, ...pageResult.products]
            : pageResult.products;

        emit(
          state.copyWith(
            isInitialLoading: false,
            isRefreshing: false,
            isLoadingMore: false,
            products: products,
            currentPage: pageResult.currentPage,
            lastPage: pageResult.lastPage,
            hasMore: pageResult.hasMore,
            failure: null,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}
