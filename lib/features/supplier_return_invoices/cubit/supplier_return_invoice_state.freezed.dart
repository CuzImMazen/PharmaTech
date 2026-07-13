// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_return_invoice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplierReturnInvoiceState {

 List<SupplierReturnInvoiceModel> get returns; bool get isInitialLoading; bool get isLoadingMore; bool get isRefreshing; int get currentPage; int get lastPage; bool get hasMore; Failure? get failure;
/// Create a copy of SupplierReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierReturnInvoiceStateCopyWith<SupplierReturnInvoiceState> get copyWith => _$SupplierReturnInvoiceStateCopyWithImpl<SupplierReturnInvoiceState>(this as SupplierReturnInvoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierReturnInvoiceState&&const DeepCollectionEquality().equals(other.returns, returns)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(returns),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,failure);

@override
String toString() {
  return 'SupplierReturnInvoiceState(returns: $returns, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SupplierReturnInvoiceStateCopyWith<$Res>  {
  factory $SupplierReturnInvoiceStateCopyWith(SupplierReturnInvoiceState value, $Res Function(SupplierReturnInvoiceState) _then) = _$SupplierReturnInvoiceStateCopyWithImpl;
@useResult
$Res call({
 List<SupplierReturnInvoiceModel> returns, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, Failure? failure
});




}
/// @nodoc
class _$SupplierReturnInvoiceStateCopyWithImpl<$Res>
    implements $SupplierReturnInvoiceStateCopyWith<$Res> {
  _$SupplierReturnInvoiceStateCopyWithImpl(this._self, this._then);

  final SupplierReturnInvoiceState _self;
  final $Res Function(SupplierReturnInvoiceState) _then;

/// Create a copy of SupplierReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? returns = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(SupplierReturnInvoiceState(
returns: null == returns ? _self.returns : returns // ignore: cast_nullable_to_non_nullable
as List<SupplierReturnInvoiceModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [SupplierReturnInvoiceState].
extension SupplierReturnInvoiceStatePatterns on SupplierReturnInvoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierReturnInvoiceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierReturnInvoiceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierReturnInvoiceState value)  $default,){
final _that = this;
switch (_that) {
case _SupplierReturnInvoiceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierReturnInvoiceState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierReturnInvoiceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SupplierReturnInvoiceModel> returns,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierReturnInvoiceState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SupplierReturnInvoiceModel> returns,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _SupplierReturnInvoiceState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SupplierReturnInvoiceModel> returns,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _SupplierReturnInvoiceState() when $default != null:
return $default(_that.returns,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierReturnInvoiceState implements SupplierReturnInvoiceState {
  const _SupplierReturnInvoiceState({ List<SupplierReturnInvoiceModel> returns = const <SupplierReturnInvoiceModel>[], this.isInitialLoading = false, this.isLoadingMore = false, this.isRefreshing = false, this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.failure}): _returns = returns;
  

 final  List<SupplierReturnInvoiceModel> _returns;
@override@JsonKey() List<SupplierReturnInvoiceModel> get returns {
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

/// Create a copy of SupplierReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierReturnInvoiceStateCopyWith<_SupplierReturnInvoiceState> get copyWith => __$SupplierReturnInvoiceStateCopyWithImpl<_SupplierReturnInvoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierReturnInvoiceState&&const DeepCollectionEquality().equals(other._returns, _returns)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_returns),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,failure);

@override
String toString() {
  return 'SupplierReturnInvoiceState(returns: $returns, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SupplierReturnInvoiceStateCopyWith<$Res> implements $SupplierReturnInvoiceStateCopyWith<$Res> {
  factory _$SupplierReturnInvoiceStateCopyWith(_SupplierReturnInvoiceState value, $Res Function(_SupplierReturnInvoiceState) _then) = __$SupplierReturnInvoiceStateCopyWithImpl;
@override @useResult
$Res call({
 List<SupplierReturnInvoiceModel> returns, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, Failure? failure
});




}
/// @nodoc
class __$SupplierReturnInvoiceStateCopyWithImpl<$Res>
    implements _$SupplierReturnInvoiceStateCopyWith<$Res> {
  __$SupplierReturnInvoiceStateCopyWithImpl(this._self, this._then);

  final _SupplierReturnInvoiceState _self;
  final $Res Function(_SupplierReturnInvoiceState) _then;

/// Create a copy of SupplierReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? returns = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(_SupplierReturnInvoiceState(
returns: null == returns ? _self._returns : returns // ignore: cast_nullable_to_non_nullable
as List<SupplierReturnInvoiceModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
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
