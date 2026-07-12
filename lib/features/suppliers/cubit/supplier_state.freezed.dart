// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplierState {

 List<SupplierModel> get suppliers; bool get isInitialLoading; bool get isLoadingMore; bool get isRefreshing; String get searchQuery; bool get showDeleted; int get currentPage; int get lastPage; bool get hasMore; Failure? get failure; SupplierActionResult? get lastAction; int? get actionId; bool get isSaving; int? get mutatingId;
/// Create a copy of SupplierState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierStateCopyWith<SupplierState> get copyWith => _$SupplierStateCopyWithImpl<SupplierState>(this as SupplierState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierState&&const DeepCollectionEquality().equals(other.suppliers, suppliers)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.showDeleted, showDeleted) || other.showDeleted == showDeleted)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction)&&(identical(other.actionId, actionId) || other.actionId == actionId)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.mutatingId, mutatingId) || other.mutatingId == mutatingId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(suppliers),isInitialLoading,isLoadingMore,isRefreshing,searchQuery,showDeleted,currentPage,lastPage,hasMore,failure,lastAction,actionId,isSaving,mutatingId);

@override
String toString() {
  return 'SupplierState(suppliers: $suppliers, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, searchQuery: $searchQuery, showDeleted: $showDeleted, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure, lastAction: $lastAction, actionId: $actionId, isSaving: $isSaving, mutatingId: $mutatingId)';
}


}

/// @nodoc
abstract mixin class $SupplierStateCopyWith<$Res>  {
  factory $SupplierStateCopyWith(SupplierState value, $Res Function(SupplierState) _then) = _$SupplierStateCopyWithImpl;
@useResult
$Res call({
 List<SupplierModel> suppliers, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, String searchQuery, bool showDeleted, int currentPage, int lastPage, bool hasMore, Failure? failure, SupplierActionResult? lastAction, int? actionId, bool isSaving, int? mutatingId
});




}
/// @nodoc
class _$SupplierStateCopyWithImpl<$Res>
    implements $SupplierStateCopyWith<$Res> {
  _$SupplierStateCopyWithImpl(this._self, this._then);

  final SupplierState _self;
  final $Res Function(SupplierState) _then;

/// Create a copy of SupplierState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suppliers = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? searchQuery = null,Object? showDeleted = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,Object? lastAction = freezed,Object? actionId = freezed,Object? isSaving = null,Object? mutatingId = freezed,}) {
  return _then(SupplierState(
suppliers: null == suppliers ? _self.suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as List<SupplierModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,showDeleted: null == showDeleted ? _self.showDeleted : showDeleted // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as SupplierActionResult?,actionId: freezed == actionId ? _self.actionId : actionId // ignore: cast_nullable_to_non_nullable
as int?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,mutatingId: freezed == mutatingId ? _self.mutatingId : mutatingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierState].
extension SupplierStatePatterns on SupplierState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierState value)  $default,){
final _that = this;
switch (_that) {
case _SupplierState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SupplierModel> suppliers,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  String searchQuery,  bool showDeleted,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure,  SupplierActionResult? lastAction,  int? actionId,  bool isSaving,  int? mutatingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierState() when $default != null:
return $default(_that.suppliers,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.searchQuery,_that.showDeleted,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure,_that.lastAction,_that.actionId,_that.isSaving,_that.mutatingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SupplierModel> suppliers,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  String searchQuery,  bool showDeleted,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure,  SupplierActionResult? lastAction,  int? actionId,  bool isSaving,  int? mutatingId)  $default,) {final _that = this;
switch (_that) {
case _SupplierState():
return $default(_that.suppliers,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.searchQuery,_that.showDeleted,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure,_that.lastAction,_that.actionId,_that.isSaving,_that.mutatingId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SupplierModel> suppliers,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  String searchQuery,  bool showDeleted,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure,  SupplierActionResult? lastAction,  int? actionId,  bool isSaving,  int? mutatingId)?  $default,) {final _that = this;
switch (_that) {
case _SupplierState() when $default != null:
return $default(_that.suppliers,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.searchQuery,_that.showDeleted,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure,_that.lastAction,_that.actionId,_that.isSaving,_that.mutatingId);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierState implements SupplierState {
  const _SupplierState({ List<SupplierModel> suppliers = const <SupplierModel>[], this.isInitialLoading = false, this.isLoadingMore = false, this.isRefreshing = false, this.searchQuery = '', this.showDeleted = false, this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.failure, this.lastAction, this.actionId, this.isSaving = false, this.mutatingId}): _suppliers = suppliers;
  

 final  List<SupplierModel> _suppliers;
@override@JsonKey() List<SupplierModel> get suppliers {
  if (_suppliers is EqualUnmodifiableListView) return _suppliers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suppliers);
}

@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  bool showDeleted;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  bool hasMore;
@override final  Failure? failure;
@override final  SupplierActionResult? lastAction;
@override final  int? actionId;
@override@JsonKey() final  bool isSaving;
@override final  int? mutatingId;

/// Create a copy of SupplierState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierStateCopyWith<_SupplierState> get copyWith => __$SupplierStateCopyWithImpl<_SupplierState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierState&&const DeepCollectionEquality().equals(other._suppliers, _suppliers)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.showDeleted, showDeleted) || other.showDeleted == showDeleted)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction)&&(identical(other.actionId, actionId) || other.actionId == actionId)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.mutatingId, mutatingId) || other.mutatingId == mutatingId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_suppliers),isInitialLoading,isLoadingMore,isRefreshing,searchQuery,showDeleted,currentPage,lastPage,hasMore,failure,lastAction,actionId,isSaving,mutatingId);

@override
String toString() {
  return 'SupplierState(suppliers: $suppliers, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, searchQuery: $searchQuery, showDeleted: $showDeleted, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure, lastAction: $lastAction, actionId: $actionId, isSaving: $isSaving, mutatingId: $mutatingId)';
}


}

/// @nodoc
abstract mixin class _$SupplierStateCopyWith<$Res> implements $SupplierStateCopyWith<$Res> {
  factory _$SupplierStateCopyWith(_SupplierState value, $Res Function(_SupplierState) _then) = __$SupplierStateCopyWithImpl;
@override @useResult
$Res call({
 List<SupplierModel> suppliers, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, String searchQuery, bool showDeleted, int currentPage, int lastPage, bool hasMore, Failure? failure, SupplierActionResult? lastAction, int? actionId, bool isSaving, int? mutatingId
});




}
/// @nodoc
class __$SupplierStateCopyWithImpl<$Res>
    implements _$SupplierStateCopyWith<$Res> {
  __$SupplierStateCopyWithImpl(this._self, this._then);

  final _SupplierState _self;
  final $Res Function(_SupplierState) _then;

/// Create a copy of SupplierState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suppliers = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? searchQuery = null,Object? showDeleted = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,Object? lastAction = freezed,Object? actionId = freezed,Object? isSaving = null,Object? mutatingId = freezed,}) {
  return _then(_SupplierState(
suppliers: null == suppliers ? _self._suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as List<SupplierModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,showDeleted: null == showDeleted ? _self.showDeleted : showDeleted // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as SupplierActionResult?,actionId: freezed == actionId ? _self.actionId : actionId // ignore: cast_nullable_to_non_nullable
as int?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,mutatingId: freezed == mutatingId ? _self.mutatingId : mutatingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
