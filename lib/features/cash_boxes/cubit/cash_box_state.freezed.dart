// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_box_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CashBoxState {

/// The pharmacy's cash box. `null` when the box doesn't exist yet (404).
 CashBoxModel? get cashBox;/// `true` when the box fetch returned 404 (no box yet) — drives the
/// "Create cash box" setup card.
 bool get hasNoBox; bool get isInitialLoading; bool get isRefreshing;/// Income/outcome totals per period.
 CashBoxStatisticsModel? get statistics; bool get isLoadingStatistics;/// Transactions list + its pagination state.
 List<CashTransactionModel> get transactions; int get currentPage; int get lastPage; bool get hasMore; bool get isLoadingMore; bool get areTransactionsLoading;/// Active transaction-type filter (`null` = all types).
 CashTransactionType? get txFilter;/// Inclusive date-range filters (`YYYY-MM-DD`) for transactions.
 String? get fromDate; String? get toDate;/// Creating the cash box (one-time setup).
 bool get isCreating; Failure? get failure; CashBoxAction? get lastAction;
/// Create a copy of CashBoxState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashBoxStateCopyWith<CashBoxState> get copyWith => _$CashBoxStateCopyWithImpl<CashBoxState>(this as CashBoxState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashBoxState&&(identical(other.cashBox, cashBox) || other.cashBox == cashBox)&&(identical(other.hasNoBox, hasNoBox) || other.hasNoBox == hasNoBox)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.isLoadingStatistics, isLoadingStatistics) || other.isLoadingStatistics == isLoadingStatistics)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.areTransactionsLoading, areTransactionsLoading) || other.areTransactionsLoading == areTransactionsLoading)&&(identical(other.txFilter, txFilter) || other.txFilter == txFilter)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction));
}


@override
int get hashCode => Object.hash(runtimeType,cashBox,hasNoBox,isInitialLoading,isRefreshing,statistics,isLoadingStatistics,const DeepCollectionEquality().hash(transactions),currentPage,lastPage,hasMore,isLoadingMore,areTransactionsLoading,txFilter,fromDate,toDate,isCreating,failure,lastAction);

@override
String toString() {
  return 'CashBoxState(cashBox: $cashBox, hasNoBox: $hasNoBox, isInitialLoading: $isInitialLoading, isRefreshing: $isRefreshing, statistics: $statistics, isLoadingStatistics: $isLoadingStatistics, transactions: $transactions, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore, areTransactionsLoading: $areTransactionsLoading, txFilter: $txFilter, fromDate: $fromDate, toDate: $toDate, isCreating: $isCreating, failure: $failure, lastAction: $lastAction)';
}


}

/// @nodoc
abstract mixin class $CashBoxStateCopyWith<$Res>  {
  factory $CashBoxStateCopyWith(CashBoxState value, $Res Function(CashBoxState) _then) = _$CashBoxStateCopyWithImpl;
@useResult
$Res call({
 CashBoxModel? cashBox, bool hasNoBox, bool isInitialLoading, bool isRefreshing, CashBoxStatisticsModel? statistics, bool isLoadingStatistics, List<CashTransactionModel> transactions, int currentPage, int lastPage, bool hasMore, bool isLoadingMore, bool areTransactionsLoading, CashTransactionType? txFilter, String? fromDate, String? toDate, bool isCreating, Failure? failure, CashBoxAction? lastAction
});




}
/// @nodoc
class _$CashBoxStateCopyWithImpl<$Res>
    implements $CashBoxStateCopyWith<$Res> {
  _$CashBoxStateCopyWithImpl(this._self, this._then);

  final CashBoxState _self;
  final $Res Function(CashBoxState) _then;

/// Create a copy of CashBoxState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cashBox = freezed,Object? hasNoBox = null,Object? isInitialLoading = null,Object? isRefreshing = null,Object? statistics = freezed,Object? isLoadingStatistics = null,Object? transactions = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? isLoadingMore = null,Object? areTransactionsLoading = null,Object? txFilter = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? isCreating = null,Object? failure = freezed,Object? lastAction = freezed,}) {
  return _then(CashBoxState(
cashBox: freezed == cashBox ? _self.cashBox : cashBox // ignore: cast_nullable_to_non_nullable
as CashBoxModel?,hasNoBox: null == hasNoBox ? _self.hasNoBox : hasNoBox // ignore: cast_nullable_to_non_nullable
as bool,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as CashBoxStatisticsModel?,isLoadingStatistics: null == isLoadingStatistics ? _self.isLoadingStatistics : isLoadingStatistics // ignore: cast_nullable_to_non_nullable
as bool,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<CashTransactionModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,areTransactionsLoading: null == areTransactionsLoading ? _self.areTransactionsLoading : areTransactionsLoading // ignore: cast_nullable_to_non_nullable
as bool,txFilter: freezed == txFilter ? _self.txFilter : txFilter // ignore: cast_nullable_to_non_nullable
as CashTransactionType?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as CashBoxAction?,
  ));
}

}


/// Adds pattern-matching-related methods to [CashBoxState].
extension CashBoxStatePatterns on CashBoxState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashBoxState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashBoxState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashBoxState value)  $default,){
final _that = this;
switch (_that) {
case _CashBoxState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashBoxState value)?  $default,){
final _that = this;
switch (_that) {
case _CashBoxState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CashBoxModel? cashBox,  bool hasNoBox,  bool isInitialLoading,  bool isRefreshing,  CashBoxStatisticsModel? statistics,  bool isLoadingStatistics,  List<CashTransactionModel> transactions,  int currentPage,  int lastPage,  bool hasMore,  bool isLoadingMore,  bool areTransactionsLoading,  CashTransactionType? txFilter,  String? fromDate,  String? toDate,  bool isCreating,  Failure? failure,  CashBoxAction? lastAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashBoxState() when $default != null:
return $default(_that.cashBox,_that.hasNoBox,_that.isInitialLoading,_that.isRefreshing,_that.statistics,_that.isLoadingStatistics,_that.transactions,_that.currentPage,_that.lastPage,_that.hasMore,_that.isLoadingMore,_that.areTransactionsLoading,_that.txFilter,_that.fromDate,_that.toDate,_that.isCreating,_that.failure,_that.lastAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CashBoxModel? cashBox,  bool hasNoBox,  bool isInitialLoading,  bool isRefreshing,  CashBoxStatisticsModel? statistics,  bool isLoadingStatistics,  List<CashTransactionModel> transactions,  int currentPage,  int lastPage,  bool hasMore,  bool isLoadingMore,  bool areTransactionsLoading,  CashTransactionType? txFilter,  String? fromDate,  String? toDate,  bool isCreating,  Failure? failure,  CashBoxAction? lastAction)  $default,) {final _that = this;
switch (_that) {
case _CashBoxState():
return $default(_that.cashBox,_that.hasNoBox,_that.isInitialLoading,_that.isRefreshing,_that.statistics,_that.isLoadingStatistics,_that.transactions,_that.currentPage,_that.lastPage,_that.hasMore,_that.isLoadingMore,_that.areTransactionsLoading,_that.txFilter,_that.fromDate,_that.toDate,_that.isCreating,_that.failure,_that.lastAction);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CashBoxModel? cashBox,  bool hasNoBox,  bool isInitialLoading,  bool isRefreshing,  CashBoxStatisticsModel? statistics,  bool isLoadingStatistics,  List<CashTransactionModel> transactions,  int currentPage,  int lastPage,  bool hasMore,  bool isLoadingMore,  bool areTransactionsLoading,  CashTransactionType? txFilter,  String? fromDate,  String? toDate,  bool isCreating,  Failure? failure,  CashBoxAction? lastAction)?  $default,) {final _that = this;
switch (_that) {
case _CashBoxState() when $default != null:
return $default(_that.cashBox,_that.hasNoBox,_that.isInitialLoading,_that.isRefreshing,_that.statistics,_that.isLoadingStatistics,_that.transactions,_that.currentPage,_that.lastPage,_that.hasMore,_that.isLoadingMore,_that.areTransactionsLoading,_that.txFilter,_that.fromDate,_that.toDate,_that.isCreating,_that.failure,_that.lastAction);case _:
  return null;

}
}

}

/// @nodoc


class _CashBoxState extends CashBoxState {
  const _CashBoxState({this.cashBox, this.hasNoBox = false, this.isInitialLoading = false, this.isRefreshing = false, this.statistics, this.isLoadingStatistics = false,  List<CashTransactionModel> transactions = const <CashTransactionModel>[], this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.isLoadingMore = false, this.areTransactionsLoading = false, this.txFilter, this.fromDate, this.toDate, this.isCreating = false, this.failure, this.lastAction}): _transactions = transactions,super._();
  

/// The pharmacy's cash box. `null` when the box doesn't exist yet (404).
@override final  CashBoxModel? cashBox;
/// `true` when the box fetch returned 404 (no box yet) — drives the
/// "Create cash box" setup card.
@override@JsonKey() final  bool hasNoBox;
@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isRefreshing;
/// Income/outcome totals per period.
@override final  CashBoxStatisticsModel? statistics;
@override@JsonKey() final  bool isLoadingStatistics;
/// Transactions list + its pagination state.
 final  List<CashTransactionModel> _transactions;
/// Transactions list + its pagination state.
@override@JsonKey() List<CashTransactionModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool areTransactionsLoading;
/// Active transaction-type filter (`null` = all types).
@override final  CashTransactionType? txFilter;
/// Inclusive date-range filters (`YYYY-MM-DD`) for transactions.
@override final  String? fromDate;
@override final  String? toDate;
/// Creating the cash box (one-time setup).
@override@JsonKey() final  bool isCreating;
@override final  Failure? failure;
@override final  CashBoxAction? lastAction;

/// Create a copy of CashBoxState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashBoxStateCopyWith<_CashBoxState> get copyWith => __$CashBoxStateCopyWithImpl<_CashBoxState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashBoxState&&(identical(other.cashBox, cashBox) || other.cashBox == cashBox)&&(identical(other.hasNoBox, hasNoBox) || other.hasNoBox == hasNoBox)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.isLoadingStatistics, isLoadingStatistics) || other.isLoadingStatistics == isLoadingStatistics)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.areTransactionsLoading, areTransactionsLoading) || other.areTransactionsLoading == areTransactionsLoading)&&(identical(other.txFilter, txFilter) || other.txFilter == txFilter)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction));
}


@override
int get hashCode => Object.hash(runtimeType,cashBox,hasNoBox,isInitialLoading,isRefreshing,statistics,isLoadingStatistics,const DeepCollectionEquality().hash(_transactions),currentPage,lastPage,hasMore,isLoadingMore,areTransactionsLoading,txFilter,fromDate,toDate,isCreating,failure,lastAction);

@override
String toString() {
  return 'CashBoxState(cashBox: $cashBox, hasNoBox: $hasNoBox, isInitialLoading: $isInitialLoading, isRefreshing: $isRefreshing, statistics: $statistics, isLoadingStatistics: $isLoadingStatistics, transactions: $transactions, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore, areTransactionsLoading: $areTransactionsLoading, txFilter: $txFilter, fromDate: $fromDate, toDate: $toDate, isCreating: $isCreating, failure: $failure, lastAction: $lastAction)';
}


}

/// @nodoc
abstract mixin class _$CashBoxStateCopyWith<$Res> implements $CashBoxStateCopyWith<$Res> {
  factory _$CashBoxStateCopyWith(_CashBoxState value, $Res Function(_CashBoxState) _then) = __$CashBoxStateCopyWithImpl;
@override @useResult
$Res call({
 CashBoxModel? cashBox, bool hasNoBox, bool isInitialLoading, bool isRefreshing, CashBoxStatisticsModel? statistics, bool isLoadingStatistics, List<CashTransactionModel> transactions, int currentPage, int lastPage, bool hasMore, bool isLoadingMore, bool areTransactionsLoading, CashTransactionType? txFilter, String? fromDate, String? toDate, bool isCreating, Failure? failure, CashBoxAction? lastAction
});




}
/// @nodoc
class __$CashBoxStateCopyWithImpl<$Res>
    implements _$CashBoxStateCopyWith<$Res> {
  __$CashBoxStateCopyWithImpl(this._self, this._then);

  final _CashBoxState _self;
  final $Res Function(_CashBoxState) _then;

/// Create a copy of CashBoxState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cashBox = freezed,Object? hasNoBox = null,Object? isInitialLoading = null,Object? isRefreshing = null,Object? statistics = freezed,Object? isLoadingStatistics = null,Object? transactions = null,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? isLoadingMore = null,Object? areTransactionsLoading = null,Object? txFilter = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? isCreating = null,Object? failure = freezed,Object? lastAction = freezed,}) {
  return _then(_CashBoxState(
cashBox: freezed == cashBox ? _self.cashBox : cashBox // ignore: cast_nullable_to_non_nullable
as CashBoxModel?,hasNoBox: null == hasNoBox ? _self.hasNoBox : hasNoBox // ignore: cast_nullable_to_non_nullable
as bool,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as CashBoxStatisticsModel?,isLoadingStatistics: null == isLoadingStatistics ? _self.isLoadingStatistics : isLoadingStatistics // ignore: cast_nullable_to_non_nullable
as bool,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<CashTransactionModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,areTransactionsLoading: null == areTransactionsLoading ? _self.areTransactionsLoading : areTransactionsLoading // ignore: cast_nullable_to_non_nullable
as bool,txFilter: freezed == txFilter ? _self.txFilter : txFilter // ignore: cast_nullable_to_non_nullable
as CashTransactionType?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as CashBoxAction?,
  ));
}


}

// dart format on
