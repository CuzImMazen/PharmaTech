// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_stock_adjustment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BulkStockAdjustmentState {

 List<ProductCardModel> get products; bool get isProductsLoading; bool get hasProductsError; List<BulkAdjustmentItemInput> get items;/// Per-row validation errors surfaced inline (index → message). Cleared on
/// the next edit / submit attempt. Not a [Failure] — validation is local.
 Map<int, String> get rowErrors; bool get isSubmitting; Failure? get failure; bool get saved;
/// Create a copy of BulkStockAdjustmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulkStockAdjustmentStateCopyWith<BulkStockAdjustmentState> get copyWith => _$BulkStockAdjustmentStateCopyWithImpl<BulkStockAdjustmentState>(this as BulkStockAdjustmentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkStockAdjustmentState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.isProductsLoading, isProductsLoading) || other.isProductsLoading == isProductsLoading)&&(identical(other.hasProductsError, hasProductsError) || other.hasProductsError == hasProductsError)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.rowErrors, rowErrors)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),isProductsLoading,hasProductsError,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(rowErrors),isSubmitting,failure,saved);

@override
String toString() {
  return 'BulkStockAdjustmentState(products: $products, isProductsLoading: $isProductsLoading, hasProductsError: $hasProductsError, items: $items, rowErrors: $rowErrors, isSubmitting: $isSubmitting, failure: $failure, saved: $saved)';
}


}

/// @nodoc
abstract mixin class $BulkStockAdjustmentStateCopyWith<$Res>  {
  factory $BulkStockAdjustmentStateCopyWith(BulkStockAdjustmentState value, $Res Function(BulkStockAdjustmentState) _then) = _$BulkStockAdjustmentStateCopyWithImpl;
@useResult
$Res call({
 List<ProductCardModel> products, bool isProductsLoading, bool hasProductsError, List<BulkAdjustmentItemInput> items, Map<int, String> rowErrors, bool isSubmitting, Failure? failure, bool saved
});




}
/// @nodoc
class _$BulkStockAdjustmentStateCopyWithImpl<$Res>
    implements $BulkStockAdjustmentStateCopyWith<$Res> {
  _$BulkStockAdjustmentStateCopyWithImpl(this._self, this._then);

  final BulkStockAdjustmentState _self;
  final $Res Function(BulkStockAdjustmentState) _then;

/// Create a copy of BulkStockAdjustmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? isProductsLoading = null,Object? hasProductsError = null,Object? items = null,Object? rowErrors = null,Object? isSubmitting = null,Object? failure = freezed,Object? saved = null,}) {
  return _then(BulkStockAdjustmentState(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isProductsLoading: null == isProductsLoading ? _self.isProductsLoading : isProductsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasProductsError: null == hasProductsError ? _self.hasProductsError : hasProductsError // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BulkAdjustmentItemInput>,rowErrors: null == rowErrors ? _self.rowErrors : rowErrors // ignore: cast_nullable_to_non_nullable
as Map<int, String>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BulkStockAdjustmentState].
extension BulkStockAdjustmentStatePatterns on BulkStockAdjustmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BulkStockAdjustmentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BulkStockAdjustmentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BulkStockAdjustmentState value)  $default,){
final _that = this;
switch (_that) {
case _BulkStockAdjustmentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BulkStockAdjustmentState value)?  $default,){
final _that = this;
switch (_that) {
case _BulkStockAdjustmentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductCardModel> products,  bool isProductsLoading,  bool hasProductsError,  List<BulkAdjustmentItemInput> items,  Map<int, String> rowErrors,  bool isSubmitting,  Failure? failure,  bool saved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BulkStockAdjustmentState() when $default != null:
return $default(_that.products,_that.isProductsLoading,_that.hasProductsError,_that.items,_that.rowErrors,_that.isSubmitting,_that.failure,_that.saved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductCardModel> products,  bool isProductsLoading,  bool hasProductsError,  List<BulkAdjustmentItemInput> items,  Map<int, String> rowErrors,  bool isSubmitting,  Failure? failure,  bool saved)  $default,) {final _that = this;
switch (_that) {
case _BulkStockAdjustmentState():
return $default(_that.products,_that.isProductsLoading,_that.hasProductsError,_that.items,_that.rowErrors,_that.isSubmitting,_that.failure,_that.saved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductCardModel> products,  bool isProductsLoading,  bool hasProductsError,  List<BulkAdjustmentItemInput> items,  Map<int, String> rowErrors,  bool isSubmitting,  Failure? failure,  bool saved)?  $default,) {final _that = this;
switch (_that) {
case _BulkStockAdjustmentState() when $default != null:
return $default(_that.products,_that.isProductsLoading,_that.hasProductsError,_that.items,_that.rowErrors,_that.isSubmitting,_that.failure,_that.saved);case _:
  return null;

}
}

}

/// @nodoc


class _BulkStockAdjustmentState implements BulkStockAdjustmentState {
  const _BulkStockAdjustmentState({ List<ProductCardModel> products = const <ProductCardModel>[], this.isProductsLoading = false, this.hasProductsError = false,  List<BulkAdjustmentItemInput> items = const <BulkAdjustmentItemInput>[],  Map<int, String> rowErrors = const <int, String>{}, this.isSubmitting = false, this.failure, this.saved = false}): _products = products,_items = items,_rowErrors = rowErrors;
  

 final  List<ProductCardModel> _products;
@override@JsonKey() List<ProductCardModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  bool isProductsLoading;
@override@JsonKey() final  bool hasProductsError;
 final  List<BulkAdjustmentItemInput> _items;
@override@JsonKey() List<BulkAdjustmentItemInput> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// Per-row validation errors surfaced inline (index → message). Cleared on
/// the next edit / submit attempt. Not a [Failure] — validation is local.
 final  Map<int, String> _rowErrors;
/// Per-row validation errors surfaced inline (index → message). Cleared on
/// the next edit / submit attempt. Not a [Failure] — validation is local.
@override@JsonKey() Map<int, String> get rowErrors {
  if (_rowErrors is EqualUnmodifiableMapView) return _rowErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rowErrors);
}

@override@JsonKey() final  bool isSubmitting;
@override final  Failure? failure;
@override@JsonKey() final  bool saved;

/// Create a copy of BulkStockAdjustmentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BulkStockAdjustmentStateCopyWith<_BulkStockAdjustmentState> get copyWith => __$BulkStockAdjustmentStateCopyWithImpl<_BulkStockAdjustmentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BulkStockAdjustmentState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.isProductsLoading, isProductsLoading) || other.isProductsLoading == isProductsLoading)&&(identical(other.hasProductsError, hasProductsError) || other.hasProductsError == hasProductsError)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._rowErrors, _rowErrors)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),isProductsLoading,hasProductsError,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_rowErrors),isSubmitting,failure,saved);

@override
String toString() {
  return 'BulkStockAdjustmentState(products: $products, isProductsLoading: $isProductsLoading, hasProductsError: $hasProductsError, items: $items, rowErrors: $rowErrors, isSubmitting: $isSubmitting, failure: $failure, saved: $saved)';
}


}

/// @nodoc
abstract mixin class _$BulkStockAdjustmentStateCopyWith<$Res> implements $BulkStockAdjustmentStateCopyWith<$Res> {
  factory _$BulkStockAdjustmentStateCopyWith(_BulkStockAdjustmentState value, $Res Function(_BulkStockAdjustmentState) _then) = __$BulkStockAdjustmentStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCardModel> products, bool isProductsLoading, bool hasProductsError, List<BulkAdjustmentItemInput> items, Map<int, String> rowErrors, bool isSubmitting, Failure? failure, bool saved
});




}
/// @nodoc
class __$BulkStockAdjustmentStateCopyWithImpl<$Res>
    implements _$BulkStockAdjustmentStateCopyWith<$Res> {
  __$BulkStockAdjustmentStateCopyWithImpl(this._self, this._then);

  final _BulkStockAdjustmentState _self;
  final $Res Function(_BulkStockAdjustmentState) _then;

/// Create a copy of BulkStockAdjustmentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? isProductsLoading = null,Object? hasProductsError = null,Object? items = null,Object? rowErrors = null,Object? isSubmitting = null,Object? failure = freezed,Object? saved = null,}) {
  return _then(_BulkStockAdjustmentState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isProductsLoading: null == isProductsLoading ? _self.isProductsLoading : isProductsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasProductsError: null == hasProductsError ? _self.hasProductsError : hasProductsError // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BulkAdjustmentItemInput>,rowErrors: null == rowErrors ? _self._rowErrors : rowErrors // ignore: cast_nullable_to_non_nullable
as Map<int, String>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$BulkAdjustmentItemInput {

 BulkAdjustmentType get type; ProductCardModel? get product; String get quantity; String get purchasePrice; String get sellingPrice; String get batchNumber; String get expiryDate; StockBatchModel? get selectedBatch; List<StockBatchModel> get batches; bool get isBatchesLoading; String get notes; bool get expanded;
/// Create a copy of BulkAdjustmentItemInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulkAdjustmentItemInputCopyWith<BulkAdjustmentItemInput> get copyWith => _$BulkAdjustmentItemInputCopyWithImpl<BulkAdjustmentItemInput>(this as BulkAdjustmentItemInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkAdjustmentItemInput&&(identical(other.type, type) || other.type == type)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.selectedBatch, selectedBatch) || other.selectedBatch == selectedBatch)&&const DeepCollectionEquality().equals(other.batches, batches)&&(identical(other.isBatchesLoading, isBatchesLoading) || other.isBatchesLoading == isBatchesLoading)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.expanded, expanded) || other.expanded == expanded));
}


@override
int get hashCode => Object.hash(runtimeType,type,product,quantity,purchasePrice,sellingPrice,batchNumber,expiryDate,selectedBatch,const DeepCollectionEquality().hash(batches),isBatchesLoading,notes,expanded);

@override
String toString() {
  return 'BulkAdjustmentItemInput(type: $type, product: $product, quantity: $quantity, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, batchNumber: $batchNumber, expiryDate: $expiryDate, selectedBatch: $selectedBatch, batches: $batches, isBatchesLoading: $isBatchesLoading, notes: $notes, expanded: $expanded)';
}


}

/// @nodoc
abstract mixin class $BulkAdjustmentItemInputCopyWith<$Res>  {
  factory $BulkAdjustmentItemInputCopyWith(BulkAdjustmentItemInput value, $Res Function(BulkAdjustmentItemInput) _then) = _$BulkAdjustmentItemInputCopyWithImpl;
@useResult
$Res call({
 BulkAdjustmentType type, ProductCardModel? product, String quantity, String purchasePrice, String sellingPrice, String batchNumber, String expiryDate, StockBatchModel? selectedBatch, List<StockBatchModel> batches, bool isBatchesLoading, String notes, bool expanded
});




}
/// @nodoc
class _$BulkAdjustmentItemInputCopyWithImpl<$Res>
    implements $BulkAdjustmentItemInputCopyWith<$Res> {
  _$BulkAdjustmentItemInputCopyWithImpl(this._self, this._then);

  final BulkAdjustmentItemInput _self;
  final $Res Function(BulkAdjustmentItemInput) _then;

/// Create a copy of BulkAdjustmentItemInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? product = freezed,Object? quantity = null,Object? purchasePrice = null,Object? sellingPrice = null,Object? batchNumber = null,Object? expiryDate = null,Object? selectedBatch = freezed,Object? batches = null,Object? isBatchesLoading = null,Object? notes = null,Object? expanded = null,}) {
  return _then(BulkAdjustmentItemInput(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BulkAdjustmentType,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,selectedBatch: freezed == selectedBatch ? _self.selectedBatch : selectedBatch // ignore: cast_nullable_to_non_nullable
as StockBatchModel?,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<StockBatchModel>,isBatchesLoading: null == isBatchesLoading ? _self.isBatchesLoading : isBatchesLoading // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,expanded: null == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BulkAdjustmentItemInput].
extension BulkAdjustmentItemInputPatterns on BulkAdjustmentItemInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BulkAdjustmentItemInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BulkAdjustmentItemInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BulkAdjustmentItemInput value)  $default,){
final _that = this;
switch (_that) {
case _BulkAdjustmentItemInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BulkAdjustmentItemInput value)?  $default,){
final _that = this;
switch (_that) {
case _BulkAdjustmentItemInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BulkAdjustmentType type,  ProductCardModel? product,  String quantity,  String purchasePrice,  String sellingPrice,  String batchNumber,  String expiryDate,  StockBatchModel? selectedBatch,  List<StockBatchModel> batches,  bool isBatchesLoading,  String notes,  bool expanded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BulkAdjustmentItemInput() when $default != null:
return $default(_that.type,_that.product,_that.quantity,_that.purchasePrice,_that.sellingPrice,_that.batchNumber,_that.expiryDate,_that.selectedBatch,_that.batches,_that.isBatchesLoading,_that.notes,_that.expanded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BulkAdjustmentType type,  ProductCardModel? product,  String quantity,  String purchasePrice,  String sellingPrice,  String batchNumber,  String expiryDate,  StockBatchModel? selectedBatch,  List<StockBatchModel> batches,  bool isBatchesLoading,  String notes,  bool expanded)  $default,) {final _that = this;
switch (_that) {
case _BulkAdjustmentItemInput():
return $default(_that.type,_that.product,_that.quantity,_that.purchasePrice,_that.sellingPrice,_that.batchNumber,_that.expiryDate,_that.selectedBatch,_that.batches,_that.isBatchesLoading,_that.notes,_that.expanded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BulkAdjustmentType type,  ProductCardModel? product,  String quantity,  String purchasePrice,  String sellingPrice,  String batchNumber,  String expiryDate,  StockBatchModel? selectedBatch,  List<StockBatchModel> batches,  bool isBatchesLoading,  String notes,  bool expanded)?  $default,) {final _that = this;
switch (_that) {
case _BulkAdjustmentItemInput() when $default != null:
return $default(_that.type,_that.product,_that.quantity,_that.purchasePrice,_that.sellingPrice,_that.batchNumber,_that.expiryDate,_that.selectedBatch,_that.batches,_that.isBatchesLoading,_that.notes,_that.expanded);case _:
  return null;

}
}

}

/// @nodoc


class _BulkAdjustmentItemInput implements BulkAdjustmentItemInput {
  const _BulkAdjustmentItemInput({this.type = BulkAdjustmentType.add, this.product, this.quantity = '', this.purchasePrice = '', this.sellingPrice = '', this.batchNumber = '', this.expiryDate = '', this.selectedBatch,  List<StockBatchModel> batches = const <StockBatchModel>[], this.isBatchesLoading = false, this.notes = '', this.expanded = true}): _batches = batches;
  

@override@JsonKey() final  BulkAdjustmentType type;
@override final  ProductCardModel? product;
@override@JsonKey() final  String quantity;
@override@JsonKey() final  String purchasePrice;
@override@JsonKey() final  String sellingPrice;
@override@JsonKey() final  String batchNumber;
@override@JsonKey() final  String expiryDate;
@override final  StockBatchModel? selectedBatch;
 final  List<StockBatchModel> _batches;
@override@JsonKey() List<StockBatchModel> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}

@override@JsonKey() final  bool isBatchesLoading;
@override@JsonKey() final  String notes;
@override@JsonKey() final  bool expanded;

/// Create a copy of BulkAdjustmentItemInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BulkAdjustmentItemInputCopyWith<_BulkAdjustmentItemInput> get copyWith => __$BulkAdjustmentItemInputCopyWithImpl<_BulkAdjustmentItemInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BulkAdjustmentItemInput&&(identical(other.type, type) || other.type == type)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.selectedBatch, selectedBatch) || other.selectedBatch == selectedBatch)&&const DeepCollectionEquality().equals(other._batches, _batches)&&(identical(other.isBatchesLoading, isBatchesLoading) || other.isBatchesLoading == isBatchesLoading)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.expanded, expanded) || other.expanded == expanded));
}


@override
int get hashCode => Object.hash(runtimeType,type,product,quantity,purchasePrice,sellingPrice,batchNumber,expiryDate,selectedBatch,const DeepCollectionEquality().hash(_batches),isBatchesLoading,notes,expanded);

@override
String toString() {
  return 'BulkAdjustmentItemInput(type: $type, product: $product, quantity: $quantity, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, batchNumber: $batchNumber, expiryDate: $expiryDate, selectedBatch: $selectedBatch, batches: $batches, isBatchesLoading: $isBatchesLoading, notes: $notes, expanded: $expanded)';
}


}

/// @nodoc
abstract mixin class _$BulkAdjustmentItemInputCopyWith<$Res> implements $BulkAdjustmentItemInputCopyWith<$Res> {
  factory _$BulkAdjustmentItemInputCopyWith(_BulkAdjustmentItemInput value, $Res Function(_BulkAdjustmentItemInput) _then) = __$BulkAdjustmentItemInputCopyWithImpl;
@override @useResult
$Res call({
 BulkAdjustmentType type, ProductCardModel? product, String quantity, String purchasePrice, String sellingPrice, String batchNumber, String expiryDate, StockBatchModel? selectedBatch, List<StockBatchModel> batches, bool isBatchesLoading, String notes, bool expanded
});




}
/// @nodoc
class __$BulkAdjustmentItemInputCopyWithImpl<$Res>
    implements _$BulkAdjustmentItemInputCopyWith<$Res> {
  __$BulkAdjustmentItemInputCopyWithImpl(this._self, this._then);

  final _BulkAdjustmentItemInput _self;
  final $Res Function(_BulkAdjustmentItemInput) _then;

/// Create a copy of BulkAdjustmentItemInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? product = freezed,Object? quantity = null,Object? purchasePrice = null,Object? sellingPrice = null,Object? batchNumber = null,Object? expiryDate = null,Object? selectedBatch = freezed,Object? batches = null,Object? isBatchesLoading = null,Object? notes = null,Object? expanded = null,}) {
  return _then(_BulkAdjustmentItemInput(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BulkAdjustmentType,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,selectedBatch: freezed == selectedBatch ? _self.selectedBatch : selectedBatch // ignore: cast_nullable_to_non_nullable
as StockBatchModel?,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<StockBatchModel>,isBatchesLoading: null == isBatchesLoading ? _self.isBatchesLoading : isBatchesLoading // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,expanded: null == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
