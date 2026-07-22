// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_invoice_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseInvoiceFormState {

 List<SupplierModel> get suppliers; List<ProductCardModel> get products; bool get isOptionsLoading; bool get hasOptionsError; Failure? get optionsFailure; SupplierModel? get selectedSupplier; List<PurchaseInvoiceItemInput> get items; bool get isSaving; Failure? get failure; bool get saved;/// True while a barcode lookup is in flight from the in-form scanner.
 bool get isScanning;
/// Create a copy of PurchaseInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseInvoiceFormStateCopyWith<PurchaseInvoiceFormState> get copyWith => _$PurchaseInvoiceFormStateCopyWithImpl<PurchaseInvoiceFormState>(this as PurchaseInvoiceFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseInvoiceFormState&&const DeepCollectionEquality().equals(other.suppliers, suppliers)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasOptionsError, hasOptionsError) || other.hasOptionsError == hasOptionsError)&&(identical(other.optionsFailure, optionsFailure) || other.optionsFailure == optionsFailure)&&(identical(other.selectedSupplier, selectedSupplier) || other.selectedSupplier == selectedSupplier)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(suppliers),const DeepCollectionEquality().hash(products),isOptionsLoading,hasOptionsError,optionsFailure,selectedSupplier,const DeepCollectionEquality().hash(items),isSaving,failure,saved,isScanning);

@override
String toString() {
  return 'PurchaseInvoiceFormState(suppliers: $suppliers, products: $products, isOptionsLoading: $isOptionsLoading, hasOptionsError: $hasOptionsError, optionsFailure: $optionsFailure, selectedSupplier: $selectedSupplier, items: $items, isSaving: $isSaving, failure: $failure, saved: $saved, isScanning: $isScanning)';
}


}

/// @nodoc
abstract mixin class $PurchaseInvoiceFormStateCopyWith<$Res>  {
  factory $PurchaseInvoiceFormStateCopyWith(PurchaseInvoiceFormState value, $Res Function(PurchaseInvoiceFormState) _then) = _$PurchaseInvoiceFormStateCopyWithImpl;
@useResult
$Res call({
 List<SupplierModel> suppliers, List<ProductCardModel> products, bool isOptionsLoading, bool hasOptionsError, Failure? optionsFailure, SupplierModel? selectedSupplier, List<PurchaseInvoiceItemInput> items, bool isSaving, Failure? failure, bool saved, bool isScanning
});




}
/// @nodoc
class _$PurchaseInvoiceFormStateCopyWithImpl<$Res>
    implements $PurchaseInvoiceFormStateCopyWith<$Res> {
  _$PurchaseInvoiceFormStateCopyWithImpl(this._self, this._then);

  final PurchaseInvoiceFormState _self;
  final $Res Function(PurchaseInvoiceFormState) _then;

/// Create a copy of PurchaseInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suppliers = null,Object? products = null,Object? isOptionsLoading = null,Object? hasOptionsError = null,Object? optionsFailure = freezed,Object? selectedSupplier = freezed,Object? items = null,Object? isSaving = null,Object? failure = freezed,Object? saved = null,Object? isScanning = null,}) {
  return _then(PurchaseInvoiceFormState(
suppliers: null == suppliers ? _self.suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as List<SupplierModel>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasOptionsError: null == hasOptionsError ? _self.hasOptionsError : hasOptionsError // ignore: cast_nullable_to_non_nullable
as bool,optionsFailure: freezed == optionsFailure ? _self.optionsFailure : optionsFailure // ignore: cast_nullable_to_non_nullable
as Failure?,selectedSupplier: freezed == selectedSupplier ? _self.selectedSupplier : selectedSupplier // ignore: cast_nullable_to_non_nullable
as SupplierModel?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PurchaseInvoiceItemInput>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseInvoiceFormState].
extension PurchaseInvoiceFormStatePatterns on PurchaseInvoiceFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseInvoiceFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseInvoiceFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseInvoiceFormState value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseInvoiceFormState value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SupplierModel> suppliers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  Failure? optionsFailure,  SupplierModel? selectedSupplier,  List<PurchaseInvoiceItemInput> items,  bool isSaving,  Failure? failure,  bool saved,  bool isScanning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseInvoiceFormState() when $default != null:
return $default(_that.suppliers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.optionsFailure,_that.selectedSupplier,_that.items,_that.isSaving,_that.failure,_that.saved,_that.isScanning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SupplierModel> suppliers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  Failure? optionsFailure,  SupplierModel? selectedSupplier,  List<PurchaseInvoiceItemInput> items,  bool isSaving,  Failure? failure,  bool saved,  bool isScanning)  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceFormState():
return $default(_that.suppliers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.optionsFailure,_that.selectedSupplier,_that.items,_that.isSaving,_that.failure,_that.saved,_that.isScanning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SupplierModel> suppliers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  Failure? optionsFailure,  SupplierModel? selectedSupplier,  List<PurchaseInvoiceItemInput> items,  bool isSaving,  Failure? failure,  bool saved,  bool isScanning)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceFormState() when $default != null:
return $default(_that.suppliers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.optionsFailure,_that.selectedSupplier,_that.items,_that.isSaving,_that.failure,_that.saved,_that.isScanning);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseInvoiceFormState implements PurchaseInvoiceFormState {
  const _PurchaseInvoiceFormState({ List<SupplierModel> suppliers = const <SupplierModel>[],  List<ProductCardModel> products = const <ProductCardModel>[], this.isOptionsLoading = false, this.hasOptionsError = false, this.optionsFailure, this.selectedSupplier,  List<PurchaseInvoiceItemInput> items = const <PurchaseInvoiceItemInput>[], this.isSaving = false, this.failure, this.saved = false, this.isScanning = false}): _suppliers = suppliers,_products = products,_items = items;
  

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
@override final  Failure? optionsFailure;
@override final  SupplierModel? selectedSupplier;
 final  List<PurchaseInvoiceItemInput> _items;
@override@JsonKey() List<PurchaseInvoiceItemInput> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isSaving;
@override final  Failure? failure;
@override@JsonKey() final  bool saved;
/// True while a barcode lookup is in flight from the in-form scanner.
@override@JsonKey() final  bool isScanning;

/// Create a copy of PurchaseInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseInvoiceFormStateCopyWith<_PurchaseInvoiceFormState> get copyWith => __$PurchaseInvoiceFormStateCopyWithImpl<_PurchaseInvoiceFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseInvoiceFormState&&const DeepCollectionEquality().equals(other._suppliers, _suppliers)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasOptionsError, hasOptionsError) || other.hasOptionsError == hasOptionsError)&&(identical(other.optionsFailure, optionsFailure) || other.optionsFailure == optionsFailure)&&(identical(other.selectedSupplier, selectedSupplier) || other.selectedSupplier == selectedSupplier)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_suppliers),const DeepCollectionEquality().hash(_products),isOptionsLoading,hasOptionsError,optionsFailure,selectedSupplier,const DeepCollectionEquality().hash(_items),isSaving,failure,saved,isScanning);

@override
String toString() {
  return 'PurchaseInvoiceFormState(suppliers: $suppliers, products: $products, isOptionsLoading: $isOptionsLoading, hasOptionsError: $hasOptionsError, optionsFailure: $optionsFailure, selectedSupplier: $selectedSupplier, items: $items, isSaving: $isSaving, failure: $failure, saved: $saved, isScanning: $isScanning)';
}


}

/// @nodoc
abstract mixin class _$PurchaseInvoiceFormStateCopyWith<$Res> implements $PurchaseInvoiceFormStateCopyWith<$Res> {
  factory _$PurchaseInvoiceFormStateCopyWith(_PurchaseInvoiceFormState value, $Res Function(_PurchaseInvoiceFormState) _then) = __$PurchaseInvoiceFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<SupplierModel> suppliers, List<ProductCardModel> products, bool isOptionsLoading, bool hasOptionsError, Failure? optionsFailure, SupplierModel? selectedSupplier, List<PurchaseInvoiceItemInput> items, bool isSaving, Failure? failure, bool saved, bool isScanning
});




}
/// @nodoc
class __$PurchaseInvoiceFormStateCopyWithImpl<$Res>
    implements _$PurchaseInvoiceFormStateCopyWith<$Res> {
  __$PurchaseInvoiceFormStateCopyWithImpl(this._self, this._then);

  final _PurchaseInvoiceFormState _self;
  final $Res Function(_PurchaseInvoiceFormState) _then;

/// Create a copy of PurchaseInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suppliers = null,Object? products = null,Object? isOptionsLoading = null,Object? hasOptionsError = null,Object? optionsFailure = freezed,Object? selectedSupplier = freezed,Object? items = null,Object? isSaving = null,Object? failure = freezed,Object? saved = null,Object? isScanning = null,}) {
  return _then(_PurchaseInvoiceFormState(
suppliers: null == suppliers ? _self._suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as List<SupplierModel>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasOptionsError: null == hasOptionsError ? _self.hasOptionsError : hasOptionsError // ignore: cast_nullable_to_non_nullable
as bool,optionsFailure: freezed == optionsFailure ? _self.optionsFailure : optionsFailure // ignore: cast_nullable_to_non_nullable
as Failure?,selectedSupplier: freezed == selectedSupplier ? _self.selectedSupplier : selectedSupplier // ignore: cast_nullable_to_non_nullable
as SupplierModel?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PurchaseInvoiceItemInput>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$PurchaseInvoiceItemInput {

 ProductCardModel? get product; String get quantity; String get wholesalePrice; String get tax; String get discount; String get batchNumber; String get expiryDate; String get sellingPrice; bool get expanded;
/// Create a copy of PurchaseInvoiceItemInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseInvoiceItemInputCopyWith<PurchaseInvoiceItemInput> get copyWith => _$PurchaseInvoiceItemInputCopyWithImpl<PurchaseInvoiceItemInput>(this as PurchaseInvoiceItemInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseInvoiceItemInput&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.wholesalePrice, wholesalePrice) || other.wholesalePrice == wholesalePrice)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.expanded, expanded) || other.expanded == expanded));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,wholesalePrice,tax,discount,batchNumber,expiryDate,sellingPrice,expanded);

@override
String toString() {
  return 'PurchaseInvoiceItemInput(product: $product, quantity: $quantity, wholesalePrice: $wholesalePrice, tax: $tax, discount: $discount, batchNumber: $batchNumber, expiryDate: $expiryDate, sellingPrice: $sellingPrice, expanded: $expanded)';
}


}

/// @nodoc
abstract mixin class $PurchaseInvoiceItemInputCopyWith<$Res>  {
  factory $PurchaseInvoiceItemInputCopyWith(PurchaseInvoiceItemInput value, $Res Function(PurchaseInvoiceItemInput) _then) = _$PurchaseInvoiceItemInputCopyWithImpl;
@useResult
$Res call({
 ProductCardModel? product, String quantity, String wholesalePrice, String tax, String discount, String batchNumber, String expiryDate, String sellingPrice, bool expanded
});




}
/// @nodoc
class _$PurchaseInvoiceItemInputCopyWithImpl<$Res>
    implements $PurchaseInvoiceItemInputCopyWith<$Res> {
  _$PurchaseInvoiceItemInputCopyWithImpl(this._self, this._then);

  final PurchaseInvoiceItemInput _self;
  final $Res Function(PurchaseInvoiceItemInput) _then;

/// Create a copy of PurchaseInvoiceItemInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = freezed,Object? quantity = null,Object? wholesalePrice = null,Object? tax = null,Object? discount = null,Object? batchNumber = null,Object? expiryDate = null,Object? sellingPrice = null,Object? expanded = null,}) {
  return _then(PurchaseInvoiceItemInput(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,wholesalePrice: null == wholesalePrice ? _self.wholesalePrice : wholesalePrice // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,expanded: null == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseInvoiceItemInput].
extension PurchaseInvoiceItemInputPatterns on PurchaseInvoiceItemInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseInvoiceItemInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseInvoiceItemInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseInvoiceItemInput value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceItemInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseInvoiceItemInput value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceItemInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductCardModel? product,  String quantity,  String wholesalePrice,  String tax,  String discount,  String batchNumber,  String expiryDate,  String sellingPrice,  bool expanded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseInvoiceItemInput() when $default != null:
return $default(_that.product,_that.quantity,_that.wholesalePrice,_that.tax,_that.discount,_that.batchNumber,_that.expiryDate,_that.sellingPrice,_that.expanded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductCardModel? product,  String quantity,  String wholesalePrice,  String tax,  String discount,  String batchNumber,  String expiryDate,  String sellingPrice,  bool expanded)  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceItemInput():
return $default(_that.product,_that.quantity,_that.wholesalePrice,_that.tax,_that.discount,_that.batchNumber,_that.expiryDate,_that.sellingPrice,_that.expanded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductCardModel? product,  String quantity,  String wholesalePrice,  String tax,  String discount,  String batchNumber,  String expiryDate,  String sellingPrice,  bool expanded)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceItemInput() when $default != null:
return $default(_that.product,_that.quantity,_that.wholesalePrice,_that.tax,_that.discount,_that.batchNumber,_that.expiryDate,_that.sellingPrice,_that.expanded);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseInvoiceItemInput implements PurchaseInvoiceItemInput {
  const _PurchaseInvoiceItemInput({this.product, this.quantity = '', this.wholesalePrice = '', this.tax = '', this.discount = '', this.batchNumber = '', this.expiryDate = '', this.sellingPrice = '', this.expanded = false});
  

@override final  ProductCardModel? product;
@override@JsonKey() final  String quantity;
@override@JsonKey() final  String wholesalePrice;
@override@JsonKey() final  String tax;
@override@JsonKey() final  String discount;
@override@JsonKey() final  String batchNumber;
@override@JsonKey() final  String expiryDate;
@override@JsonKey() final  String sellingPrice;
@override@JsonKey() final  bool expanded;

/// Create a copy of PurchaseInvoiceItemInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseInvoiceItemInputCopyWith<_PurchaseInvoiceItemInput> get copyWith => __$PurchaseInvoiceItemInputCopyWithImpl<_PurchaseInvoiceItemInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseInvoiceItemInput&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.wholesalePrice, wholesalePrice) || other.wholesalePrice == wholesalePrice)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.expanded, expanded) || other.expanded == expanded));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,wholesalePrice,tax,discount,batchNumber,expiryDate,sellingPrice,expanded);

@override
String toString() {
  return 'PurchaseInvoiceItemInput(product: $product, quantity: $quantity, wholesalePrice: $wholesalePrice, tax: $tax, discount: $discount, batchNumber: $batchNumber, expiryDate: $expiryDate, sellingPrice: $sellingPrice, expanded: $expanded)';
}


}

/// @nodoc
abstract mixin class _$PurchaseInvoiceItemInputCopyWith<$Res> implements $PurchaseInvoiceItemInputCopyWith<$Res> {
  factory _$PurchaseInvoiceItemInputCopyWith(_PurchaseInvoiceItemInput value, $Res Function(_PurchaseInvoiceItemInput) _then) = __$PurchaseInvoiceItemInputCopyWithImpl;
@override @useResult
$Res call({
 ProductCardModel? product, String quantity, String wholesalePrice, String tax, String discount, String batchNumber, String expiryDate, String sellingPrice, bool expanded
});




}
/// @nodoc
class __$PurchaseInvoiceItemInputCopyWithImpl<$Res>
    implements _$PurchaseInvoiceItemInputCopyWith<$Res> {
  __$PurchaseInvoiceItemInputCopyWithImpl(this._self, this._then);

  final _PurchaseInvoiceItemInput _self;
  final $Res Function(_PurchaseInvoiceItemInput) _then;

/// Create a copy of PurchaseInvoiceItemInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = freezed,Object? quantity = null,Object? wholesalePrice = null,Object? tax = null,Object? discount = null,Object? batchNumber = null,Object? expiryDate = null,Object? sellingPrice = null,Object? expanded = null,}) {
  return _then(_PurchaseInvoiceItemInput(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,wholesalePrice: null == wholesalePrice ? _self.wholesalePrice : wholesalePrice // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,expanded: null == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
