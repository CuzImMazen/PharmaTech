// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductFormState {

 List<ProductCategoryModel> get categories; List<BaseUnitModel> get baseUnits; List<BaseUnitModel> get sellingUnits; List<CompanyModel> get companies; bool get isOptionsLoading; bool get hasCategoriesError; bool get hasBaseUnitsError; bool get hasSellingUnitsError; bool get hasCompaniesError; ProductCategoryModel? get selectedCategory; BaseUnitModel? get selectedBaseUnit; BaseUnitModel? get selectedSellingUnit; CompanyModel? get selectedCompany; bool get prescriptionRequired; bool get allowPartialSelling; bool get isSaving; bool get saved; Failure? get failure; ProductDetailModel? get savedProduct;
/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFormStateCopyWith<ProductFormState> get copyWith => _$ProductFormStateCopyWithImpl<ProductFormState>(this as ProductFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFormState&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.baseUnits, baseUnits)&&const DeepCollectionEquality().equals(other.sellingUnits, sellingUnits)&&const DeepCollectionEquality().equals(other.companies, companies)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasCategoriesError, hasCategoriesError) || other.hasCategoriesError == hasCategoriesError)&&(identical(other.hasBaseUnitsError, hasBaseUnitsError) || other.hasBaseUnitsError == hasBaseUnitsError)&&(identical(other.hasSellingUnitsError, hasSellingUnitsError) || other.hasSellingUnitsError == hasSellingUnitsError)&&(identical(other.hasCompaniesError, hasCompaniesError) || other.hasCompaniesError == hasCompaniesError)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.selectedBaseUnit, selectedBaseUnit) || other.selectedBaseUnit == selectedBaseUnit)&&(identical(other.selectedSellingUnit, selectedSellingUnit) || other.selectedSellingUnit == selectedSellingUnit)&&(identical(other.selectedCompany, selectedCompany) || other.selectedCompany == selectedCompany)&&(identical(other.prescriptionRequired, prescriptionRequired) || other.prescriptionRequired == prescriptionRequired)&&(identical(other.allowPartialSelling, allowPartialSelling) || other.allowPartialSelling == allowPartialSelling)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.savedProduct, savedProduct) || other.savedProduct == savedProduct));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(baseUnits),const DeepCollectionEquality().hash(sellingUnits),const DeepCollectionEquality().hash(companies),isOptionsLoading,hasCategoriesError,hasBaseUnitsError,hasSellingUnitsError,hasCompaniesError,selectedCategory,selectedBaseUnit,selectedSellingUnit,selectedCompany,prescriptionRequired,allowPartialSelling,isSaving,saved,failure,savedProduct]);

@override
String toString() {
  return 'ProductFormState(categories: $categories, baseUnits: $baseUnits, sellingUnits: $sellingUnits, companies: $companies, isOptionsLoading: $isOptionsLoading, hasCategoriesError: $hasCategoriesError, hasBaseUnitsError: $hasBaseUnitsError, hasSellingUnitsError: $hasSellingUnitsError, hasCompaniesError: $hasCompaniesError, selectedCategory: $selectedCategory, selectedBaseUnit: $selectedBaseUnit, selectedSellingUnit: $selectedSellingUnit, selectedCompany: $selectedCompany, prescriptionRequired: $prescriptionRequired, allowPartialSelling: $allowPartialSelling, isSaving: $isSaving, saved: $saved, failure: $failure, savedProduct: $savedProduct)';
}


}

/// @nodoc
abstract mixin class $ProductFormStateCopyWith<$Res>  {
  factory $ProductFormStateCopyWith(ProductFormState value, $Res Function(ProductFormState) _then) = _$ProductFormStateCopyWithImpl;
@useResult
$Res call({
 List<ProductCategoryModel> categories, List<BaseUnitModel> baseUnits, List<BaseUnitModel> sellingUnits, List<CompanyModel> companies, bool isOptionsLoading, bool hasCategoriesError, bool hasBaseUnitsError, bool hasSellingUnitsError, bool hasCompaniesError, ProductCategoryModel? selectedCategory, BaseUnitModel? selectedBaseUnit, BaseUnitModel? selectedSellingUnit, CompanyModel? selectedCompany, bool prescriptionRequired, bool allowPartialSelling, bool isSaving, bool saved, Failure? failure, ProductDetailModel? savedProduct
});




}
/// @nodoc
class _$ProductFormStateCopyWithImpl<$Res>
    implements $ProductFormStateCopyWith<$Res> {
  _$ProductFormStateCopyWithImpl(this._self, this._then);

  final ProductFormState _self;
  final $Res Function(ProductFormState) _then;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? baseUnits = null,Object? sellingUnits = null,Object? companies = null,Object? isOptionsLoading = null,Object? hasCategoriesError = null,Object? hasBaseUnitsError = null,Object? hasSellingUnitsError = null,Object? hasCompaniesError = null,Object? selectedCategory = freezed,Object? selectedBaseUnit = freezed,Object? selectedSellingUnit = freezed,Object? selectedCompany = freezed,Object? prescriptionRequired = null,Object? allowPartialSelling = null,Object? isSaving = null,Object? saved = null,Object? failure = freezed,Object? savedProduct = freezed,}) {
  return _then(ProductFormState(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryModel>,baseUnits: null == baseUnits ? _self.baseUnits : baseUnits // ignore: cast_nullable_to_non_nullable
as List<BaseUnitModel>,sellingUnits: null == sellingUnits ? _self.sellingUnits : sellingUnits // ignore: cast_nullable_to_non_nullable
as List<BaseUnitModel>,companies: null == companies ? _self.companies : companies // ignore: cast_nullable_to_non_nullable
as List<CompanyModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasCategoriesError: null == hasCategoriesError ? _self.hasCategoriesError : hasCategoriesError // ignore: cast_nullable_to_non_nullable
as bool,hasBaseUnitsError: null == hasBaseUnitsError ? _self.hasBaseUnitsError : hasBaseUnitsError // ignore: cast_nullable_to_non_nullable
as bool,hasSellingUnitsError: null == hasSellingUnitsError ? _self.hasSellingUnitsError : hasSellingUnitsError // ignore: cast_nullable_to_non_nullable
as bool,hasCompaniesError: null == hasCompaniesError ? _self.hasCompaniesError : hasCompaniesError // ignore: cast_nullable_to_non_nullable
as bool,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ProductCategoryModel?,selectedBaseUnit: freezed == selectedBaseUnit ? _self.selectedBaseUnit : selectedBaseUnit // ignore: cast_nullable_to_non_nullable
as BaseUnitModel?,selectedSellingUnit: freezed == selectedSellingUnit ? _self.selectedSellingUnit : selectedSellingUnit // ignore: cast_nullable_to_non_nullable
as BaseUnitModel?,selectedCompany: freezed == selectedCompany ? _self.selectedCompany : selectedCompany // ignore: cast_nullable_to_non_nullable
as CompanyModel?,prescriptionRequired: null == prescriptionRequired ? _self.prescriptionRequired : prescriptionRequired // ignore: cast_nullable_to_non_nullable
as bool,allowPartialSelling: null == allowPartialSelling ? _self.allowPartialSelling : allowPartialSelling // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,savedProduct: freezed == savedProduct ? _self.savedProduct : savedProduct // ignore: cast_nullable_to_non_nullable
as ProductDetailModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductFormState].
extension ProductFormStatePatterns on ProductFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductFormState value)  $default,){
final _that = this;
switch (_that) {
case _ProductFormState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductCategoryModel> categories,  List<BaseUnitModel> baseUnits,  List<BaseUnitModel> sellingUnits,  List<CompanyModel> companies,  bool isOptionsLoading,  bool hasCategoriesError,  bool hasBaseUnitsError,  bool hasSellingUnitsError,  bool hasCompaniesError,  ProductCategoryModel? selectedCategory,  BaseUnitModel? selectedBaseUnit,  BaseUnitModel? selectedSellingUnit,  CompanyModel? selectedCompany,  bool prescriptionRequired,  bool allowPartialSelling,  bool isSaving,  bool saved,  Failure? failure,  ProductDetailModel? savedProduct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
return $default(_that.categories,_that.baseUnits,_that.sellingUnits,_that.companies,_that.isOptionsLoading,_that.hasCategoriesError,_that.hasBaseUnitsError,_that.hasSellingUnitsError,_that.hasCompaniesError,_that.selectedCategory,_that.selectedBaseUnit,_that.selectedSellingUnit,_that.selectedCompany,_that.prescriptionRequired,_that.allowPartialSelling,_that.isSaving,_that.saved,_that.failure,_that.savedProduct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductCategoryModel> categories,  List<BaseUnitModel> baseUnits,  List<BaseUnitModel> sellingUnits,  List<CompanyModel> companies,  bool isOptionsLoading,  bool hasCategoriesError,  bool hasBaseUnitsError,  bool hasSellingUnitsError,  bool hasCompaniesError,  ProductCategoryModel? selectedCategory,  BaseUnitModel? selectedBaseUnit,  BaseUnitModel? selectedSellingUnit,  CompanyModel? selectedCompany,  bool prescriptionRequired,  bool allowPartialSelling,  bool isSaving,  bool saved,  Failure? failure,  ProductDetailModel? savedProduct)  $default,) {final _that = this;
switch (_that) {
case _ProductFormState():
return $default(_that.categories,_that.baseUnits,_that.sellingUnits,_that.companies,_that.isOptionsLoading,_that.hasCategoriesError,_that.hasBaseUnitsError,_that.hasSellingUnitsError,_that.hasCompaniesError,_that.selectedCategory,_that.selectedBaseUnit,_that.selectedSellingUnit,_that.selectedCompany,_that.prescriptionRequired,_that.allowPartialSelling,_that.isSaving,_that.saved,_that.failure,_that.savedProduct);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductCategoryModel> categories,  List<BaseUnitModel> baseUnits,  List<BaseUnitModel> sellingUnits,  List<CompanyModel> companies,  bool isOptionsLoading,  bool hasCategoriesError,  bool hasBaseUnitsError,  bool hasSellingUnitsError,  bool hasCompaniesError,  ProductCategoryModel? selectedCategory,  BaseUnitModel? selectedBaseUnit,  BaseUnitModel? selectedSellingUnit,  CompanyModel? selectedCompany,  bool prescriptionRequired,  bool allowPartialSelling,  bool isSaving,  bool saved,  Failure? failure,  ProductDetailModel? savedProduct)?  $default,) {final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
return $default(_that.categories,_that.baseUnits,_that.sellingUnits,_that.companies,_that.isOptionsLoading,_that.hasCategoriesError,_that.hasBaseUnitsError,_that.hasSellingUnitsError,_that.hasCompaniesError,_that.selectedCategory,_that.selectedBaseUnit,_that.selectedSellingUnit,_that.selectedCompany,_that.prescriptionRequired,_that.allowPartialSelling,_that.isSaving,_that.saved,_that.failure,_that.savedProduct);case _:
  return null;

}
}

}

/// @nodoc


class _ProductFormState implements ProductFormState {
  const _ProductFormState({ List<ProductCategoryModel> categories = const <ProductCategoryModel>[],  List<BaseUnitModel> baseUnits = const <BaseUnitModel>[],  List<BaseUnitModel> sellingUnits = const <BaseUnitModel>[],  List<CompanyModel> companies = const <CompanyModel>[], this.isOptionsLoading = false, this.hasCategoriesError = false, this.hasBaseUnitsError = false, this.hasSellingUnitsError = false, this.hasCompaniesError = false, this.selectedCategory, this.selectedBaseUnit, this.selectedSellingUnit, this.selectedCompany, this.prescriptionRequired = false, this.allowPartialSelling = false, this.isSaving = false, this.saved = false, this.failure, this.savedProduct}): _categories = categories,_baseUnits = baseUnits,_sellingUnits = sellingUnits,_companies = companies;
  

 final  List<ProductCategoryModel> _categories;
@override@JsonKey() List<ProductCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<BaseUnitModel> _baseUnits;
@override@JsonKey() List<BaseUnitModel> get baseUnits {
  if (_baseUnits is EqualUnmodifiableListView) return _baseUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_baseUnits);
}

 final  List<BaseUnitModel> _sellingUnits;
@override@JsonKey() List<BaseUnitModel> get sellingUnits {
  if (_sellingUnits is EqualUnmodifiableListView) return _sellingUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sellingUnits);
}

 final  List<CompanyModel> _companies;
@override@JsonKey() List<CompanyModel> get companies {
  if (_companies is EqualUnmodifiableListView) return _companies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companies);
}

@override@JsonKey() final  bool isOptionsLoading;
@override@JsonKey() final  bool hasCategoriesError;
@override@JsonKey() final  bool hasBaseUnitsError;
@override@JsonKey() final  bool hasSellingUnitsError;
@override@JsonKey() final  bool hasCompaniesError;
@override final  ProductCategoryModel? selectedCategory;
@override final  BaseUnitModel? selectedBaseUnit;
@override final  BaseUnitModel? selectedSellingUnit;
@override final  CompanyModel? selectedCompany;
@override@JsonKey() final  bool prescriptionRequired;
@override@JsonKey() final  bool allowPartialSelling;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool saved;
@override final  Failure? failure;
@override final  ProductDetailModel? savedProduct;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFormStateCopyWith<_ProductFormState> get copyWith => __$ProductFormStateCopyWithImpl<_ProductFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFormState&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._baseUnits, _baseUnits)&&const DeepCollectionEquality().equals(other._sellingUnits, _sellingUnits)&&const DeepCollectionEquality().equals(other._companies, _companies)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasCategoriesError, hasCategoriesError) || other.hasCategoriesError == hasCategoriesError)&&(identical(other.hasBaseUnitsError, hasBaseUnitsError) || other.hasBaseUnitsError == hasBaseUnitsError)&&(identical(other.hasSellingUnitsError, hasSellingUnitsError) || other.hasSellingUnitsError == hasSellingUnitsError)&&(identical(other.hasCompaniesError, hasCompaniesError) || other.hasCompaniesError == hasCompaniesError)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.selectedBaseUnit, selectedBaseUnit) || other.selectedBaseUnit == selectedBaseUnit)&&(identical(other.selectedSellingUnit, selectedSellingUnit) || other.selectedSellingUnit == selectedSellingUnit)&&(identical(other.selectedCompany, selectedCompany) || other.selectedCompany == selectedCompany)&&(identical(other.prescriptionRequired, prescriptionRequired) || other.prescriptionRequired == prescriptionRequired)&&(identical(other.allowPartialSelling, allowPartialSelling) || other.allowPartialSelling == allowPartialSelling)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.savedProduct, savedProduct) || other.savedProduct == savedProduct));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_baseUnits),const DeepCollectionEquality().hash(_sellingUnits),const DeepCollectionEquality().hash(_companies),isOptionsLoading,hasCategoriesError,hasBaseUnitsError,hasSellingUnitsError,hasCompaniesError,selectedCategory,selectedBaseUnit,selectedSellingUnit,selectedCompany,prescriptionRequired,allowPartialSelling,isSaving,saved,failure,savedProduct]);

@override
String toString() {
  return 'ProductFormState(categories: $categories, baseUnits: $baseUnits, sellingUnits: $sellingUnits, companies: $companies, isOptionsLoading: $isOptionsLoading, hasCategoriesError: $hasCategoriesError, hasBaseUnitsError: $hasBaseUnitsError, hasSellingUnitsError: $hasSellingUnitsError, hasCompaniesError: $hasCompaniesError, selectedCategory: $selectedCategory, selectedBaseUnit: $selectedBaseUnit, selectedSellingUnit: $selectedSellingUnit, selectedCompany: $selectedCompany, prescriptionRequired: $prescriptionRequired, allowPartialSelling: $allowPartialSelling, isSaving: $isSaving, saved: $saved, failure: $failure, savedProduct: $savedProduct)';
}


}

/// @nodoc
abstract mixin class _$ProductFormStateCopyWith<$Res> implements $ProductFormStateCopyWith<$Res> {
  factory _$ProductFormStateCopyWith(_ProductFormState value, $Res Function(_ProductFormState) _then) = __$ProductFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCategoryModel> categories, List<BaseUnitModel> baseUnits, List<BaseUnitModel> sellingUnits, List<CompanyModel> companies, bool isOptionsLoading, bool hasCategoriesError, bool hasBaseUnitsError, bool hasSellingUnitsError, bool hasCompaniesError, ProductCategoryModel? selectedCategory, BaseUnitModel? selectedBaseUnit, BaseUnitModel? selectedSellingUnit, CompanyModel? selectedCompany, bool prescriptionRequired, bool allowPartialSelling, bool isSaving, bool saved, Failure? failure, ProductDetailModel? savedProduct
});




}
/// @nodoc
class __$ProductFormStateCopyWithImpl<$Res>
    implements _$ProductFormStateCopyWith<$Res> {
  __$ProductFormStateCopyWithImpl(this._self, this._then);

  final _ProductFormState _self;
  final $Res Function(_ProductFormState) _then;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? baseUnits = null,Object? sellingUnits = null,Object? companies = null,Object? isOptionsLoading = null,Object? hasCategoriesError = null,Object? hasBaseUnitsError = null,Object? hasSellingUnitsError = null,Object? hasCompaniesError = null,Object? selectedCategory = freezed,Object? selectedBaseUnit = freezed,Object? selectedSellingUnit = freezed,Object? selectedCompany = freezed,Object? prescriptionRequired = null,Object? allowPartialSelling = null,Object? isSaving = null,Object? saved = null,Object? failure = freezed,Object? savedProduct = freezed,}) {
  return _then(_ProductFormState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryModel>,baseUnits: null == baseUnits ? _self._baseUnits : baseUnits // ignore: cast_nullable_to_non_nullable
as List<BaseUnitModel>,sellingUnits: null == sellingUnits ? _self._sellingUnits : sellingUnits // ignore: cast_nullable_to_non_nullable
as List<BaseUnitModel>,companies: null == companies ? _self._companies : companies // ignore: cast_nullable_to_non_nullable
as List<CompanyModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasCategoriesError: null == hasCategoriesError ? _self.hasCategoriesError : hasCategoriesError // ignore: cast_nullable_to_non_nullable
as bool,hasBaseUnitsError: null == hasBaseUnitsError ? _self.hasBaseUnitsError : hasBaseUnitsError // ignore: cast_nullable_to_non_nullable
as bool,hasSellingUnitsError: null == hasSellingUnitsError ? _self.hasSellingUnitsError : hasSellingUnitsError // ignore: cast_nullable_to_non_nullable
as bool,hasCompaniesError: null == hasCompaniesError ? _self.hasCompaniesError : hasCompaniesError // ignore: cast_nullable_to_non_nullable
as bool,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ProductCategoryModel?,selectedBaseUnit: freezed == selectedBaseUnit ? _self.selectedBaseUnit : selectedBaseUnit // ignore: cast_nullable_to_non_nullable
as BaseUnitModel?,selectedSellingUnit: freezed == selectedSellingUnit ? _self.selectedSellingUnit : selectedSellingUnit // ignore: cast_nullable_to_non_nullable
as BaseUnitModel?,selectedCompany: freezed == selectedCompany ? _self.selectedCompany : selectedCompany // ignore: cast_nullable_to_non_nullable
as CompanyModel?,prescriptionRequired: null == prescriptionRequired ? _self.prescriptionRequired : prescriptionRequired // ignore: cast_nullable_to_non_nullable
as bool,allowPartialSelling: null == allowPartialSelling ? _self.allowPartialSelling : allowPartialSelling // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,savedProduct: freezed == savedProduct ? _self.savedProduct : savedProduct // ignore: cast_nullable_to_non_nullable
as ProductDetailModel?,
  ));
}


}

// dart format on
