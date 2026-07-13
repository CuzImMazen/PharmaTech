// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_debt_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerDebtState {

 List<CustomerDebtModel> get debts; bool get isInitialLoading; bool get isLoadingMore; bool get isRefreshing; int get currentPage; int get lastPage; bool get hasMore; int? get customerIdFilter; CustomerDebtStatus? get statusFilter; Failure? get failure;
/// Create a copy of CustomerDebtState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerDebtStateCopyWith<CustomerDebtState> get copyWith => _$CustomerDebtStateCopyWithImpl<CustomerDebtState>(this as CustomerDebtState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerDebtState&&const DeepCollectionEquality().equals(other.debts, debts)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.customerIdFilter, customerIdFilter) || other.customerIdFilter == customerIdFilter)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(debts),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,customerIdFilter,statusFilter,failure);

@override
String toString() {
  return 'CustomerDebtState(debts: $debts, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, customerIdFilter: $customerIdFilter, statusFilter: $statusFilter, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CustomerDebtStateCopyWith<$Res>  {
  factory $CustomerDebtStateCopyWith(CustomerDebtState value, $Res Function(CustomerDebtState) _then) = _$CustomerDebtStateCopyWithImpl;
@useResult
$Res call({
 List<CustomerDebtModel> debts, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, int? customerIdFilter, CustomerDebtStatus? statusFilter, Failure? failure
});




}
/// @nodoc
class _$CustomerDebtStateCopyWithImpl<$Res>
    implements $CustomerDebtStateCopyWith<$Res> {
  _$CustomerDebtStateCopyWithImpl(this._self, this._then);

  final CustomerDebtState _self;
  final $Res Function(CustomerDebtState) _then;

/// Create a copy of CustomerDebtState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? debts = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? customerIdFilter = freezed,Object? statusFilter = freezed,Object? failure = freezed,}) {
  return _then(CustomerDebtState(
debts: null == debts ? _self.debts : debts // ignore: cast_nullable_to_non_nullable
as List<CustomerDebtModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,customerIdFilter: freezed == customerIdFilter ? _self.customerIdFilter : customerIdFilter // ignore: cast_nullable_to_non_nullable
as int?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as CustomerDebtStatus?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerDebtState].
extension CustomerDebtStatePatterns on CustomerDebtState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerDebtState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerDebtState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerDebtState value)  $default,){
final _that = this;
switch (_that) {
case _CustomerDebtState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerDebtState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerDebtState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CustomerDebtModel> debts,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  int? customerIdFilter,  CustomerDebtStatus? statusFilter,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerDebtState() when $default != null:
return $default(_that.debts,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.customerIdFilter,_that.statusFilter,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CustomerDebtModel> debts,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  int? customerIdFilter,  CustomerDebtStatus? statusFilter,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _CustomerDebtState():
return $default(_that.debts,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.customerIdFilter,_that.statusFilter,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CustomerDebtModel> debts,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  int? customerIdFilter,  CustomerDebtStatus? statusFilter,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _CustomerDebtState() when $default != null:
return $default(_that.debts,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.customerIdFilter,_that.statusFilter,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerDebtState implements CustomerDebtState {
  const _CustomerDebtState({ List<CustomerDebtModel> debts = const <CustomerDebtModel>[], this.isInitialLoading = false, this.isLoadingMore = false, this.isRefreshing = false, this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.customerIdFilter, this.statusFilter, this.failure}): _debts = debts;
  

 final  List<CustomerDebtModel> _debts;
@override@JsonKey() List<CustomerDebtModel> get debts {
  if (_debts is EqualUnmodifiableListView) return _debts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_debts);
}

@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  bool hasMore;
@override final  int? customerIdFilter;
@override final  CustomerDebtStatus? statusFilter;
@override final  Failure? failure;

/// Create a copy of CustomerDebtState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerDebtStateCopyWith<_CustomerDebtState> get copyWith => __$CustomerDebtStateCopyWithImpl<_CustomerDebtState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerDebtState&&const DeepCollectionEquality().equals(other._debts, _debts)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.customerIdFilter, customerIdFilter) || other.customerIdFilter == customerIdFilter)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_debts),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,customerIdFilter,statusFilter,failure);

@override
String toString() {
  return 'CustomerDebtState(debts: $debts, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, customerIdFilter: $customerIdFilter, statusFilter: $statusFilter, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$CustomerDebtStateCopyWith<$Res> implements $CustomerDebtStateCopyWith<$Res> {
  factory _$CustomerDebtStateCopyWith(_CustomerDebtState value, $Res Function(_CustomerDebtState) _then) = __$CustomerDebtStateCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerDebtModel> debts, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, int? customerIdFilter, CustomerDebtStatus? statusFilter, Failure? failure
});




}
/// @nodoc
class __$CustomerDebtStateCopyWithImpl<$Res>
    implements _$CustomerDebtStateCopyWith<$Res> {
  __$CustomerDebtStateCopyWithImpl(this._self, this._then);

  final _CustomerDebtState _self;
  final $Res Function(_CustomerDebtState) _then;

/// Create a copy of CustomerDebtState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debts = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? customerIdFilter = freezed,Object? statusFilter = freezed,Object? failure = freezed,}) {
  return _then(_CustomerDebtState(
debts: null == debts ? _self._debts : debts // ignore: cast_nullable_to_non_nullable
as List<CustomerDebtModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,customerIdFilter: freezed == customerIdFilter ? _self.customerIdFilter : customerIdFilter // ignore: cast_nullable_to_non_nullable
as int?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as CustomerDebtStatus?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
