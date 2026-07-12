// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_invoice_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseInvoiceDetailState {

 bool get isLoading; bool get isRefreshing; bool get isCancelling; PurchaseInvoiceModel? get invoice; Failure? get failure; InvoiceDetailAction? get lastAction;
/// Create a copy of PurchaseInvoiceDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseInvoiceDetailStateCopyWith<PurchaseInvoiceDetailState> get copyWith => _$PurchaseInvoiceDetailStateCopyWithImpl<PurchaseInvoiceDetailState>(this as PurchaseInvoiceDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseInvoiceDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isCancelling, isCancelling) || other.isCancelling == isCancelling)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,isCancelling,invoice,failure,lastAction);

@override
String toString() {
  return 'PurchaseInvoiceDetailState(isLoading: $isLoading, isRefreshing: $isRefreshing, isCancelling: $isCancelling, invoice: $invoice, failure: $failure, lastAction: $lastAction)';
}


}

/// @nodoc
abstract mixin class $PurchaseInvoiceDetailStateCopyWith<$Res>  {
  factory $PurchaseInvoiceDetailStateCopyWith(PurchaseInvoiceDetailState value, $Res Function(PurchaseInvoiceDetailState) _then) = _$PurchaseInvoiceDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isRefreshing, bool isCancelling, PurchaseInvoiceModel? invoice, Failure? failure, InvoiceDetailAction? lastAction
});




}
/// @nodoc
class _$PurchaseInvoiceDetailStateCopyWithImpl<$Res>
    implements $PurchaseInvoiceDetailStateCopyWith<$Res> {
  _$PurchaseInvoiceDetailStateCopyWithImpl(this._self, this._then);

  final PurchaseInvoiceDetailState _self;
  final $Res Function(PurchaseInvoiceDetailState) _then;

/// Create a copy of PurchaseInvoiceDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? isCancelling = null,Object? invoice = freezed,Object? failure = freezed,Object? lastAction = freezed,}) {
  return _then(PurchaseInvoiceDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isCancelling: null == isCancelling ? _self.isCancelling : isCancelling // ignore: cast_nullable_to_non_nullable
as bool,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as PurchaseInvoiceModel?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as InvoiceDetailAction?,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseInvoiceDetailState].
extension PurchaseInvoiceDetailStatePatterns on PurchaseInvoiceDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseInvoiceDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseInvoiceDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseInvoiceDetailState value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseInvoiceDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  bool isCancelling,  PurchaseInvoiceModel? invoice,  Failure? failure,  InvoiceDetailAction? lastAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseInvoiceDetailState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.isCancelling,_that.invoice,_that.failure,_that.lastAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  bool isCancelling,  PurchaseInvoiceModel? invoice,  Failure? failure,  InvoiceDetailAction? lastAction)  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceDetailState():
return $default(_that.isLoading,_that.isRefreshing,_that.isCancelling,_that.invoice,_that.failure,_that.lastAction);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isRefreshing,  bool isCancelling,  PurchaseInvoiceModel? invoice,  Failure? failure,  InvoiceDetailAction? lastAction)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceDetailState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.isCancelling,_that.invoice,_that.failure,_that.lastAction);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseInvoiceDetailState implements PurchaseInvoiceDetailState {
  const _PurchaseInvoiceDetailState({this.isLoading = false, this.isRefreshing = false, this.isCancelling = false, this.invoice, this.failure, this.lastAction});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool isCancelling;
@override final  PurchaseInvoiceModel? invoice;
@override final  Failure? failure;
@override final  InvoiceDetailAction? lastAction;

/// Create a copy of PurchaseInvoiceDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseInvoiceDetailStateCopyWith<_PurchaseInvoiceDetailState> get copyWith => __$PurchaseInvoiceDetailStateCopyWithImpl<_PurchaseInvoiceDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseInvoiceDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isCancelling, isCancelling) || other.isCancelling == isCancelling)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,isCancelling,invoice,failure,lastAction);

@override
String toString() {
  return 'PurchaseInvoiceDetailState(isLoading: $isLoading, isRefreshing: $isRefreshing, isCancelling: $isCancelling, invoice: $invoice, failure: $failure, lastAction: $lastAction)';
}


}

/// @nodoc
abstract mixin class _$PurchaseInvoiceDetailStateCopyWith<$Res> implements $PurchaseInvoiceDetailStateCopyWith<$Res> {
  factory _$PurchaseInvoiceDetailStateCopyWith(_PurchaseInvoiceDetailState value, $Res Function(_PurchaseInvoiceDetailState) _then) = __$PurchaseInvoiceDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isRefreshing, bool isCancelling, PurchaseInvoiceModel? invoice, Failure? failure, InvoiceDetailAction? lastAction
});




}
/// @nodoc
class __$PurchaseInvoiceDetailStateCopyWithImpl<$Res>
    implements _$PurchaseInvoiceDetailStateCopyWith<$Res> {
  __$PurchaseInvoiceDetailStateCopyWithImpl(this._self, this._then);

  final _PurchaseInvoiceDetailState _self;
  final $Res Function(_PurchaseInvoiceDetailState) _then;

/// Create a copy of PurchaseInvoiceDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? isCancelling = null,Object? invoice = freezed,Object? failure = freezed,Object? lastAction = freezed,}) {
  return _then(_PurchaseInvoiceDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isCancelling: null == isCancelling ? _self.isCancelling : isCancelling // ignore: cast_nullable_to_non_nullable
as bool,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as PurchaseInvoiceModel?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as InvoiceDetailAction?,
  ));
}


}

// dart format on
