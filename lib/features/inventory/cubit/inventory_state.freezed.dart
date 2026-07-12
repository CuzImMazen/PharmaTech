// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryState {

 List<ProductCardModel> get products; bool get isInitialLoading; bool get isLoadingMore; bool get isRefreshing; String get searchQuery; String? get sortBy; String? get stockStatus; List<int> get categoryIds; List<int> get companyIds; int? get baseUnitId; bool? get prescriptionRequired; List<String> get expiryFilters; num? get minPrice; num? get maxPrice; bool get inStockOnly; bool get showDeleted; int get currentPage; int get lastPage; bool get hasMore; bool get isFilterOptionsLoading; bool get isLoadingCategories; bool get isLoadingUnits; bool get isLoadingCompanies; bool get hasCategoriesError; bool get hasUnitsError; bool get hasCompaniesError; List<ProductCategoryModel> get categories; List<BaseUnitModel> get units; List<CompanyModel> get companies; Failure? get failure;
/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryStateCopyWith<InventoryState> get copyWith => _$InventoryStateCopyWithImpl<InventoryState>(this as InventoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.stockStatus, stockStatus) || other.stockStatus == stockStatus)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds)&&const DeepCollectionEquality().equals(other.companyIds, companyIds)&&(identical(other.baseUnitId, baseUnitId) || other.baseUnitId == baseUnitId)&&(identical(other.prescriptionRequired, prescriptionRequired) || other.prescriptionRequired == prescriptionRequired)&&const DeepCollectionEquality().equals(other.expiryFilters, expiryFilters)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.inStockOnly, inStockOnly) || other.inStockOnly == inStockOnly)&&(identical(other.showDeleted, showDeleted) || other.showDeleted == showDeleted)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isFilterOptionsLoading, isFilterOptionsLoading) || other.isFilterOptionsLoading == isFilterOptionsLoading)&&(identical(other.isLoadingCategories, isLoadingCategories) || other.isLoadingCategories == isLoadingCategories)&&(identical(other.isLoadingUnits, isLoadingUnits) || other.isLoadingUnits == isLoadingUnits)&&(identical(other.isLoadingCompanies, isLoadingCompanies) || other.isLoadingCompanies == isLoadingCompanies)&&(identical(other.hasCategoriesError, hasCategoriesError) || other.hasCategoriesError == hasCategoriesError)&&(identical(other.hasUnitsError, hasUnitsError) || other.hasUnitsError == hasUnitsError)&&(identical(other.hasCompaniesError, hasCompaniesError) || other.hasCompaniesError == hasCompaniesError)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.units, units)&&const DeepCollectionEquality().equals(other.companies, companies)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(products),isInitialLoading,isLoadingMore,isRefreshing,searchQuery,sortBy,stockStatus,const DeepCollectionEquality().hash(categoryIds),const DeepCollectionEquality().hash(companyIds),baseUnitId,prescriptionRequired,const DeepCollectionEquality().hash(expiryFilters),minPrice,maxPrice,inStockOnly,showDeleted,currentPage,lastPage,hasMore,isFilterOptionsLoading,isLoadingCategories,isLoadingUnits,isLoadingCompanies,hasCategoriesError,hasUnitsError,hasCompaniesError,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(units),const DeepCollectionEquality().hash(companies),failure]);

@override
String toString() {
  return 'InventoryState(products: $products, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, searchQuery: $searchQuery, sortBy: $sortBy, stockStatus: $stockStatus, categoryIds: $categoryIds, companyIds: $companyIds, baseUnitId: $baseUnitId, prescriptionRequired: $prescriptionRequired, expiryFilters: $expiryFilters, minPrice: $minPrice, maxPrice: $maxPrice, inStockOnly: $inStockOnly, showDeleted: $showDeleted, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, isFilterOptionsLoading: $isFilterOptionsLoading, isLoadingCategories: $isLoadingCategories, isLoadingUnits: $isLoadingUnits, isLoadingCompanies: $isLoadingCompanies, hasCategoriesError: $hasCategoriesError, hasUnitsError: $hasUnitsError, hasCompaniesError: $hasCompaniesError, categories: $categories, units: $units, companies: $companies, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $InventoryStateCopyWith<$Res>  {
  factory $InventoryStateCopyWith(InventoryState value, $Res Function(InventoryState) _then) = _$InventoryStateCopyWithImpl;
@useResult
$Res call({
 List<ProductCardModel> products, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, String searchQuery, String? sortBy, String? stockStatus, List<int> categoryIds, List<int> companyIds, int? baseUnitId, bool? prescriptionRequired, List<String> expiryFilters, num? minPrice, num? maxPrice, bool inStockOnly, bool showDeleted, int currentPage, int lastPage, bool hasMore, bool isFilterOptionsLoading, bool isLoadingCategories, bool isLoadingUnits, bool isLoadingCompanies, bool hasCategoriesError, bool hasUnitsError, bool hasCompaniesError, List<ProductCategoryModel> categories, List<BaseUnitModel> units, List<CompanyModel> companies, Failure? failure
});




}
/// @nodoc
class _$InventoryStateCopyWithImpl<$Res>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._self, this._then);

  final InventoryState _self;
  final $Res Function(InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? searchQuery = null,Object? sortBy = freezed,Object? stockStatus = freezed,Object? categoryIds = null,Object? companyIds = null,Object? baseUnitId = freezed,Object? prescriptionRequired = freezed,Object? expiryFilters = null,Object? minPrice = freezed,Object? maxPrice = freezed,Object? inStockOnly = null,Object? showDeleted = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? isFilterOptionsLoading = null,Object? isLoadingCategories = null,Object? isLoadingUnits = null,Object? isLoadingCompanies = null,Object? hasCategoriesError = null,Object? hasUnitsError = null,Object? hasCompaniesError = null,Object? categories = null,Object? units = null,Object? companies = null,Object? failure = freezed,}) {
  return _then(InventoryState(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,stockStatus: freezed == stockStatus ? _self.stockStatus : stockStatus // ignore: cast_nullable_to_non_nullable
as String?,categoryIds: null == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<int>,companyIds: null == companyIds ? _self.companyIds : companyIds // ignore: cast_nullable_to_non_nullable
as List<int>,baseUnitId: freezed == baseUnitId ? _self.baseUnitId : baseUnitId // ignore: cast_nullable_to_non_nullable
as int?,prescriptionRequired: freezed == prescriptionRequired ? _self.prescriptionRequired : prescriptionRequired // ignore: cast_nullable_to_non_nullable
as bool?,expiryFilters: null == expiryFilters ? _self.expiryFilters : expiryFilters // ignore: cast_nullable_to_non_nullable
as List<String>,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as num?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as num?,inStockOnly: null == inStockOnly ? _self.inStockOnly : inStockOnly // ignore: cast_nullable_to_non_nullable
as bool,showDeleted: null == showDeleted ? _self.showDeleted : showDeleted // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isFilterOptionsLoading: null == isFilterOptionsLoading ? _self.isFilterOptionsLoading : isFilterOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCategories: null == isLoadingCategories ? _self.isLoadingCategories : isLoadingCategories // ignore: cast_nullable_to_non_nullable
as bool,isLoadingUnits: null == isLoadingUnits ? _self.isLoadingUnits : isLoadingUnits // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCompanies: null == isLoadingCompanies ? _self.isLoadingCompanies : isLoadingCompanies // ignore: cast_nullable_to_non_nullable
as bool,hasCategoriesError: null == hasCategoriesError ? _self.hasCategoriesError : hasCategoriesError // ignore: cast_nullable_to_non_nullable
as bool,hasUnitsError: null == hasUnitsError ? _self.hasUnitsError : hasUnitsError // ignore: cast_nullable_to_non_nullable
as bool,hasCompaniesError: null == hasCompaniesError ? _self.hasCompaniesError : hasCompaniesError // ignore: cast_nullable_to_non_nullable
as bool,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryModel>,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<BaseUnitModel>,companies: null == companies ? _self.companies : companies // ignore: cast_nullable_to_non_nullable
as List<CompanyModel>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryState value)  $default,){
final _that = this;
switch (_that) {
case _InventoryState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryState value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductCardModel> products,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  String searchQuery,  String? sortBy,  String? stockStatus,  List<int> categoryIds,  List<int> companyIds,  int? baseUnitId,  bool? prescriptionRequired,  List<String> expiryFilters,  num? minPrice,  num? maxPrice,  bool inStockOnly,  bool showDeleted,  int currentPage,  int lastPage,  bool hasMore,  bool isFilterOptionsLoading,  bool isLoadingCategories,  bool isLoadingUnits,  bool isLoadingCompanies,  bool hasCategoriesError,  bool hasUnitsError,  bool hasCompaniesError,  List<ProductCategoryModel> categories,  List<BaseUnitModel> units,  List<CompanyModel> companies,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.products,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.searchQuery,_that.sortBy,_that.stockStatus,_that.categoryIds,_that.companyIds,_that.baseUnitId,_that.prescriptionRequired,_that.expiryFilters,_that.minPrice,_that.maxPrice,_that.inStockOnly,_that.showDeleted,_that.currentPage,_that.lastPage,_that.hasMore,_that.isFilterOptionsLoading,_that.isLoadingCategories,_that.isLoadingUnits,_that.isLoadingCompanies,_that.hasCategoriesError,_that.hasUnitsError,_that.hasCompaniesError,_that.categories,_that.units,_that.companies,_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductCardModel> products,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  String searchQuery,  String? sortBy,  String? stockStatus,  List<int> categoryIds,  List<int> companyIds,  int? baseUnitId,  bool? prescriptionRequired,  List<String> expiryFilters,  num? minPrice,  num? maxPrice,  bool inStockOnly,  bool showDeleted,  int currentPage,  int lastPage,  bool hasMore,  bool isFilterOptionsLoading,  bool isLoadingCategories,  bool isLoadingUnits,  bool isLoadingCompanies,  bool hasCategoriesError,  bool hasUnitsError,  bool hasCompaniesError,  List<ProductCategoryModel> categories,  List<BaseUnitModel> units,  List<CompanyModel> companies,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _InventoryState():
return $default(_that.products,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.searchQuery,_that.sortBy,_that.stockStatus,_that.categoryIds,_that.companyIds,_that.baseUnitId,_that.prescriptionRequired,_that.expiryFilters,_that.minPrice,_that.maxPrice,_that.inStockOnly,_that.showDeleted,_that.currentPage,_that.lastPage,_that.hasMore,_that.isFilterOptionsLoading,_that.isLoadingCategories,_that.isLoadingUnits,_that.isLoadingCompanies,_that.hasCategoriesError,_that.hasUnitsError,_that.hasCompaniesError,_that.categories,_that.units,_that.companies,_that.failure);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductCardModel> products,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  String searchQuery,  String? sortBy,  String? stockStatus,  List<int> categoryIds,  List<int> companyIds,  int? baseUnitId,  bool? prescriptionRequired,  List<String> expiryFilters,  num? minPrice,  num? maxPrice,  bool inStockOnly,  bool showDeleted,  int currentPage,  int lastPage,  bool hasMore,  bool isFilterOptionsLoading,  bool isLoadingCategories,  bool isLoadingUnits,  bool isLoadingCompanies,  bool hasCategoriesError,  bool hasUnitsError,  bool hasCompaniesError,  List<ProductCategoryModel> categories,  List<BaseUnitModel> units,  List<CompanyModel> companies,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.products,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.searchQuery,_that.sortBy,_that.stockStatus,_that.categoryIds,_that.companyIds,_that.baseUnitId,_that.prescriptionRequired,_that.expiryFilters,_that.minPrice,_that.maxPrice,_that.inStockOnly,_that.showDeleted,_that.currentPage,_that.lastPage,_that.hasMore,_that.isFilterOptionsLoading,_that.isLoadingCategories,_that.isLoadingUnits,_that.isLoadingCompanies,_that.hasCategoriesError,_that.hasUnitsError,_that.hasCompaniesError,_that.categories,_that.units,_that.companies,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _InventoryState implements InventoryState {
  const _InventoryState({ List<ProductCardModel> products = const <ProductCardModel>[], this.isInitialLoading = false, this.isLoadingMore = false, this.isRefreshing = false, this.searchQuery = '', this.sortBy, this.stockStatus,  List<int> categoryIds = const <int>[],  List<int> companyIds = const <int>[], this.baseUnitId, this.prescriptionRequired,  List<String> expiryFilters = const <String>[], this.minPrice, this.maxPrice, this.inStockOnly = false, this.showDeleted = false, this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.isFilterOptionsLoading = false, this.isLoadingCategories = false, this.isLoadingUnits = false, this.isLoadingCompanies = false, this.hasCategoriesError = false, this.hasUnitsError = false, this.hasCompaniesError = false,  List<ProductCategoryModel> categories = const <ProductCategoryModel>[],  List<BaseUnitModel> units = const <BaseUnitModel>[],  List<CompanyModel> companies = const <CompanyModel>[], this.failure}): _products = products,_categoryIds = categoryIds,_companyIds = companyIds,_expiryFilters = expiryFilters,_categories = categories,_units = units,_companies = companies;
  

 final  List<ProductCardModel> _products;
@override@JsonKey() List<ProductCardModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  String searchQuery;
@override final  String? sortBy;
@override final  String? stockStatus;
 final  List<int> _categoryIds;
@override@JsonKey() List<int> get categoryIds {
  if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryIds);
}

 final  List<int> _companyIds;
@override@JsonKey() List<int> get companyIds {
  if (_companyIds is EqualUnmodifiableListView) return _companyIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companyIds);
}

@override final  int? baseUnitId;
@override final  bool? prescriptionRequired;
 final  List<String> _expiryFilters;
@override@JsonKey() List<String> get expiryFilters {
  if (_expiryFilters is EqualUnmodifiableListView) return _expiryFilters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expiryFilters);
}

@override final  num? minPrice;
@override final  num? maxPrice;
@override@JsonKey() final  bool inStockOnly;
@override@JsonKey() final  bool showDeleted;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isFilterOptionsLoading;
@override@JsonKey() final  bool isLoadingCategories;
@override@JsonKey() final  bool isLoadingUnits;
@override@JsonKey() final  bool isLoadingCompanies;
@override@JsonKey() final  bool hasCategoriesError;
@override@JsonKey() final  bool hasUnitsError;
@override@JsonKey() final  bool hasCompaniesError;
 final  List<ProductCategoryModel> _categories;
@override@JsonKey() List<ProductCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<BaseUnitModel> _units;
@override@JsonKey() List<BaseUnitModel> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

 final  List<CompanyModel> _companies;
@override@JsonKey() List<CompanyModel> get companies {
  if (_companies is EqualUnmodifiableListView) return _companies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companies);
}

@override final  Failure? failure;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryStateCopyWith<_InventoryState> get copyWith => __$InventoryStateCopyWithImpl<_InventoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.stockStatus, stockStatus) || other.stockStatus == stockStatus)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds)&&const DeepCollectionEquality().equals(other._companyIds, _companyIds)&&(identical(other.baseUnitId, baseUnitId) || other.baseUnitId == baseUnitId)&&(identical(other.prescriptionRequired, prescriptionRequired) || other.prescriptionRequired == prescriptionRequired)&&const DeepCollectionEquality().equals(other._expiryFilters, _expiryFilters)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.inStockOnly, inStockOnly) || other.inStockOnly == inStockOnly)&&(identical(other.showDeleted, showDeleted) || other.showDeleted == showDeleted)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isFilterOptionsLoading, isFilterOptionsLoading) || other.isFilterOptionsLoading == isFilterOptionsLoading)&&(identical(other.isLoadingCategories, isLoadingCategories) || other.isLoadingCategories == isLoadingCategories)&&(identical(other.isLoadingUnits, isLoadingUnits) || other.isLoadingUnits == isLoadingUnits)&&(identical(other.isLoadingCompanies, isLoadingCompanies) || other.isLoadingCompanies == isLoadingCompanies)&&(identical(other.hasCategoriesError, hasCategoriesError) || other.hasCategoriesError == hasCategoriesError)&&(identical(other.hasUnitsError, hasUnitsError) || other.hasUnitsError == hasUnitsError)&&(identical(other.hasCompaniesError, hasCompaniesError) || other.hasCompaniesError == hasCompaniesError)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._units, _units)&&const DeepCollectionEquality().equals(other._companies, _companies)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(_products),isInitialLoading,isLoadingMore,isRefreshing,searchQuery,sortBy,stockStatus,const DeepCollectionEquality().hash(_categoryIds),const DeepCollectionEquality().hash(_companyIds),baseUnitId,prescriptionRequired,const DeepCollectionEquality().hash(_expiryFilters),minPrice,maxPrice,inStockOnly,showDeleted,currentPage,lastPage,hasMore,isFilterOptionsLoading,isLoadingCategories,isLoadingUnits,isLoadingCompanies,hasCategoriesError,hasUnitsError,hasCompaniesError,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_units),const DeepCollectionEquality().hash(_companies),failure]);

@override
String toString() {
  return 'InventoryState(products: $products, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, searchQuery: $searchQuery, sortBy: $sortBy, stockStatus: $stockStatus, categoryIds: $categoryIds, companyIds: $companyIds, baseUnitId: $baseUnitId, prescriptionRequired: $prescriptionRequired, expiryFilters: $expiryFilters, minPrice: $minPrice, maxPrice: $maxPrice, inStockOnly: $inStockOnly, showDeleted: $showDeleted, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, isFilterOptionsLoading: $isFilterOptionsLoading, isLoadingCategories: $isLoadingCategories, isLoadingUnits: $isLoadingUnits, isLoadingCompanies: $isLoadingCompanies, hasCategoriesError: $hasCategoriesError, hasUnitsError: $hasUnitsError, hasCompaniesError: $hasCompaniesError, categories: $categories, units: $units, companies: $companies, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$InventoryStateCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory _$InventoryStateCopyWith(_InventoryState value, $Res Function(_InventoryState) _then) = __$InventoryStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCardModel> products, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, String searchQuery, String? sortBy, String? stockStatus, List<int> categoryIds, List<int> companyIds, int? baseUnitId, bool? prescriptionRequired, List<String> expiryFilters, num? minPrice, num? maxPrice, bool inStockOnly, bool showDeleted, int currentPage, int lastPage, bool hasMore, bool isFilterOptionsLoading, bool isLoadingCategories, bool isLoadingUnits, bool isLoadingCompanies, bool hasCategoriesError, bool hasUnitsError, bool hasCompaniesError, List<ProductCategoryModel> categories, List<BaseUnitModel> units, List<CompanyModel> companies, Failure? failure
});




}
/// @nodoc
class __$InventoryStateCopyWithImpl<$Res>
    implements _$InventoryStateCopyWith<$Res> {
  __$InventoryStateCopyWithImpl(this._self, this._then);

  final _InventoryState _self;
  final $Res Function(_InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? searchQuery = null,Object? sortBy = freezed,Object? stockStatus = freezed,Object? categoryIds = null,Object? companyIds = null,Object? baseUnitId = freezed,Object? prescriptionRequired = freezed,Object? expiryFilters = null,Object? minPrice = freezed,Object? maxPrice = freezed,Object? inStockOnly = null,Object? showDeleted = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? isFilterOptionsLoading = null,Object? isLoadingCategories = null,Object? isLoadingUnits = null,Object? isLoadingCompanies = null,Object? hasCategoriesError = null,Object? hasUnitsError = null,Object? hasCompaniesError = null,Object? categories = null,Object? units = null,Object? companies = null,Object? failure = freezed,}) {
  return _then(_InventoryState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,stockStatus: freezed == stockStatus ? _self.stockStatus : stockStatus // ignore: cast_nullable_to_non_nullable
as String?,categoryIds: null == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<int>,companyIds: null == companyIds ? _self._companyIds : companyIds // ignore: cast_nullable_to_non_nullable
as List<int>,baseUnitId: freezed == baseUnitId ? _self.baseUnitId : baseUnitId // ignore: cast_nullable_to_non_nullable
as int?,prescriptionRequired: freezed == prescriptionRequired ? _self.prescriptionRequired : prescriptionRequired // ignore: cast_nullable_to_non_nullable
as bool?,expiryFilters: null == expiryFilters ? _self._expiryFilters : expiryFilters // ignore: cast_nullable_to_non_nullable
as List<String>,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as num?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as num?,inStockOnly: null == inStockOnly ? _self.inStockOnly : inStockOnly // ignore: cast_nullable_to_non_nullable
as bool,showDeleted: null == showDeleted ? _self.showDeleted : showDeleted // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isFilterOptionsLoading: null == isFilterOptionsLoading ? _self.isFilterOptionsLoading : isFilterOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCategories: null == isLoadingCategories ? _self.isLoadingCategories : isLoadingCategories // ignore: cast_nullable_to_non_nullable
as bool,isLoadingUnits: null == isLoadingUnits ? _self.isLoadingUnits : isLoadingUnits // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCompanies: null == isLoadingCompanies ? _self.isLoadingCompanies : isLoadingCompanies // ignore: cast_nullable_to_non_nullable
as bool,hasCategoriesError: null == hasCategoriesError ? _self.hasCategoriesError : hasCategoriesError // ignore: cast_nullable_to_non_nullable
as bool,hasUnitsError: null == hasUnitsError ? _self.hasUnitsError : hasUnitsError // ignore: cast_nullable_to_non_nullable
as bool,hasCompaniesError: null == hasCompaniesError ? _self.hasCompaniesError : hasCompaniesError // ignore: cast_nullable_to_non_nullable
as bool,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryModel>,units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<BaseUnitModel>,companies: null == companies ? _self._companies : companies // ignore: cast_nullable_to_non_nullable
as List<CompanyModel>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
