// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_return_invoice_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerReturnInvoiceFormState {

 List<CustomerModel> get customers; List<ProductCardModel> get products; bool get isOptionsLoading; bool get hasOptionsError; Failure? get optionsFailure; CustomerModel? get selectedCustomer;/// Set when the return is seeded from a sales invoice — sent as
/// `original_sales_invoice_id` on submit.
 int? get originalSalesInvoiceId;/// Products allowed to be selected when seeded from an invoice. Empty means
/// no restriction (standalone return). Used to filter the product dropdown.
 Set<int> get allowedProductIds;/// Maps each original invoice product id to its sold quantity for seeded
/// returns, so the form can cap return quantities per product.
 Map<int, int> get originalInvoiceQuantities; List<CustomerReturnItemInput> get items; bool get isSaving; Failure? get failure; bool get saved;/// True while a barcode lookup is in flight from the in-form scanner.
 bool get isScanning;
/// Create a copy of CustomerReturnInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerReturnInvoiceFormStateCopyWith<CustomerReturnInvoiceFormState> get copyWith => _$CustomerReturnInvoiceFormStateCopyWithImpl<CustomerReturnInvoiceFormState>(this as CustomerReturnInvoiceFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerReturnInvoiceFormState&&const DeepCollectionEquality().equals(other.customers, customers)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasOptionsError, hasOptionsError) || other.hasOptionsError == hasOptionsError)&&(identical(other.optionsFailure, optionsFailure) || other.optionsFailure == optionsFailure)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.originalSalesInvoiceId, originalSalesInvoiceId) || other.originalSalesInvoiceId == originalSalesInvoiceId)&&const DeepCollectionEquality().equals(other.allowedProductIds, allowedProductIds)&&const DeepCollectionEquality().equals(other.originalInvoiceQuantities, originalInvoiceQuantities)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(customers),const DeepCollectionEquality().hash(products),isOptionsLoading,hasOptionsError,optionsFailure,selectedCustomer,originalSalesInvoiceId,const DeepCollectionEquality().hash(allowedProductIds),const DeepCollectionEquality().hash(originalInvoiceQuantities),const DeepCollectionEquality().hash(items),isSaving,failure,saved,isScanning);

@override
String toString() {
  return 'CustomerReturnInvoiceFormState(customers: $customers, products: $products, isOptionsLoading: $isOptionsLoading, hasOptionsError: $hasOptionsError, optionsFailure: $optionsFailure, selectedCustomer: $selectedCustomer, originalSalesInvoiceId: $originalSalesInvoiceId, allowedProductIds: $allowedProductIds, originalInvoiceQuantities: $originalInvoiceQuantities, items: $items, isSaving: $isSaving, failure: $failure, saved: $saved, isScanning: $isScanning)';
}


}

/// @nodoc
abstract mixin class $CustomerReturnInvoiceFormStateCopyWith<$Res>  {
  factory $CustomerReturnInvoiceFormStateCopyWith(CustomerReturnInvoiceFormState value, $Res Function(CustomerReturnInvoiceFormState) _then) = _$CustomerReturnInvoiceFormStateCopyWithImpl;
@useResult
$Res call({
 List<CustomerModel> customers, List<ProductCardModel> products, bool isOptionsLoading, bool hasOptionsError, Failure? optionsFailure, CustomerModel? selectedCustomer, int? originalSalesInvoiceId, Set<int> allowedProductIds, Map<int, int> originalInvoiceQuantities, List<CustomerReturnItemInput> items, bool isSaving, Failure? failure, bool saved, bool isScanning
});




}
/// @nodoc
class _$CustomerReturnInvoiceFormStateCopyWithImpl<$Res>
    implements $CustomerReturnInvoiceFormStateCopyWith<$Res> {
  _$CustomerReturnInvoiceFormStateCopyWithImpl(this._self, this._then);

  final CustomerReturnInvoiceFormState _self;
  final $Res Function(CustomerReturnInvoiceFormState) _then;

/// Create a copy of CustomerReturnInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customers = null,Object? products = null,Object? isOptionsLoading = null,Object? hasOptionsError = null,Object? optionsFailure = freezed,Object? selectedCustomer = freezed,Object? originalSalesInvoiceId = freezed,Object? allowedProductIds = null,Object? originalInvoiceQuantities = null,Object? items = null,Object? isSaving = null,Object? failure = freezed,Object? saved = null,Object? isScanning = null,}) {
  return _then(CustomerReturnInvoiceFormState(
customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasOptionsError: null == hasOptionsError ? _self.hasOptionsError : hasOptionsError // ignore: cast_nullable_to_non_nullable
as bool,optionsFailure: freezed == optionsFailure ? _self.optionsFailure : optionsFailure // ignore: cast_nullable_to_non_nullable
as Failure?,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,originalSalesInvoiceId: freezed == originalSalesInvoiceId ? _self.originalSalesInvoiceId : originalSalesInvoiceId // ignore: cast_nullable_to_non_nullable
as int?,allowedProductIds: null == allowedProductIds ? _self.allowedProductIds : allowedProductIds // ignore: cast_nullable_to_non_nullable
as Set<int>,originalInvoiceQuantities: null == originalInvoiceQuantities ? _self.originalInvoiceQuantities : originalInvoiceQuantities // ignore: cast_nullable_to_non_nullable
as Map<int, int>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CustomerReturnItemInput>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerReturnInvoiceFormState].
extension CustomerReturnInvoiceFormStatePatterns on CustomerReturnInvoiceFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerReturnInvoiceFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerReturnInvoiceFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerReturnInvoiceFormState value)  $default,){
final _that = this;
switch (_that) {
case _CustomerReturnInvoiceFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerReturnInvoiceFormState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerReturnInvoiceFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CustomerModel> customers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  Failure? optionsFailure,  CustomerModel? selectedCustomer,  int? originalSalesInvoiceId,  Set<int> allowedProductIds,  Map<int, int> originalInvoiceQuantities,  List<CustomerReturnItemInput> items,  bool isSaving,  Failure? failure,  bool saved,  bool isScanning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerReturnInvoiceFormState() when $default != null:
return $default(_that.customers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.optionsFailure,_that.selectedCustomer,_that.originalSalesInvoiceId,_that.allowedProductIds,_that.originalInvoiceQuantities,_that.items,_that.isSaving,_that.failure,_that.saved,_that.isScanning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CustomerModel> customers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  Failure? optionsFailure,  CustomerModel? selectedCustomer,  int? originalSalesInvoiceId,  Set<int> allowedProductIds,  Map<int, int> originalInvoiceQuantities,  List<CustomerReturnItemInput> items,  bool isSaving,  Failure? failure,  bool saved,  bool isScanning)  $default,) {final _that = this;
switch (_that) {
case _CustomerReturnInvoiceFormState():
return $default(_that.customers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.optionsFailure,_that.selectedCustomer,_that.originalSalesInvoiceId,_that.allowedProductIds,_that.originalInvoiceQuantities,_that.items,_that.isSaving,_that.failure,_that.saved,_that.isScanning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CustomerModel> customers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  Failure? optionsFailure,  CustomerModel? selectedCustomer,  int? originalSalesInvoiceId,  Set<int> allowedProductIds,  Map<int, int> originalInvoiceQuantities,  List<CustomerReturnItemInput> items,  bool isSaving,  Failure? failure,  bool saved,  bool isScanning)?  $default,) {final _that = this;
switch (_that) {
case _CustomerReturnInvoiceFormState() when $default != null:
return $default(_that.customers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.optionsFailure,_that.selectedCustomer,_that.originalSalesInvoiceId,_that.allowedProductIds,_that.originalInvoiceQuantities,_that.items,_that.isSaving,_that.failure,_that.saved,_that.isScanning);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerReturnInvoiceFormState implements CustomerReturnInvoiceFormState {
  const _CustomerReturnInvoiceFormState({ List<CustomerModel> customers = const <CustomerModel>[],  List<ProductCardModel> products = const <ProductCardModel>[], this.isOptionsLoading = false, this.hasOptionsError = false, this.optionsFailure, this.selectedCustomer, this.originalSalesInvoiceId,  Set<int> allowedProductIds = const <int>{},  Map<int, int> originalInvoiceQuantities = const <int, int>{},  List<CustomerReturnItemInput> items = const <CustomerReturnItemInput>[], this.isSaving = false, this.failure, this.saved = false, this.isScanning = false}): _customers = customers,_products = products,_allowedProductIds = allowedProductIds,_originalInvoiceQuantities = originalInvoiceQuantities,_items = items;
  

 final  List<CustomerModel> _customers;
@override@JsonKey() List<CustomerModel> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
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
@override final  CustomerModel? selectedCustomer;
/// Set when the return is seeded from a sales invoice — sent as
/// `original_sales_invoice_id` on submit.
@override final  int? originalSalesInvoiceId;
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

/// Maps each original invoice product id to its sold quantity for seeded
/// returns, so the form can cap return quantities per product.
 final  Map<int, int> _originalInvoiceQuantities;
/// Maps each original invoice product id to its sold quantity for seeded
/// returns, so the form can cap return quantities per product.
@override@JsonKey() Map<int, int> get originalInvoiceQuantities {
  if (_originalInvoiceQuantities is EqualUnmodifiableMapView) return _originalInvoiceQuantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_originalInvoiceQuantities);
}

 final  List<CustomerReturnItemInput> _items;
@override@JsonKey() List<CustomerReturnItemInput> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isSaving;
@override final  Failure? failure;
@override@JsonKey() final  bool saved;
/// True while a barcode lookup is in flight from the in-form scanner.
@override@JsonKey() final  bool isScanning;

/// Create a copy of CustomerReturnInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerReturnInvoiceFormStateCopyWith<_CustomerReturnInvoiceFormState> get copyWith => __$CustomerReturnInvoiceFormStateCopyWithImpl<_CustomerReturnInvoiceFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerReturnInvoiceFormState&&const DeepCollectionEquality().equals(other._customers, _customers)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasOptionsError, hasOptionsError) || other.hasOptionsError == hasOptionsError)&&(identical(other.optionsFailure, optionsFailure) || other.optionsFailure == optionsFailure)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.originalSalesInvoiceId, originalSalesInvoiceId) || other.originalSalesInvoiceId == originalSalesInvoiceId)&&const DeepCollectionEquality().equals(other._allowedProductIds, _allowedProductIds)&&const DeepCollectionEquality().equals(other._originalInvoiceQuantities, _originalInvoiceQuantities)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customers),const DeepCollectionEquality().hash(_products),isOptionsLoading,hasOptionsError,optionsFailure,selectedCustomer,originalSalesInvoiceId,const DeepCollectionEquality().hash(_allowedProductIds),const DeepCollectionEquality().hash(_originalInvoiceQuantities),const DeepCollectionEquality().hash(_items),isSaving,failure,saved,isScanning);

@override
String toString() {
  return 'CustomerReturnInvoiceFormState(customers: $customers, products: $products, isOptionsLoading: $isOptionsLoading, hasOptionsError: $hasOptionsError, optionsFailure: $optionsFailure, selectedCustomer: $selectedCustomer, originalSalesInvoiceId: $originalSalesInvoiceId, allowedProductIds: $allowedProductIds, originalInvoiceQuantities: $originalInvoiceQuantities, items: $items, isSaving: $isSaving, failure: $failure, saved: $saved, isScanning: $isScanning)';
}


}

/// @nodoc
abstract mixin class _$CustomerReturnInvoiceFormStateCopyWith<$Res> implements $CustomerReturnInvoiceFormStateCopyWith<$Res> {
  factory _$CustomerReturnInvoiceFormStateCopyWith(_CustomerReturnInvoiceFormState value, $Res Function(_CustomerReturnInvoiceFormState) _then) = __$CustomerReturnInvoiceFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerModel> customers, List<ProductCardModel> products, bool isOptionsLoading, bool hasOptionsError, Failure? optionsFailure, CustomerModel? selectedCustomer, int? originalSalesInvoiceId, Set<int> allowedProductIds, Map<int, int> originalInvoiceQuantities, List<CustomerReturnItemInput> items, bool isSaving, Failure? failure, bool saved, bool isScanning
});




}
/// @nodoc
class __$CustomerReturnInvoiceFormStateCopyWithImpl<$Res>
    implements _$CustomerReturnInvoiceFormStateCopyWith<$Res> {
  __$CustomerReturnInvoiceFormStateCopyWithImpl(this._self, this._then);

  final _CustomerReturnInvoiceFormState _self;
  final $Res Function(_CustomerReturnInvoiceFormState) _then;

/// Create a copy of CustomerReturnInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customers = null,Object? products = null,Object? isOptionsLoading = null,Object? hasOptionsError = null,Object? optionsFailure = freezed,Object? selectedCustomer = freezed,Object? originalSalesInvoiceId = freezed,Object? allowedProductIds = null,Object? originalInvoiceQuantities = null,Object? items = null,Object? isSaving = null,Object? failure = freezed,Object? saved = null,Object? isScanning = null,}) {
  return _then(_CustomerReturnInvoiceFormState(
customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasOptionsError: null == hasOptionsError ? _self.hasOptionsError : hasOptionsError // ignore: cast_nullable_to_non_nullable
as bool,optionsFailure: freezed == optionsFailure ? _self.optionsFailure : optionsFailure // ignore: cast_nullable_to_non_nullable
as Failure?,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,originalSalesInvoiceId: freezed == originalSalesInvoiceId ? _self.originalSalesInvoiceId : originalSalesInvoiceId // ignore: cast_nullable_to_non_nullable
as int?,allowedProductIds: null == allowedProductIds ? _self._allowedProductIds : allowedProductIds // ignore: cast_nullable_to_non_nullable
as Set<int>,originalInvoiceQuantities: null == originalInvoiceQuantities ? _self._originalInvoiceQuantities : originalInvoiceQuantities // ignore: cast_nullable_to_non_nullable
as Map<int, int>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CustomerReturnItemInput>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CustomerReturnItemInput {

 ProductCardModel? get product;/// The original sale product id on seeded returns, kept so the row can be
/// matched to a product once the dropdown options load.
 int? get originalProductId; String get quantity; String get unitPrice; String get tax; String get discount;
/// Create a copy of CustomerReturnItemInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerReturnItemInputCopyWith<CustomerReturnItemInput> get copyWith => _$CustomerReturnItemInputCopyWithImpl<CustomerReturnItemInput>(this as CustomerReturnItemInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerReturnItemInput&&(identical(other.product, product) || other.product == product)&&(identical(other.originalProductId, originalProductId) || other.originalProductId == originalProductId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount));
}


@override
int get hashCode => Object.hash(runtimeType,product,originalProductId,quantity,unitPrice,tax,discount);

@override
String toString() {
  return 'CustomerReturnItemInput(product: $product, originalProductId: $originalProductId, quantity: $quantity, unitPrice: $unitPrice, tax: $tax, discount: $discount)';
}


}

/// @nodoc
abstract mixin class $CustomerReturnItemInputCopyWith<$Res>  {
  factory $CustomerReturnItemInputCopyWith(CustomerReturnItemInput value, $Res Function(CustomerReturnItemInput) _then) = _$CustomerReturnItemInputCopyWithImpl;
@useResult
$Res call({
 ProductCardModel? product, int? originalProductId, String quantity, String unitPrice, String tax, String discount
});




}
/// @nodoc
class _$CustomerReturnItemInputCopyWithImpl<$Res>
    implements $CustomerReturnItemInputCopyWith<$Res> {
  _$CustomerReturnItemInputCopyWithImpl(this._self, this._then);

  final CustomerReturnItemInput _self;
  final $Res Function(CustomerReturnItemInput) _then;

/// Create a copy of CustomerReturnItemInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = freezed,Object? originalProductId = freezed,Object? quantity = null,Object? unitPrice = null,Object? tax = null,Object? discount = null,}) {
  return _then(CustomerReturnItemInput(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,originalProductId: freezed == originalProductId ? _self.originalProductId : originalProductId // ignore: cast_nullable_to_non_nullable
as int?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerReturnItemInput].
extension CustomerReturnItemInputPatterns on CustomerReturnItemInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerReturnItemInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerReturnItemInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerReturnItemInput value)  $default,){
final _that = this;
switch (_that) {
case _CustomerReturnItemInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerReturnItemInput value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerReturnItemInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductCardModel? product,  int? originalProductId,  String quantity,  String unitPrice,  String tax,  String discount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerReturnItemInput() when $default != null:
return $default(_that.product,_that.originalProductId,_that.quantity,_that.unitPrice,_that.tax,_that.discount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductCardModel? product,  int? originalProductId,  String quantity,  String unitPrice,  String tax,  String discount)  $default,) {final _that = this;
switch (_that) {
case _CustomerReturnItemInput():
return $default(_that.product,_that.originalProductId,_that.quantity,_that.unitPrice,_that.tax,_that.discount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductCardModel? product,  int? originalProductId,  String quantity,  String unitPrice,  String tax,  String discount)?  $default,) {final _that = this;
switch (_that) {
case _CustomerReturnItemInput() when $default != null:
return $default(_that.product,_that.originalProductId,_that.quantity,_that.unitPrice,_that.tax,_that.discount);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerReturnItemInput implements CustomerReturnItemInput {
  const _CustomerReturnItemInput({this.product, this.originalProductId, this.quantity = '', this.unitPrice = '', this.tax = '', this.discount = ''});
  

@override final  ProductCardModel? product;
/// The original sale product id on seeded returns, kept so the row can be
/// matched to a product once the dropdown options load.
@override final  int? originalProductId;
@override@JsonKey() final  String quantity;
@override@JsonKey() final  String unitPrice;
@override@JsonKey() final  String tax;
@override@JsonKey() final  String discount;

/// Create a copy of CustomerReturnItemInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerReturnItemInputCopyWith<_CustomerReturnItemInput> get copyWith => __$CustomerReturnItemInputCopyWithImpl<_CustomerReturnItemInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerReturnItemInput&&(identical(other.product, product) || other.product == product)&&(identical(other.originalProductId, originalProductId) || other.originalProductId == originalProductId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount));
}


@override
int get hashCode => Object.hash(runtimeType,product,originalProductId,quantity,unitPrice,tax,discount);

@override
String toString() {
  return 'CustomerReturnItemInput(product: $product, originalProductId: $originalProductId, quantity: $quantity, unitPrice: $unitPrice, tax: $tax, discount: $discount)';
}


}

/// @nodoc
abstract mixin class _$CustomerReturnItemInputCopyWith<$Res> implements $CustomerReturnItemInputCopyWith<$Res> {
  factory _$CustomerReturnItemInputCopyWith(_CustomerReturnItemInput value, $Res Function(_CustomerReturnItemInput) _then) = __$CustomerReturnItemInputCopyWithImpl;
@override @useResult
$Res call({
 ProductCardModel? product, int? originalProductId, String quantity, String unitPrice, String tax, String discount
});




}
/// @nodoc
class __$CustomerReturnItemInputCopyWithImpl<$Res>
    implements _$CustomerReturnItemInputCopyWith<$Res> {
  __$CustomerReturnItemInputCopyWithImpl(this._self, this._then);

  final _CustomerReturnItemInput _self;
  final $Res Function(_CustomerReturnItemInput) _then;

/// Create a copy of CustomerReturnItemInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = freezed,Object? originalProductId = freezed,Object? quantity = null,Object? unitPrice = null,Object? tax = null,Object? discount = null,}) {
  return _then(_CustomerReturnItemInput(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,originalProductId: freezed == originalProductId ? _self.originalProductId : originalProductId // ignore: cast_nullable_to_non_nullable
as int?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
