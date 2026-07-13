// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_return_invoice_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerReturnInvoiceDetailState {

 bool get isLoading; bool get isRefreshing; bool get isCancelling; CustomerReturnInvoiceModel? get returnInvoice; Failure? get failure; CustomerReturnDetailAction? get lastAction;
/// Create a copy of CustomerReturnInvoiceDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerReturnInvoiceDetailStateCopyWith<CustomerReturnInvoiceDetailState> get copyWith => _$CustomerReturnInvoiceDetailStateCopyWithImpl<CustomerReturnInvoiceDetailState>(this as CustomerReturnInvoiceDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerReturnInvoiceDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isCancelling, isCancelling) || other.isCancelling == isCancelling)&&(identical(other.returnInvoice, returnInvoice) || other.returnInvoice == returnInvoice)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,isCancelling,returnInvoice,failure,lastAction);

@override
String toString() {
  return 'CustomerReturnInvoiceDetailState(isLoading: $isLoading, isRefreshing: $isRefreshing, isCancelling: $isCancelling, returnInvoice: $returnInvoice, failure: $failure, lastAction: $lastAction)';
}


}

/// @nodoc
abstract mixin class $CustomerReturnInvoiceDetailStateCopyWith<$Res>  {
  factory $CustomerReturnInvoiceDetailStateCopyWith(CustomerReturnInvoiceDetailState value, $Res Function(CustomerReturnInvoiceDetailState) _then) = _$CustomerReturnInvoiceDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isRefreshing, bool isCancelling, CustomerReturnInvoiceModel? returnInvoice, Failure? failure, CustomerReturnDetailAction? lastAction
});




}
/// @nodoc
class _$CustomerReturnInvoiceDetailStateCopyWithImpl<$Res>
    implements $CustomerReturnInvoiceDetailStateCopyWith<$Res> {
  _$CustomerReturnInvoiceDetailStateCopyWithImpl(this._self, this._then);

  final CustomerReturnInvoiceDetailState _self;
  final $Res Function(CustomerReturnInvoiceDetailState) _then;

/// Create a copy of CustomerReturnInvoiceDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? isCancelling = null,Object? returnInvoice = freezed,Object? failure = freezed,Object? lastAction = freezed,}) {
  return _then(CustomerReturnInvoiceDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isCancelling: null == isCancelling ? _self.isCancelling : isCancelling // ignore: cast_nullable_to_non_nullable
as bool,returnInvoice: freezed == returnInvoice ? _self.returnInvoice : returnInvoice // ignore: cast_nullable_to_non_nullable
as CustomerReturnInvoiceModel?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as CustomerReturnDetailAction?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerReturnInvoiceDetailState].
extension CustomerReturnInvoiceDetailStatePatterns on CustomerReturnInvoiceDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerReturnInvoiceDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerReturnInvoiceDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerReturnInvoiceDetailState value)  $default,){
final _that = this;
switch (_that) {
case _CustomerReturnInvoiceDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerReturnInvoiceDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerReturnInvoiceDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  bool isCancelling,  CustomerReturnInvoiceModel? returnInvoice,  Failure? failure,  CustomerReturnDetailAction? lastAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerReturnInvoiceDetailState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.isCancelling,_that.returnInvoice,_that.failure,_that.lastAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  bool isCancelling,  CustomerReturnInvoiceModel? returnInvoice,  Failure? failure,  CustomerReturnDetailAction? lastAction)  $default,) {final _that = this;
switch (_that) {
case _CustomerReturnInvoiceDetailState():
return $default(_that.isLoading,_that.isRefreshing,_that.isCancelling,_that.returnInvoice,_that.failure,_that.lastAction);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isRefreshing,  bool isCancelling,  CustomerReturnInvoiceModel? returnInvoice,  Failure? failure,  CustomerReturnDetailAction? lastAction)?  $default,) {final _that = this;
switch (_that) {
case _CustomerReturnInvoiceDetailState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.isCancelling,_that.returnInvoice,_that.failure,_that.lastAction);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerReturnInvoiceDetailState implements CustomerReturnInvoiceDetailState {
  const _CustomerReturnInvoiceDetailState({this.isLoading = false, this.isRefreshing = false, this.isCancelling = false, this.returnInvoice, this.failure, this.lastAction});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool isCancelling;
@override final  CustomerReturnInvoiceModel? returnInvoice;
@override final  Failure? failure;
@override final  CustomerReturnDetailAction? lastAction;

/// Create a copy of CustomerReturnInvoiceDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerReturnInvoiceDetailStateCopyWith<_CustomerReturnInvoiceDetailState> get copyWith => __$CustomerReturnInvoiceDetailStateCopyWithImpl<_CustomerReturnInvoiceDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerReturnInvoiceDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isCancelling, isCancelling) || other.isCancelling == isCancelling)&&(identical(other.returnInvoice, returnInvoice) || other.returnInvoice == returnInvoice)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,isCancelling,returnInvoice,failure,lastAction);

@override
String toString() {
  return 'CustomerReturnInvoiceDetailState(isLoading: $isLoading, isRefreshing: $isRefreshing, isCancelling: $isCancelling, returnInvoice: $returnInvoice, failure: $failure, lastAction: $lastAction)';
}


}

/// @nodoc
abstract mixin class _$CustomerReturnInvoiceDetailStateCopyWith<$Res> implements $CustomerReturnInvoiceDetailStateCopyWith<$Res> {
  factory _$CustomerReturnInvoiceDetailStateCopyWith(_CustomerReturnInvoiceDetailState value, $Res Function(_CustomerReturnInvoiceDetailState) _then) = __$CustomerReturnInvoiceDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isRefreshing, bool isCancelling, CustomerReturnInvoiceModel? returnInvoice, Failure? failure, CustomerReturnDetailAction? lastAction
});




}
/// @nodoc
class __$CustomerReturnInvoiceDetailStateCopyWithImpl<$Res>
    implements _$CustomerReturnInvoiceDetailStateCopyWith<$Res> {
  __$CustomerReturnInvoiceDetailStateCopyWithImpl(this._self, this._then);

  final _CustomerReturnInvoiceDetailState _self;
  final $Res Function(_CustomerReturnInvoiceDetailState) _then;

/// Create a copy of CustomerReturnInvoiceDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? isCancelling = null,Object? returnInvoice = freezed,Object? failure = freezed,Object? lastAction = freezed,}) {
  return _then(_CustomerReturnInvoiceDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isCancelling: null == isCancelling ? _self.isCancelling : isCancelling // ignore: cast_nullable_to_non_nullable
as bool,returnInvoice: freezed == returnInvoice ? _self.returnInvoice : returnInvoice // ignore: cast_nullable_to_non_nullable
as CustomerReturnInvoiceModel?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as CustomerReturnDetailAction?,
  ));
}


}

// dart format on
