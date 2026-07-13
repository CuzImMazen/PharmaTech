// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_debt_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerDebtDetailState {

 bool get isLoading; bool get isRefreshing; bool get isPaying; CustomerDebtModel? get debt; Failure? get failure; bool get justPaid;
/// Create a copy of CustomerDebtDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerDebtDetailStateCopyWith<CustomerDebtDetailState> get copyWith => _$CustomerDebtDetailStateCopyWithImpl<CustomerDebtDetailState>(this as CustomerDebtDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerDebtDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isPaying, isPaying) || other.isPaying == isPaying)&&(identical(other.debt, debt) || other.debt == debt)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.justPaid, justPaid) || other.justPaid == justPaid));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,isPaying,debt,failure,justPaid);

@override
String toString() {
  return 'CustomerDebtDetailState(isLoading: $isLoading, isRefreshing: $isRefreshing, isPaying: $isPaying, debt: $debt, failure: $failure, justPaid: $justPaid)';
}


}

/// @nodoc
abstract mixin class $CustomerDebtDetailStateCopyWith<$Res>  {
  factory $CustomerDebtDetailStateCopyWith(CustomerDebtDetailState value, $Res Function(CustomerDebtDetailState) _then) = _$CustomerDebtDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isRefreshing, bool isPaying, CustomerDebtModel? debt, Failure? failure, bool justPaid
});




}
/// @nodoc
class _$CustomerDebtDetailStateCopyWithImpl<$Res>
    implements $CustomerDebtDetailStateCopyWith<$Res> {
  _$CustomerDebtDetailStateCopyWithImpl(this._self, this._then);

  final CustomerDebtDetailState _self;
  final $Res Function(CustomerDebtDetailState) _then;

/// Create a copy of CustomerDebtDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? isPaying = null,Object? debt = freezed,Object? failure = freezed,Object? justPaid = null,}) {
  return _then(CustomerDebtDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isPaying: null == isPaying ? _self.isPaying : isPaying // ignore: cast_nullable_to_non_nullable
as bool,debt: freezed == debt ? _self.debt : debt // ignore: cast_nullable_to_non_nullable
as CustomerDebtModel?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,justPaid: null == justPaid ? _self.justPaid : justPaid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerDebtDetailState].
extension CustomerDebtDetailStatePatterns on CustomerDebtDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerDebtDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerDebtDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerDebtDetailState value)  $default,){
final _that = this;
switch (_that) {
case _CustomerDebtDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerDebtDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerDebtDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  bool isPaying,  CustomerDebtModel? debt,  Failure? failure,  bool justPaid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerDebtDetailState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.isPaying,_that.debt,_that.failure,_that.justPaid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  bool isPaying,  CustomerDebtModel? debt,  Failure? failure,  bool justPaid)  $default,) {final _that = this;
switch (_that) {
case _CustomerDebtDetailState():
return $default(_that.isLoading,_that.isRefreshing,_that.isPaying,_that.debt,_that.failure,_that.justPaid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isRefreshing,  bool isPaying,  CustomerDebtModel? debt,  Failure? failure,  bool justPaid)?  $default,) {final _that = this;
switch (_that) {
case _CustomerDebtDetailState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.isPaying,_that.debt,_that.failure,_that.justPaid);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerDebtDetailState implements CustomerDebtDetailState {
  const _CustomerDebtDetailState({this.isLoading = false, this.isRefreshing = false, this.isPaying = false, this.debt, this.failure, this.justPaid = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool isPaying;
@override final  CustomerDebtModel? debt;
@override final  Failure? failure;
@override@JsonKey() final  bool justPaid;

/// Create a copy of CustomerDebtDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerDebtDetailStateCopyWith<_CustomerDebtDetailState> get copyWith => __$CustomerDebtDetailStateCopyWithImpl<_CustomerDebtDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerDebtDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isPaying, isPaying) || other.isPaying == isPaying)&&(identical(other.debt, debt) || other.debt == debt)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.justPaid, justPaid) || other.justPaid == justPaid));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,isPaying,debt,failure,justPaid);

@override
String toString() {
  return 'CustomerDebtDetailState(isLoading: $isLoading, isRefreshing: $isRefreshing, isPaying: $isPaying, debt: $debt, failure: $failure, justPaid: $justPaid)';
}


}

/// @nodoc
abstract mixin class _$CustomerDebtDetailStateCopyWith<$Res> implements $CustomerDebtDetailStateCopyWith<$Res> {
  factory _$CustomerDebtDetailStateCopyWith(_CustomerDebtDetailState value, $Res Function(_CustomerDebtDetailState) _then) = __$CustomerDebtDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isRefreshing, bool isPaying, CustomerDebtModel? debt, Failure? failure, bool justPaid
});




}
/// @nodoc
class __$CustomerDebtDetailStateCopyWithImpl<$Res>
    implements _$CustomerDebtDetailStateCopyWith<$Res> {
  __$CustomerDebtDetailStateCopyWithImpl(this._self, this._then);

  final _CustomerDebtDetailState _self;
  final $Res Function(_CustomerDebtDetailState) _then;

/// Create a copy of CustomerDebtDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? isPaying = null,Object? debt = freezed,Object? failure = freezed,Object? justPaid = null,}) {
  return _then(_CustomerDebtDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isPaying: null == isPaying ? _self.isPaying : isPaying // ignore: cast_nullable_to_non_nullable
as bool,debt: freezed == debt ? _self.debt : debt // ignore: cast_nullable_to_non_nullable
as CustomerDebtModel?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,justPaid: null == justPaid ? _self.justPaid : justPaid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
