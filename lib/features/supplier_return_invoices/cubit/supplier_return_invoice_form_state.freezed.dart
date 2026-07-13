// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_return_invoice_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplierReturnInvoiceFormState {

 List<SupplierModel> get suppliers; List<ProductCardModel> get products; bool get isOptionsLoading; bool get hasOptionsError; SupplierModel? get selectedSupplier;/// The optional original purchase invoice this return is linked to.
 int? get originalPurchaseInvoiceId;/// Products allowed to be selected when seeded from an invoice. Empty means
/// no restriction (standalone return). Used to filter the product dropdown.
 Set<int> get allowedProductIds; List<SupplierReturnItemInput> get items; bool get isSaving; Failure? get failure; bool get saved;/// True while a barcode lookup is in flight from the in-form scanner.
 bool get isScanning;
/// Create a copy of SupplierReturnInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierReturnInvoiceFormStateCopyWith<SupplierReturnInvoiceFormState> get copyWith => _$SupplierReturnInvoiceFormStateCopyWithImpl<SupplierReturnInvoiceFormState>(this as SupplierReturnInvoiceFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierReturnInvoiceFormState&&const DeepCollectionEquality().equals(other.suppliers, suppliers)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasOptionsError, hasOptionsError) || other.hasOptionsError == hasOptionsError)&&(identical(other.selectedSupplier, selectedSupplier) || other.selectedSupplier == selectedSupplier)&&(identical(other.originalPurchaseInvoiceId, originalPurchaseInvoiceId) || other.originalPurchaseInvoiceId == originalPurchaseInvoiceId)&&const DeepCollectionEquality().equals(other.allowedProductIds, allowedProductIds)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(suppliers),const DeepCollectionEquality().hash(products),isOptionsLoading,hasOptionsError,selectedSupplier,originalPurchaseInvoiceId,const DeepCollectionEquality().hash(allowedProductIds),const DeepCollectionEquality().hash(items),isSaving,failure,saved,isScanning);

@override
String toString() {
  return 'SupplierReturnInvoiceFormState(suppliers: $suppliers, products: $products, isOptionsLoading: $isOptionsLoading, hasOptionsError: $hasOptionsError, selectedSupplier: $selectedSupplier, originalPurchaseInvoiceId: $originalPurchaseInvoiceId, allowedProductIds: $allowedProductIds, items: $items, isSaving: $isSaving, failure: $failure, saved: $saved, isScanning: $isScanning)';
}


}

/// @nodoc
abstract mixin class $SupplierReturnInvoiceFormStateCopyWith<$Res>  {
  factory $SupplierReturnInvoiceFormStateCopyWith(SupplierReturnInvoiceFormState value, $Res Function(SupplierReturnInvoiceFormState) _then) = _$SupplierReturnInvoiceFormStateCopyWithImpl;
@useResult
$Res call({
 List<SupplierModel> suppliers, List<ProductCardModel> products, bool isOptionsLoading, bool hasOptionsError, SupplierModel? selectedSupplier, int? originalPurchaseInvoiceId, Set<int> allowedProductIds, List<SupplierReturnItemInput> items, bool isSaving, Failure? failure, bool saved, bool isScanning
});




}
/// @nodoc
class _$SupplierReturnInvoiceFormStateCopyWithImpl<$Res>
    implements $SupplierReturnInvoiceFormStateCopyWith<$Res> {
  _$SupplierReturnInvoiceFormStateCopyWithImpl(this._self, this._then);

  final SupplierReturnInvoiceFormState _self;
  final $Res Function(SupplierReturnInvoiceFormState) _then;

/// Create a copy of SupplierReturnInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suppliers = null,Object? products = null,Object? isOptionsLoading = null,Object? hasOptionsError = null,Object? selectedSupplier = freezed,Object? originalPurchaseInvoiceId = freezed,Object? allowedProductIds = null,Object? items = null,Object? isSaving = null,Object? failure = freezed,Object? saved = null,Object? isScanning = null,}) {
  return _then(SupplierReturnInvoiceFormState(
suppliers: null == suppliers ? _self.suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as List<SupplierModel>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasOptionsError: null == hasOptionsError ? _self.hasOptionsError : hasOptionsError // ignore: cast_nullable_to_non_nullable
as bool,selectedSupplier: freezed == selectedSupplier ? _self.selectedSupplier : selectedSupplier // ignore: cast_nullable_to_non_nullable
as SupplierModel?,originalPurchaseInvoiceId: freezed == originalPurchaseInvoiceId ? _self.originalPurchaseInvoiceId : originalPurchaseInvoiceId // ignore: cast_nullable_to_non_nullable
as int?,allowedProductIds: null == allowedProductIds ? _self.allowedProductIds : allowedProductIds // ignore: cast_nullable_to_non_nullable
as Set<int>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SupplierReturnItemInput>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierReturnInvoiceFormState].
extension SupplierReturnInvoiceFormStatePatterns on SupplierReturnInvoiceFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierReturnInvoiceFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierReturnInvoiceFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierReturnInvoiceFormState value)  $default,){
final _that = this;
switch (_that) {
case _SupplierReturnInvoiceFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierReturnInvoiceFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierReturnInvoiceFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SupplierModel> suppliers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  SupplierModel? selectedSupplier,  int? originalPurchaseInvoiceId,  Set<int> allowedProductIds,  List<SupplierReturnItemInput> items,  bool isSaving,  Failure? failure,  bool saved,  bool isScanning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierReturnInvoiceFormState() when $default != null:
return $default(_that.suppliers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.selectedSupplier,_that.originalPurchaseInvoiceId,_that.allowedProductIds,_that.items,_that.isSaving,_that.failure,_that.saved,_that.isScanning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SupplierModel> suppliers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  SupplierModel? selectedSupplier,  int? originalPurchaseInvoiceId,  Set<int> allowedProductIds,  List<SupplierReturnItemInput> items,  bool isSaving,  Failure? failure,  bool saved,  bool isScanning)  $default,) {final _that = this;
switch (_that) {
case _SupplierReturnInvoiceFormState():
return $default(_that.suppliers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.selectedSupplier,_that.originalPurchaseInvoiceId,_that.allowedProductIds,_that.items,_that.isSaving,_that.failure,_that.saved,_that.isScanning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SupplierModel> suppliers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  SupplierModel? selectedSupplier,  int? originalPurchaseInvoiceId,  Set<int> allowedProductIds,  List<SupplierReturnItemInput> items,  bool isSaving,  Failure? failure,  bool saved,  bool isScanning)?  $default,) {final _that = this;
switch (_that) {
case _SupplierReturnInvoiceFormState() when $default != null:
return $default(_that.suppliers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.selectedSupplier,_that.originalPurchaseInvoiceId,_that.allowedProductIds,_that.items,_that.isSaving,_that.failure,_that.saved,_that.isScanning);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierReturnInvoiceFormState implements SupplierReturnInvoiceFormState {
  const _SupplierReturnInvoiceFormState({ List<SupplierModel> suppliers = const <SupplierModel>[],  List<ProductCardModel> products = const <ProductCardModel>[], this.isOptionsLoading = false, this.hasOptionsError = false, this.selectedSupplier, this.originalPurchaseInvoiceId,  Set<int> allowedProductIds = const <int>{},  List<SupplierReturnItemInput> items = const <SupplierReturnItemInput>[], this.isSaving = false, this.failure, this.saved = false, this.isScanning = false}): _suppliers = suppliers,_products = products,_allowedProductIds = allowedProductIds,_items = items;
  

 final  List<SupplierModel> _suppliers;
@override@JsonKey() List<SupplierModel> get suppliers {
  if (_suppliers is EqualUnmodifiableListView) return _suppliers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suppliers);
}

 final  List<ProductCardModel> _products;
@override@JsonKey() List<ProductCardModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  bool isOptionsLoading;
@override@JsonKey() final  bool hasOptionsError;
@override final  SupplierModel? selectedSupplier;
/// The optional original purchase invoice this return is linked to.
@override final  int? originalPurchaseInvoiceId;
/// Products allowed to be selected when seeded from an invoice. Empty means
/// no restriction (standalone return). Used to filter the product dropdown.
 final  Set<int> _allowedProductIds;
/// Products allowed to be selected when seeded from an invoice. Empty means
/// no restriction (standalone return). Used to filter the product dropdown.
@override@JsonKey() Set<int> get allowedProductIds {
  if (_allowedProductIds is EqualUnmodifiableSetView) return _allowedProductIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_allowedProductIds);
}

 final  List<SupplierReturnItemInput> _items;
@override@JsonKey() List<SupplierReturnItemInput> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isSaving;
@override final  Failure? failure;
@override@JsonKey() final  bool saved;
/// True while a barcode lookup is in flight from the in-form scanner.
@override@JsonKey() final  bool isScanning;

/// Create a copy of SupplierReturnInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierReturnInvoiceFormStateCopyWith<_SupplierReturnInvoiceFormState> get copyWith => __$SupplierReturnInvoiceFormStateCopyWithImpl<_SupplierReturnInvoiceFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierReturnInvoiceFormState&&const DeepCollectionEquality().equals(other._suppliers, _suppliers)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasOptionsError, hasOptionsError) || other.hasOptionsError == hasOptionsError)&&(identical(other.selectedSupplier, selectedSupplier) || other.selectedSupplier == selectedSupplier)&&(identical(other.originalPurchaseInvoiceId, originalPurchaseInvoiceId) || other.originalPurchaseInvoiceId == originalPurchaseInvoiceId)&&const DeepCollectionEquality().equals(other._allowedProductIds, _allowedProductIds)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_suppliers),const DeepCollectionEquality().hash(_products),isOptionsLoading,hasOptionsError,selectedSupplier,originalPurchaseInvoiceId,const DeepCollectionEquality().hash(_allowedProductIds),const DeepCollectionEquality().hash(_items),isSaving,failure,saved,isScanning);

@override
String toString() {
  return 'SupplierReturnInvoiceFormState(suppliers: $suppliers, products: $products, isOptionsLoading: $isOptionsLoading, hasOptionsError: $hasOptionsError, selectedSupplier: $selectedSupplier, originalPurchaseInvoiceId: $originalPurchaseInvoiceId, allowedProductIds: $allowedProductIds, items: $items, isSaving: $isSaving, failure: $failure, saved: $saved, isScanning: $isScanning)';
}


}

/// @nodoc
abstract mixin class _$SupplierReturnInvoiceFormStateCopyWith<$Res> implements $SupplierReturnInvoiceFormStateCopyWith<$Res> {
  factory _$SupplierReturnInvoiceFormStateCopyWith(_SupplierReturnInvoiceFormState value, $Res Function(_SupplierReturnInvoiceFormState) _then) = __$SupplierReturnInvoiceFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<SupplierModel> suppliers, List<ProductCardModel> products, bool isOptionsLoading, bool hasOptionsError, SupplierModel? selectedSupplier, int? originalPurchaseInvoiceId, Set<int> allowedProductIds, List<SupplierReturnItemInput> items, bool isSaving, Failure? failure, bool saved, bool isScanning
});




}
/// @nodoc
class __$SupplierReturnInvoiceFormStateCopyWithImpl<$Res>
    implements _$SupplierReturnInvoiceFormStateCopyWith<$Res> {
  __$SupplierReturnInvoiceFormStateCopyWithImpl(this._self, this._then);

  final _SupplierReturnInvoiceFormState _self;
  final $Res Function(_SupplierReturnInvoiceFormState) _then;

/// Create a copy of SupplierReturnInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suppliers = null,Object? products = null,Object? isOptionsLoading = null,Object? hasOptionsError = null,Object? selectedSupplier = freezed,Object? originalPurchaseInvoiceId = freezed,Object? allowedProductIds = null,Object? items = null,Object? isSaving = null,Object? failure = freezed,Object? saved = null,Object? isScanning = null,}) {
  return _then(_SupplierReturnInvoiceFormState(
suppliers: null == suppliers ? _self._suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as List<SupplierModel>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasOptionsError: null == hasOptionsError ? _self.hasOptionsError : hasOptionsError // ignore: cast_nullable_to_non_nullable
as bool,selectedSupplier: freezed == selectedSupplier ? _self.selectedSupplier : selectedSupplier // ignore: cast_nullable_to_non_nullable
as SupplierModel?,originalPurchaseInvoiceId: freezed == originalPurchaseInvoiceId ? _self.originalPurchaseInvoiceId : originalPurchaseInvoiceId // ignore: cast_nullable_to_non_nullable
as int?,allowedProductIds: null == allowedProductIds ? _self._allowedProductIds : allowedProductIds // ignore: cast_nullable_to_non_nullable
as Set<int>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SupplierReturnItemInput>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SupplierReturnItemInput {

 ProductCardModel? get product; String get quantity; String get unitPrice; String get tax; String get discount; bool get expanded;
/// Create a copy of SupplierReturnItemInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierReturnItemInputCopyWith<SupplierReturnItemInput> get copyWith => _$SupplierReturnItemInputCopyWithImpl<SupplierReturnItemInput>(this as SupplierReturnItemInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierReturnItemInput&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.expanded, expanded) || other.expanded == expanded));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,unitPrice,tax,discount,expanded);

@override
String toString() {
  return 'SupplierReturnItemInput(product: $product, quantity: $quantity, unitPrice: $unitPrice, tax: $tax, discount: $discount, expanded: $expanded)';
}


}

/// @nodoc
abstract mixin class $SupplierReturnItemInputCopyWith<$Res>  {
  factory $SupplierReturnItemInputCopyWith(SupplierReturnItemInput value, $Res Function(SupplierReturnItemInput) _then) = _$SupplierReturnItemInputCopyWithImpl;
@useResult
$Res call({
 ProductCardModel? product, String quantity, String unitPrice, String tax, String discount, bool expanded
});




}
/// @nodoc
class _$SupplierReturnItemInputCopyWithImpl<$Res>
    implements $SupplierReturnItemInputCopyWith<$Res> {
  _$SupplierReturnItemInputCopyWithImpl(this._self, this._then);

  final SupplierReturnItemInput _self;
  final $Res Function(SupplierReturnItemInput) _then;

/// Create a copy of SupplierReturnItemInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = freezed,Object? quantity = null,Object? unitPrice = null,Object? tax = null,Object? discount = null,Object? expanded = null,}) {
  return _then(SupplierReturnItemInput(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,expanded: null == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierReturnItemInput].
extension SupplierReturnItemInputPatterns on SupplierReturnItemInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierReturnItemInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierReturnItemInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierReturnItemInput value)  $default,){
final _that = this;
switch (_that) {
case _SupplierReturnItemInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierReturnItemInput value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierReturnItemInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductCardModel? product,  String quantity,  String unitPrice,  String tax,  String discount,  bool expanded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierReturnItemInput() when $default != null:
return $default(_that.product,_that.quantity,_that.unitPrice,_that.tax,_that.discount,_that.expanded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductCardModel? product,  String quantity,  String unitPrice,  String tax,  String discount,  bool expanded)  $default,) {final _that = this;
switch (_that) {
case _SupplierReturnItemInput():
return $default(_that.product,_that.quantity,_that.unitPrice,_that.tax,_that.discount,_that.expanded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductCardModel? product,  String quantity,  String unitPrice,  String tax,  String discount,  bool expanded)?  $default,) {final _that = this;
switch (_that) {
case _SupplierReturnItemInput() when $default != null:
return $default(_that.product,_that.quantity,_that.unitPrice,_that.tax,_that.discount,_that.expanded);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierReturnItemInput implements SupplierReturnItemInput {
  const _SupplierReturnItemInput({this.product, this.quantity = '', this.unitPrice = '', this.tax = '', this.discount = '', this.expanded = false});
  

@override final  ProductCardModel? product;
@override@JsonKey() final  String quantity;
@override@JsonKey() final  String unitPrice;
@override@JsonKey() final  String tax;
@override@JsonKey() final  String discount;
@override@JsonKey() final  bool expanded;

/// Create a copy of SupplierReturnItemInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierReturnItemInputCopyWith<_SupplierReturnItemInput> get copyWith => __$SupplierReturnItemInputCopyWithImpl<_SupplierReturnItemInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierReturnItemInput&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.expanded, expanded) || other.expanded == expanded));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,unitPrice,tax,discount,expanded);

@override
String toString() {
  return 'SupplierReturnItemInput(product: $product, quantity: $quantity, unitPrice: $unitPrice, tax: $tax, discount: $discount, expanded: $expanded)';
}


}

/// @nodoc
abstract mixin class _$SupplierReturnItemInputCopyWith<$Res> implements $SupplierReturnItemInputCopyWith<$Res> {
  factory _$SupplierReturnItemInputCopyWith(_SupplierReturnItemInput value, $Res Function(_SupplierReturnItemInput) _then) = __$SupplierReturnItemInputCopyWithImpl;
@override @useResult
$Res call({
 ProductCardModel? product, String quantity, String unitPrice, String tax, String discount, bool expanded
});




}
/// @nodoc
class __$SupplierReturnItemInputCopyWithImpl<$Res>
    implements _$SupplierReturnItemInputCopyWith<$Res> {
  __$SupplierReturnItemInputCopyWithImpl(this._self, this._then);

  final _SupplierReturnItemInput _self;
  final $Res Function(_SupplierReturnItemInput) _then;

/// Create a copy of SupplierReturnItemInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = freezed,Object? quantity = null,Object? unitPrice = null,Object? tax = null,Object? discount = null,Object? expanded = null,}) {
  return _then(_SupplierReturnItemInput(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,expanded: null == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
