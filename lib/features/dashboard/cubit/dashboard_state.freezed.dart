// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {

 DashboardHeaderModel? get header; DashboardCardsModel? get cards; List<WeeklyRevenuePointModel> get weeklyRevenue; List<DashboardTransactionModel> get recentTransactions; List<ProductCardModel> get lowStockProducts; bool get isInitialLoading; bool get isRefreshing; Failure? get failure;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.header, header) || other.header == header)&&(identical(other.cards, cards) || other.cards == cards)&&const DeepCollectionEquality().equals(other.weeklyRevenue, weeklyRevenue)&&const DeepCollectionEquality().equals(other.recentTransactions, recentTransactions)&&const DeepCollectionEquality().equals(other.lowStockProducts, lowStockProducts)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,header,cards,const DeepCollectionEquality().hash(weeklyRevenue),const DeepCollectionEquality().hash(recentTransactions),const DeepCollectionEquality().hash(lowStockProducts),isInitialLoading,isRefreshing,failure);

@override
String toString() {
  return 'DashboardState(header: $header, cards: $cards, weeklyRevenue: $weeklyRevenue, recentTransactions: $recentTransactions, lowStockProducts: $lowStockProducts, isInitialLoading: $isInitialLoading, isRefreshing: $isRefreshing, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 DashboardHeaderModel? header, DashboardCardsModel? cards, List<WeeklyRevenuePointModel> weeklyRevenue, List<DashboardTransactionModel> recentTransactions, List<ProductCardModel> lowStockProducts, bool isInitialLoading, bool isRefreshing, Failure? failure
});




}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? header = freezed,Object? cards = freezed,Object? weeklyRevenue = null,Object? recentTransactions = null,Object? lowStockProducts = null,Object? isInitialLoading = null,Object? isRefreshing = null,Object? failure = freezed,}) {
  return _then(DashboardState(
header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as DashboardHeaderModel?,cards: freezed == cards ? _self.cards : cards // ignore: cast_nullable_to_non_nullable
as DashboardCardsModel?,weeklyRevenue: null == weeklyRevenue ? _self.weeklyRevenue : weeklyRevenue // ignore: cast_nullable_to_non_nullable
as List<WeeklyRevenuePointModel>,recentTransactions: null == recentTransactions ? _self.recentTransactions : recentTransactions // ignore: cast_nullable_to_non_nullable
as List<DashboardTransactionModel>,lowStockProducts: null == lowStockProducts ? _self.lowStockProducts : lowStockProducts // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DashboardHeaderModel? header,  DashboardCardsModel? cards,  List<WeeklyRevenuePointModel> weeklyRevenue,  List<DashboardTransactionModel> recentTransactions,  List<ProductCardModel> lowStockProducts,  bool isInitialLoading,  bool isRefreshing,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.header,_that.cards,_that.weeklyRevenue,_that.recentTransactions,_that.lowStockProducts,_that.isInitialLoading,_that.isRefreshing,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DashboardHeaderModel? header,  DashboardCardsModel? cards,  List<WeeklyRevenuePointModel> weeklyRevenue,  List<DashboardTransactionModel> recentTransactions,  List<ProductCardModel> lowStockProducts,  bool isInitialLoading,  bool isRefreshing,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.header,_that.cards,_that.weeklyRevenue,_that.recentTransactions,_that.lowStockProducts,_that.isInitialLoading,_that.isRefreshing,_that.failure);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DashboardHeaderModel? header,  DashboardCardsModel? cards,  List<WeeklyRevenuePointModel> weeklyRevenue,  List<DashboardTransactionModel> recentTransactions,  List<ProductCardModel> lowStockProducts,  bool isInitialLoading,  bool isRefreshing,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.header,_that.cards,_that.weeklyRevenue,_that.recentTransactions,_that.lowStockProducts,_that.isInitialLoading,_that.isRefreshing,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardState implements DashboardState {
  const _DashboardState({this.header, this.cards,  List<WeeklyRevenuePointModel> weeklyRevenue = const <WeeklyRevenuePointModel>[],  List<DashboardTransactionModel> recentTransactions = const <DashboardTransactionModel>[],  List<ProductCardModel> lowStockProducts = const <ProductCardModel>[], this.isInitialLoading = false, this.isRefreshing = false, this.failure}): _weeklyRevenue = weeklyRevenue,_recentTransactions = recentTransactions,_lowStockProducts = lowStockProducts;
  

@override final  DashboardHeaderModel? header;
@override final  DashboardCardsModel? cards;
 final  List<WeeklyRevenuePointModel> _weeklyRevenue;
@override@JsonKey() List<WeeklyRevenuePointModel> get weeklyRevenue {
  if (_weeklyRevenue is EqualUnmodifiableListView) return _weeklyRevenue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeklyRevenue);
}

 final  List<DashboardTransactionModel> _recentTransactions;
@override@JsonKey() List<DashboardTransactionModel> get recentTransactions {
  if (_recentTransactions is EqualUnmodifiableListView) return _recentTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentTransactions);
}

 final  List<ProductCardModel> _lowStockProducts;
@override@JsonKey() List<ProductCardModel> get lowStockProducts {
  if (_lowStockProducts is EqualUnmodifiableListView) return _lowStockProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lowStockProducts);
}

@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isRefreshing;
@override final  Failure? failure;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.header, header) || other.header == header)&&(identical(other.cards, cards) || other.cards == cards)&&const DeepCollectionEquality().equals(other._weeklyRevenue, _weeklyRevenue)&&const DeepCollectionEquality().equals(other._recentTransactions, _recentTransactions)&&const DeepCollectionEquality().equals(other._lowStockProducts, _lowStockProducts)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,header,cards,const DeepCollectionEquality().hash(_weeklyRevenue),const DeepCollectionEquality().hash(_recentTransactions),const DeepCollectionEquality().hash(_lowStockProducts),isInitialLoading,isRefreshing,failure);

@override
String toString() {
  return 'DashboardState(header: $header, cards: $cards, weeklyRevenue: $weeklyRevenue, recentTransactions: $recentTransactions, lowStockProducts: $lowStockProducts, isInitialLoading: $isInitialLoading, isRefreshing: $isRefreshing, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 DashboardHeaderModel? header, DashboardCardsModel? cards, List<WeeklyRevenuePointModel> weeklyRevenue, List<DashboardTransactionModel> recentTransactions, List<ProductCardModel> lowStockProducts, bool isInitialLoading, bool isRefreshing, Failure? failure
});




}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? header = freezed,Object? cards = freezed,Object? weeklyRevenue = null,Object? recentTransactions = null,Object? lowStockProducts = null,Object? isInitialLoading = null,Object? isRefreshing = null,Object? failure = freezed,}) {
  return _then(_DashboardState(
header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as DashboardHeaderModel?,cards: freezed == cards ? _self.cards : cards // ignore: cast_nullable_to_non_nullable
as DashboardCardsModel?,weeklyRevenue: null == weeklyRevenue ? _self._weeklyRevenue : weeklyRevenue // ignore: cast_nullable_to_non_nullable
as List<WeeklyRevenuePointModel>,recentTransactions: null == recentTransactions ? _self._recentTransactions : recentTransactions // ignore: cast_nullable_to_non_nullable
as List<DashboardTransactionModel>,lowStockProducts: null == lowStockProducts ? _self._lowStockProducts : lowStockProducts // ignore: cast_nullable_to_non_nullable
as List<ProductCardModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
