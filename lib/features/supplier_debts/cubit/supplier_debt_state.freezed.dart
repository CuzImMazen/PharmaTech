// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_debt_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplierDebtState {

 List<SupplierDebtModel> get debts; bool get isInitialLoading; bool get isLoadingMore; bool get isRefreshing; int get currentPage; int get lastPage; bool get hasMore; int? get supplierIdFilter; SupplierDebtStatus? get statusFilter; Failure? get failure;
/// Create a copy of SupplierDebtState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierDebtStateCopyWith<SupplierDebtState> get copyWith => _$SupplierDebtStateCopyWithImpl<SupplierDebtState>(this as SupplierDebtState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierDebtState&&const DeepCollectionEquality().equals(other.debts, debts)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.supplierIdFilter, supplierIdFilter) || other.supplierIdFilter == supplierIdFilter)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(debts),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,supplierIdFilter,statusFilter,failure);

@override
String toString() {
  return 'SupplierDebtState(debts: $debts, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, supplierIdFilter: $supplierIdFilter, statusFilter: $statusFilter, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SupplierDebtStateCopyWith<$Res>  {
  factory $SupplierDebtStateCopyWith(SupplierDebtState value, $Res Function(SupplierDebtState) _then) = _$SupplierDebtStateCopyWithImpl;
@useResult
$Res call({
 List<SupplierDebtModel> debts, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, int? supplierIdFilter, SupplierDebtStatus? statusFilter, Failure? failure
});




}
/// @nodoc
class _$SupplierDebtStateCopyWithImpl<$Res>
    implements $SupplierDebtStateCopyWith<$Res> {
  _$SupplierDebtStateCopyWithImpl(this._self, this._then);

  final SupplierDebtState _self;
  final $Res Function(SupplierDebtState) _then;

/// Create a copy of SupplierDebtState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? debts = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? supplierIdFilter = freezed,Object? statusFilter = freezed,Object? failure = freezed,}) {
  return _then(SupplierDebtState(
debts: null == debts ? _self.debts : debts // ignore: cast_nullable_to_non_nullable
as List<SupplierDebtModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,supplierIdFilter: freezed == supplierIdFilter ? _self.supplierIdFilter : supplierIdFilter // ignore: cast_nullable_to_non_nullable
as int?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as SupplierDebtStatus?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierDebtState].
extension SupplierDebtStatePatterns on SupplierDebtState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierDebtState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierDebtState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierDebtState value)  $default,){
final _that = this;
switch (_that) {
case _SupplierDebtState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierDebtState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierDebtState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SupplierDebtModel> debts,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  int? supplierIdFilter,  SupplierDebtStatus? statusFilter,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierDebtState() when $default != null:
return $default(_that.debts,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.supplierIdFilter,_that.statusFilter,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SupplierDebtModel> debts,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  int? supplierIdFilter,  SupplierDebtStatus? statusFilter,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _SupplierDebtState():
return $default(_that.debts,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.supplierIdFilter,_that.statusFilter,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SupplierDebtModel> debts,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  int? supplierIdFilter,  SupplierDebtStatus? statusFilter,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _SupplierDebtState() when $default != null:
return $default(_that.debts,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.supplierIdFilter,_that.statusFilter,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierDebtState implements SupplierDebtState {
  const _SupplierDebtState({ List<SupplierDebtModel> debts = const <SupplierDebtModel>[], this.isInitialLoading = false, this.isLoadingMore = false, this.isRefreshing = false, this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.supplierIdFilter, this.statusFilter, this.failure}): _debts = debts;
  

 final  List<SupplierDebtModel> _debts;
@override@JsonKey() List<SupplierDebtModel> get debts {
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
@override final  int? supplierIdFilter;
@override final  SupplierDebtStatus? statusFilter;
@override final  Failure? failure;

/// Create a copy of SupplierDebtState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierDebtStateCopyWith<_SupplierDebtState> get copyWith => __$SupplierDebtStateCopyWithImpl<_SupplierDebtState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierDebtState&&const DeepCollectionEquality().equals(other._debts, _debts)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.supplierIdFilter, supplierIdFilter) || other.supplierIdFilter == supplierIdFilter)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_debts),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,supplierIdFilter,statusFilter,failure);

@override
String toString() {
  return 'SupplierDebtState(debts: $debts, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, supplierIdFilter: $supplierIdFilter, statusFilter: $statusFilter, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SupplierDebtStateCopyWith<$Res> implements $SupplierDebtStateCopyWith<$Res> {
  factory _$SupplierDebtStateCopyWith(_SupplierDebtState value, $Res Function(_SupplierDebtState) _then) = __$SupplierDebtStateCopyWithImpl;
@override @useResult
$Res call({
 List<SupplierDebtModel> debts, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, int? supplierIdFilter, SupplierDebtStatus? statusFilter, Failure? failure
});




}
/// @nodoc
class __$SupplierDebtStateCopyWithImpl<$Res>
    implements _$SupplierDebtStateCopyWith<$Res> {
  __$SupplierDebtStateCopyWithImpl(this._self, this._then);

  final _SupplierDebtState _self;
  final $Res Function(_SupplierDebtState) _then;

/// Create a copy of SupplierDebtState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debts = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? supplierIdFilter = freezed,Object? statusFilter = freezed,Object? failure = freezed,}) {
  return _then(_SupplierDebtState(
debts: null == debts ? _self._debts : debts // ignore: cast_nullable_to_non_nullable
as List<SupplierDebtModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,supplierIdFilter: freezed == supplierIdFilter ? _self.supplierIdFilter : supplierIdFilter // ignore: cast_nullable_to_non_nullable
as int?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as SupplierDebtStatus?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
