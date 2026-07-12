// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_invoice_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalesInvoiceFormState {

 List<CustomerModel> get customers; List<ProductCardModel> get products; bool get isOptionsLoading; bool get hasOptionsError; CustomerModel? get selectedCustomer; List<SalesInvoiceItemInput> get items; bool get isSaving; Failure? get failure; bool get saved;
/// Create a copy of SalesInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesInvoiceFormStateCopyWith<SalesInvoiceFormState> get copyWith => _$SalesInvoiceFormStateCopyWithImpl<SalesInvoiceFormState>(this as SalesInvoiceFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesInvoiceFormState&&const DeepCollectionEquality().equals(other.customers, customers)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasOptionsError, hasOptionsError) || other.hasOptionsError == hasOptionsError)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(customers),const DeepCollectionEquality().hash(products),isOptionsLoading,hasOptionsError,selectedCustomer,const DeepCollectionEquality().hash(items),isSaving,failure,saved);

@override
String toString() {
  return 'SalesInvoiceFormState(customers: $customers, products: $products, isOptionsLoading: $isOptionsLoading, hasOptionsError: $hasOptionsError, selectedCustomer: $selectedCustomer, items: $items, isSaving: $isSaving, failure: $failure, saved: $saved)';
}


}

/// @nodoc
abstract mixin class $SalesInvoiceFormStateCopyWith<$Res>  {
  factory $SalesInvoiceFormStateCopyWith(SalesInvoiceFormState value, $Res Function(SalesInvoiceFormState) _then) = _$SalesInvoiceFormStateCopyWithImpl;
@useResult
$Res call({
 List<CustomerModel> customers, List<ProductCardModel> products, bool isOptionsLoading, bool hasOptionsError, CustomerModel? selectedCustomer, List<SalesInvoiceItemInput> items, bool isSaving, Failure? failure, bool saved
});




}
/// @nodoc
class _$SalesInvoiceFormStateCopyWithImpl<$Res>
    implements $SalesInvoiceFormStateCopyWith<$Res> {
  _$SalesInvoiceFormStateCopyWithImpl(this._self, this._then);

  final SalesInvoiceFormState _self;
  final $Res Function(SalesInvoiceFormState) _then;

/// Create a copy of SalesInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customers = null,Object? products = null,Object? isOptionsLoading = null,Object? hasOptionsError = null,Object? selectedCustomer = freezed,Object? items = null,Object? isSaving = null,Object? failure = freezed,Object? saved = null,}) {
  return _then(SalesInvoiceFormState(
customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasOptionsError: null == hasOptionsError ? _self.hasOptionsError : hasOptionsError // ignore: cast_nullable_to_non_nullable
as bool,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SalesInvoiceItemInput>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesInvoiceFormState].
extension SalesInvoiceFormStatePatterns on SalesInvoiceFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesInvoiceFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesInvoiceFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesInvoiceFormState value)  $default,){
final _that = this;
switch (_that) {
case _SalesInvoiceFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesInvoiceFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SalesInvoiceFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CustomerModel> customers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  CustomerModel? selectedCustomer,  List<SalesInvoiceItemInput> items,  bool isSaving,  Failure? failure,  bool saved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesInvoiceFormState() when $default != null:
return $default(_that.customers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.selectedCustomer,_that.items,_that.isSaving,_that.failure,_that.saved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CustomerModel> customers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  CustomerModel? selectedCustomer,  List<SalesInvoiceItemInput> items,  bool isSaving,  Failure? failure,  bool saved)  $default,) {final _that = this;
switch (_that) {
case _SalesInvoiceFormState():
return $default(_that.customers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.selectedCustomer,_that.items,_that.isSaving,_that.failure,_that.saved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CustomerModel> customers,  List<ProductCardModel> products,  bool isOptionsLoading,  bool hasOptionsError,  CustomerModel? selectedCustomer,  List<SalesInvoiceItemInput> items,  bool isSaving,  Failure? failure,  bool saved)?  $default,) {final _that = this;
switch (_that) {
case _SalesInvoiceFormState() when $default != null:
return $default(_that.customers,_that.products,_that.isOptionsLoading,_that.hasOptionsError,_that.selectedCustomer,_that.items,_that.isSaving,_that.failure,_that.saved);case _:
  return null;

}
}

}

/// @nodoc


class _SalesInvoiceFormState implements SalesInvoiceFormState {
  const _SalesInvoiceFormState({ List<CustomerModel> customers = const <CustomerModel>[],  List<ProductCardModel> products = const <ProductCardModel>[], this.isOptionsLoading = false, this.hasOptionsError = false, this.selectedCustomer,  List<SalesInvoiceItemInput> items = const <SalesInvoiceItemInput>[], this.isSaving = false, this.failure, this.saved = false}): _customers = customers,_products = products,_items = items;
  

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
@override final  CustomerModel? selectedCustomer;
 final  List<SalesInvoiceItemInput> _items;
@override@JsonKey() List<SalesInvoiceItemInput> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isSaving;
@override final  Failure? failure;
@override@JsonKey() final  bool saved;

/// Create a copy of SalesInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesInvoiceFormStateCopyWith<_SalesInvoiceFormState> get copyWith => __$SalesInvoiceFormStateCopyWithImpl<_SalesInvoiceFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesInvoiceFormState&&const DeepCollectionEquality().equals(other._customers, _customers)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasOptionsError, hasOptionsError) || other.hasOptionsError == hasOptionsError)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customers),const DeepCollectionEquality().hash(_products),isOptionsLoading,hasOptionsError,selectedCustomer,const DeepCollectionEquality().hash(_items),isSaving,failure,saved);

@override
String toString() {
  return 'SalesInvoiceFormState(customers: $customers, products: $products, isOptionsLoading: $isOptionsLoading, hasOptionsError: $hasOptionsError, selectedCustomer: $selectedCustomer, items: $items, isSaving: $isSaving, failure: $failure, saved: $saved)';
}


}

/// @nodoc
abstract mixin class _$SalesInvoiceFormStateCopyWith<$Res> implements $SalesInvoiceFormStateCopyWith<$Res> {
  factory _$SalesInvoiceFormStateCopyWith(_SalesInvoiceFormState value, $Res Function(_SalesInvoiceFormState) _then) = __$SalesInvoiceFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerModel> customers, List<ProductCardModel> products, bool isOptionsLoading, bool hasOptionsError, CustomerModel? selectedCustomer, List<SalesInvoiceItemInput> items, bool isSaving, Failure? failure, bool saved
});




}
/// @nodoc
class __$SalesInvoiceFormStateCopyWithImpl<$Res>
    implements _$SalesInvoiceFormStateCopyWith<$Res> {
  __$SalesInvoiceFormStateCopyWithImpl(this._self, this._then);

  final _SalesInvoiceFormState _self;
  final $Res Function(_SalesInvoiceFormState) _then;

/// Create a copy of SalesInvoiceFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customers = null,Object? products = null,Object? isOptionsLoading = null,Object? hasOptionsError = null,Object? selectedCustomer = freezed,Object? items = null,Object? isSaving = null,Object? failure = freezed,Object? saved = null,}) {
  return _then(_SalesInvoiceFormState(
customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasOptionsError: null == hasOptionsError ? _self.hasOptionsError : hasOptionsError // ignore: cast_nullable_to_non_nullable
as bool,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SalesInvoiceItemInput>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SalesInvoiceItemInput {

 ProductCardModel? get product; String get quantity; String get sellingPrice; String get tax; String get discount;
/// Create a copy of SalesInvoiceItemInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesInvoiceItemInputCopyWith<SalesInvoiceItemInput> get copyWith => _$SalesInvoiceItemInputCopyWithImpl<SalesInvoiceItemInput>(this as SalesInvoiceItemInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesInvoiceItemInput&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,sellingPrice,tax,discount);

@override
String toString() {
  return 'SalesInvoiceItemInput(product: $product, quantity: $quantity, sellingPrice: $sellingPrice, tax: $tax, discount: $discount)';
}


}

/// @nodoc
abstract mixin class $SalesInvoiceItemInputCopyWith<$Res>  {
  factory $SalesInvoiceItemInputCopyWith(SalesInvoiceItemInput value, $Res Function(SalesInvoiceItemInput) _then) = _$SalesInvoiceItemInputCopyWithImpl;
@useResult
$Res call({
 ProductCardModel? product, String quantity, String sellingPrice, String tax, String discount
});




}
/// @nodoc
class _$SalesInvoiceItemInputCopyWithImpl<$Res>
    implements $SalesInvoiceItemInputCopyWith<$Res> {
  _$SalesInvoiceItemInputCopyWithImpl(this._self, this._then);

  final SalesInvoiceItemInput _self;
  final $Res Function(SalesInvoiceItemInput) _then;

/// Create a copy of SalesInvoiceItemInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = freezed,Object? quantity = null,Object? sellingPrice = null,Object? tax = null,Object? discount = null,}) {
  return _then(SalesInvoiceItemInput(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesInvoiceItemInput].
extension SalesInvoiceItemInputPatterns on SalesInvoiceItemInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesInvoiceItemInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesInvoiceItemInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesInvoiceItemInput value)  $default,){
final _that = this;
switch (_that) {
case _SalesInvoiceItemInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesInvoiceItemInput value)?  $default,){
final _that = this;
switch (_that) {
case _SalesInvoiceItemInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductCardModel? product,  String quantity,  String sellingPrice,  String tax,  String discount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesInvoiceItemInput() when $default != null:
return $default(_that.product,_that.quantity,_that.sellingPrice,_that.tax,_that.discount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductCardModel? product,  String quantity,  String sellingPrice,  String tax,  String discount)  $default,) {final _that = this;
switch (_that) {
case _SalesInvoiceItemInput():
return $default(_that.product,_that.quantity,_that.sellingPrice,_that.tax,_that.discount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductCardModel? product,  String quantity,  String sellingPrice,  String tax,  String discount)?  $default,) {final _that = this;
switch (_that) {
case _SalesInvoiceItemInput() when $default != null:
return $default(_that.product,_that.quantity,_that.sellingPrice,_that.tax,_that.discount);case _:
  return null;

}
}

}

/// @nodoc


class _SalesInvoiceItemInput implements SalesInvoiceItemInput {
  const _SalesInvoiceItemInput({this.product, this.quantity = '', this.sellingPrice = '', this.tax = '', this.discount = ''});
  

@override final  ProductCardModel? product;
@override@JsonKey() final  String quantity;
@override@JsonKey() final  String sellingPrice;
@override@JsonKey() final  String tax;
@override@JsonKey() final  String discount;

/// Create a copy of SalesInvoiceItemInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesInvoiceItemInputCopyWith<_SalesInvoiceItemInput> get copyWith => __$SalesInvoiceItemInputCopyWithImpl<_SalesInvoiceItemInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesInvoiceItemInput&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,sellingPrice,tax,discount);

@override
String toString() {
  return 'SalesInvoiceItemInput(product: $product, quantity: $quantity, sellingPrice: $sellingPrice, tax: $tax, discount: $discount)';
}


}

/// @nodoc
abstract mixin class _$SalesInvoiceItemInputCopyWith<$Res> implements $SalesInvoiceItemInputCopyWith<$Res> {
  factory _$SalesInvoiceItemInputCopyWith(_SalesInvoiceItemInput value, $Res Function(_SalesInvoiceItemInput) _then) = __$SalesInvoiceItemInputCopyWithImpl;
@override @useResult
$Res call({
 ProductCardModel? product, String quantity, String sellingPrice, String tax, String discount
});




}
/// @nodoc
class __$SalesInvoiceItemInputCopyWithImpl<$Res>
    implements _$SalesInvoiceItemInputCopyWith<$Res> {
  __$SalesInvoiceItemInputCopyWithImpl(this._self, this._then);

  final _SalesInvoiceItemInput _self;
  final $Res Function(_SalesInvoiceItemInput) _then;

/// Create a copy of SalesInvoiceItemInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = freezed,Object? quantity = null,Object? sellingPrice = null,Object? tax = null,Object? discount = null,}) {
  return _then(_SalesInvoiceItemInput(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductCardModel?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
