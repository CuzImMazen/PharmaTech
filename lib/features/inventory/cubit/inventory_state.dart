import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/base_unit_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_category.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';

part 'inventory_state.freezed.dart';

@freezed
sealed class InventoryState with _$InventoryState {
  const factory InventoryState({
    @Default(<ProductCardModel>[]) List<ProductCardModel> products,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default('') String searchQuery,
    String? sortBy,
    String? stockStatus,
    @Default(<int>[]) List<int> categoryIds,
    int? companyId,
    int? baseUnitId,
    bool? prescriptionRequired,
    @Default(<String>[]) List<String> expiryFilters,
    num? minPrice,
    num? maxPrice,
    @Default(false) bool inStockOnly,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    @Default(false) bool isFilterOptionsLoading,
    @Default(<ProductCategoryModel>[]) List<ProductCategoryModel> categories,
    @Default(<BaseUnitModel>[]) List<BaseUnitModel> units,
    Failure? failure,
  }) = _InventoryState;
}
