// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_debt_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplierDebtDetailState {

 bool get isLoading; bool get isRefreshing; SupplierDebtModel? get debt; Failure? get failure;
/// Create a copy of SupplierDebtDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierDebtDetailStateCopyWith<SupplierDebtDetailState> get copyWith => _$SupplierDebtDetailStateCopyWithImpl<SupplierDebtDetailState>(this as SupplierDebtDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierDebtDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.debt, debt) || other.debt == debt)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,debt,failure);

@override
String toString() {
  return 'SupplierDebtDetailState(isLoading: $isLoading, isRefreshing: $isRefreshing, debt: $debt, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SupplierDebtDetailStateCopyWith<$Res>  {
  factory $SupplierDebtDetailStateCopyWith(SupplierDebtDetailState value, $Res Function(SupplierDebtDetailState) _then) = _$SupplierDebtDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isRefreshing, SupplierDebtModel? debt, Failure? failure
});




}
/// @nodoc
class _$SupplierDebtDetailStateCopyWithImpl<$Res>
    implements $SupplierDebtDetailStateCopyWith<$Res> {
  _$SupplierDebtDetailStateCopyWithImpl(this._self, this._then);

  final SupplierDebtDetailState _self;
  final $Res Function(SupplierDebtDetailState) _then;

/// Create a copy of SupplierDebtDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? debt = freezed,Object? failure = freezed,}) {
  return _then(SupplierDebtDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,debt: freezed == debt ? _self.debt : debt // ignore: cast_nullable_to_non_nullable
as SupplierDebtModel?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierDebtDetailState].
extension SupplierDebtDetailStatePatterns on SupplierDebtDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierDebtDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierDebtDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierDebtDetailState value)  $default,){
final _that = this;
switch (_that) {
case _SupplierDebtDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierDebtDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierDebtDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  SupplierDebtModel? debt,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierDebtDetailState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.debt,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  SupplierDebtModel? debt,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _SupplierDebtDetailState():
return $default(_that.isLoading,_that.isRefreshing,_that.debt,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isRefreshing,  SupplierDebtModel? debt,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _SupplierDebtDetailState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.debt,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierDebtDetailState implements SupplierDebtDetailState {
  const _SupplierDebtDetailState({this.isLoading = false, this.isRefreshing = false, this.debt, this.failure});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isRefreshing;
@override final  SupplierDebtModel? debt;
@override final  Failure? failure;

/// Create a copy of SupplierDebtDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierDebtDetailStateCopyWith<_SupplierDebtDetailState> get copyWith => __$SupplierDebtDetailStateCopyWithImpl<_SupplierDebtDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierDebtDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.debt, debt) || other.debt == debt)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,debt,failure);

@override
String toString() {
  return 'SupplierDebtDetailState(isLoading: $isLoading, isRefreshing: $isRefreshing, debt: $debt, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SupplierDebtDetailStateCopyWith<$Res> implements $SupplierDebtDetailStateCopyWith<$Res> {
  factory _$SupplierDebtDetailStateCopyWith(_SupplierDebtDetailState value, $Res Function(_SupplierDebtDetailState) _then) = __$SupplierDebtDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isRefreshing, SupplierDebtModel? debt, Failure? failure
});




}
/// @nodoc
class __$SupplierDebtDetailStateCopyWithImpl<$Res>
    implements _$SupplierDebtDetailStateCopyWith<$Res> {
  __$SupplierDebtDetailStateCopyWithImpl(this._self, this._then);

  final _SupplierDebtDetailState _self;
  final $Res Function(_SupplierDebtDetailState) _then;

/// Create a copy of SupplierDebtDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? debt = freezed,Object? failure = freezed,}) {
  return _then(_SupplierDebtDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,debt: freezed == debt ? _self.debt : debt // ignore: cast_nullable_to_non_nullable
as SupplierDebtModel?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
