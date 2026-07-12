// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_adjustment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockAdjustmentState {

 List<StockMovementModel> get adjustments; bool get isInitialLoading; bool get isLoadingMore; bool get isRefreshing; int get currentPage; int get lastPage; bool get hasMore; Failure? get failure;
/// Create a copy of StockAdjustmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockAdjustmentStateCopyWith<StockAdjustmentState> get copyWith => _$StockAdjustmentStateCopyWithImpl<StockAdjustmentState>(this as StockAdjustmentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockAdjustmentState&&const DeepCollectionEquality().equals(other.adjustments, adjustments)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(adjustments),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,failure);

@override
String toString() {
  return 'StockAdjustmentState(adjustments: $adjustments, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $StockAdjustmentStateCopyWith<$Res>  {
  factory $StockAdjustmentStateCopyWith(StockAdjustmentState value, $Res Function(StockAdjustmentState) _then) = _$StockAdjustmentStateCopyWithImpl;
@useResult
$Res call({
 List<StockMovementModel> adjustments, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, Failure? failure
});




}
/// @nodoc
class _$StockAdjustmentStateCopyWithImpl<$Res>
    implements $StockAdjustmentStateCopyWith<$Res> {
  _$StockAdjustmentStateCopyWithImpl(this._self, this._then);

  final StockAdjustmentState _self;
  final $Res Function(StockAdjustmentState) _then;

/// Create a copy of StockAdjustmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adjustments = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(StockAdjustmentState(
adjustments: null == adjustments ? _self.adjustments : adjustments // ignore: cast_nullable_to_non_nullable
as List<StockMovementModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [StockAdjustmentState].
extension StockAdjustmentStatePatterns on StockAdjustmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockAdjustmentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockAdjustmentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockAdjustmentState value)  $default,){
final _that = this;
switch (_that) {
case _StockAdjustmentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockAdjustmentState value)?  $default,){
final _that = this;
switch (_that) {
case _StockAdjustmentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StockMovementModel> adjustments,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockAdjustmentState() when $default != null:
return $default(_that.adjustments,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StockMovementModel> adjustments,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _StockAdjustmentState():
return $default(_that.adjustments,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StockMovementModel> adjustments,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _StockAdjustmentState() when $default != null:
return $default(_that.adjustments,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StockAdjustmentState implements StockAdjustmentState {
  const _StockAdjustmentState({ List<StockMovementModel> adjustments = const <StockMovementModel>[], this.isInitialLoading = false, this.isLoadingMore = false, this.isRefreshing = false, this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.failure}): _adjustments = adjustments;
  

 final  List<StockMovementModel> _adjustments;
@override@JsonKey() List<StockMovementModel> get adjustments {
  if (_adjustments is EqualUnmodifiableListView) return _adjustments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_adjustments);
}

@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  bool hasMore;
@override final  Failure? failure;

/// Create a copy of StockAdjustmentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockAdjustmentStateCopyWith<_StockAdjustmentState> get copyWith => __$StockAdjustmentStateCopyWithImpl<_StockAdjustmentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockAdjustmentState&&const DeepCollectionEquality().equals(other._adjustments, _adjustments)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_adjustments),isInitialLoading,isLoadingMore,isRefreshing,currentPage,lastPage,hasMore,failure);

@override
String toString() {
  return 'StockAdjustmentState(adjustments: $adjustments, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StockAdjustmentStateCopyWith<$Res> implements $StockAdjustmentStateCopyWith<$Res> {
  factory _$StockAdjustmentStateCopyWith(_StockAdjustmentState value, $Res Function(_StockAdjustmentState) _then) = __$StockAdjustmentStateCopyWithImpl;
@override @useResult
$Res call({
 List<StockMovementModel> adjustments, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int currentPage, int lastPage, bool hasMore, Failure? failure
});




}
/// @nodoc
class __$StockAdjustmentStateCopyWithImpl<$Res>
    implements _$StockAdjustmentStateCopyWith<$Res> {
  __$StockAdjustmentStateCopyWithImpl(this._self, this._then);

  final _StockAdjustmentState _self;
  final $Res Function(_StockAdjustmentState) _then;

/// Create a copy of StockAdjustmentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adjustments = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(_StockAdjustmentState(
adjustments: null == adjustments ? _self._adjustments : adjustments // ignore: cast_nullable_to_non_nullable
as List<StockMovementModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
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
