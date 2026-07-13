// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_return_invoice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerReturnInvoiceState {

 List<CustomerReturnInvoiceModel> get returns; bool get isInitialLoading; bool get isLoadingMore; bool get isRefreshing; int get currentPage; int get lastPage; bool get hasMore; Failure? get failure;
/// Create a copy of CustomerReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerReturnInvoiceStateCopyWith<CustomerReturnInvoiceState> get copyWith => _$CustomerReturnInvoiceStateCopyWithImpl<CustomerReturnInvoiceState>(this as CustomerReturnInvoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerReturnInvoiceState&&const DeepCollectionEquality().equals(other.returns, returns)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(returns),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,failure);

@override
String toString() {
  return 'CustomerReturnInvoiceState(returns: $returns, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CustomerReturnInvoiceStateCopyWith<$Res>  {
  factory $CustomerReturnInvoiceStateCopyWith(CustomerReturnInvoiceState value, $Res Function(CustomerReturnInvoiceState) _then) = _$CustomerReturnInvoiceStateCopyWithImpl;
@useResult
$Res call({
 List<CustomerReturnInvoiceModel> returns, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, Failure? failure
});




}
/// @nodoc
class _$CustomerReturnInvoiceStateCopyWithImpl<$Res>
    implements $CustomerReturnInvoiceStateCopyWith<$Res> {
  _$CustomerReturnInvoiceStateCopyWithImpl(this._self, this._then);

  final CustomerReturnInvoiceState _self;
  final $Res Function(CustomerReturnInvoiceState) _then;

/// Create a copy of CustomerReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? returns = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(CustomerReturnInvoiceState(
returns: null == returns ? _self.returns : returns // ignore: cast_nullable_to_non_nullable
as List<CustomerReturnInvoiceModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerReturnInvoiceState].
extension CustomerReturnInvoiceStatePatterns on CustomerReturnInvoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerReturnInvoiceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerReturnInvoiceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerReturnInvoiceState value)  $default,){
final _that = this;
switch (_that) {
case _CustomerReturnInvoiceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerReturnInvoiceState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerReturnInvoiceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CustomerReturnInvoiceModel> returns,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerReturnInvoiceState() when $default != null:
return $default(_that.returns,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CustomerReturnInvoiceModel> returns,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _CustomerReturnInvoiceState():
return $default(_that.returns,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CustomerReturnInvoiceModel> returns,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _CustomerReturnInvoiceState() when $default != null:
return $default(_that.returns,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerReturnInvoiceState implements CustomerReturnInvoiceState {
  const _CustomerReturnInvoiceState({ List<CustomerReturnInvoiceModel> returns = const <CustomerReturnInvoiceModel>[], this.isInitialLoading = false, this.isLoadingMore = false, this.isRefreshing = false, this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.failure}): _returns = returns;
  

 final  List<CustomerReturnInvoiceModel> _returns;
@override@JsonKey() List<CustomerReturnInvoiceModel> get returns {
  if (_returns is EqualUnmodifiableListView) return _returns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_returns);
}

@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  bool hasMore;
@override final  Failure? failure;

/// Create a copy of CustomerReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerReturnInvoiceStateCopyWith<_CustomerReturnInvoiceState> get copyWith => __$CustomerReturnInvoiceStateCopyWithImpl<_CustomerReturnInvoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerReturnInvoiceState&&const DeepCollectionEquality().equals(other._returns, _returns)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_returns),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,failure);

@override
String toString() {
  return 'CustomerReturnInvoiceState(returns: $returns, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$CustomerReturnInvoiceStateCopyWith<$Res> implements $CustomerReturnInvoiceStateCopyWith<$Res> {
  factory _$CustomerReturnInvoiceStateCopyWith(_CustomerReturnInvoiceState value, $Res Function(_CustomerReturnInvoiceState) _then) = __$CustomerReturnInvoiceStateCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerReturnInvoiceModel> returns, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, Failure? failure
});




}
/// @nodoc
class __$CustomerReturnInvoiceStateCopyWithImpl<$Res>
    implements _$CustomerReturnInvoiceStateCopyWith<$Res> {
  __$CustomerReturnInvoiceStateCopyWithImpl(this._self, this._then);

  final _CustomerReturnInvoiceState _self;
  final $Res Function(_CustomerReturnInvoiceState) _then;

/// Create a copy of CustomerReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? returns = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(_CustomerReturnInvoiceState(
returns: null == returns ? _self._returns : returns // ignore: cast_nullable_to_non_nullable
as List<CustomerReturnInvoiceModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
