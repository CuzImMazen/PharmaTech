// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_invoice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseInvoiceState {

 List<PurchaseInvoiceModel> get invoices; bool get isInitialLoading; bool get isLoadingMore; bool get isRefreshing; int? get supplierIdFilter; InvoiceStatus? get statusFilter; InvoicePaymentStatus? get paymentStatusFilter; String? get fromDate; String? get toDate; int get currentPage; int get lastPage; bool get hasMore; Failure? get failure; InvoiceActionResult? get lastAction; int? get mutatingId;
/// Create a copy of PurchaseInvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseInvoiceStateCopyWith<PurchaseInvoiceState> get copyWith => _$PurchaseInvoiceStateCopyWithImpl<PurchaseInvoiceState>(this as PurchaseInvoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseInvoiceState&&const DeepCollectionEquality().equals(other.invoices, invoices)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.supplierIdFilter, supplierIdFilter) || other.supplierIdFilter == supplierIdFilter)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.paymentStatusFilter, paymentStatusFilter) || other.paymentStatusFilter == paymentStatusFilter)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction)&&(identical(other.mutatingId, mutatingId) || other.mutatingId == mutatingId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invoices),isInitialLoading,isLoadingMore,isRefreshing,supplierIdFilter,statusFilter,paymentStatusFilter,fromDate,toDate,currentPage,lastPage,hasMore,failure,lastAction,mutatingId);

@override
String toString() {
  return 'PurchaseInvoiceState(invoices: $invoices, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, supplierIdFilter: $supplierIdFilter, statusFilter: $statusFilter, paymentStatusFilter: $paymentStatusFilter, fromDate: $fromDate, toDate: $toDate, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure, lastAction: $lastAction, mutatingId: $mutatingId)';
}


}

/// @nodoc
abstract mixin class $PurchaseInvoiceStateCopyWith<$Res>  {
  factory $PurchaseInvoiceStateCopyWith(PurchaseInvoiceState value, $Res Function(PurchaseInvoiceState) _then) = _$PurchaseInvoiceStateCopyWithImpl;
@useResult
$Res call({
 List<PurchaseInvoiceModel> invoices, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int? supplierIdFilter, InvoiceStatus? statusFilter, InvoicePaymentStatus? paymentStatusFilter, String? fromDate, String? toDate, int currentPage, int lastPage, bool hasMore, Failure? failure, InvoiceActionResult? lastAction, int? mutatingId
});




}
/// @nodoc
class _$PurchaseInvoiceStateCopyWithImpl<$Res>
    implements $PurchaseInvoiceStateCopyWith<$Res> {
  _$PurchaseInvoiceStateCopyWithImpl(this._self, this._then);

  final PurchaseInvoiceState _self;
  final $Res Function(PurchaseInvoiceState) _then;

/// Create a copy of PurchaseInvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoices = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? supplierIdFilter = freezed,Object? statusFilter = freezed,Object? paymentStatusFilter = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,Object? lastAction = freezed,Object? mutatingId = freezed,}) {
  return _then(PurchaseInvoiceState(
invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<PurchaseInvoiceModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,supplierIdFilter: freezed == supplierIdFilter ? _self.supplierIdFilter : supplierIdFilter // ignore: cast_nullable_to_non_nullable
as int?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as InvoiceStatus?,paymentStatusFilter: freezed == paymentStatusFilter ? _self.paymentStatusFilter : paymentStatusFilter // ignore: cast_nullable_to_non_nullable
as InvoicePaymentStatus?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as InvoiceActionResult?,mutatingId: freezed == mutatingId ? _self.mutatingId : mutatingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseInvoiceState].
extension PurchaseInvoiceStatePatterns on PurchaseInvoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseInvoiceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseInvoiceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseInvoiceState value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseInvoiceState value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PurchaseInvoiceModel> invoices,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int? supplierIdFilter,  InvoiceStatus? statusFilter,  InvoicePaymentStatus? paymentStatusFilter,  String? fromDate,  String? toDate,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure,  InvoiceActionResult? lastAction,  int? mutatingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseInvoiceState() when $default != null:
return $default(_that.invoices,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.supplierIdFilter,_that.statusFilter,_that.paymentStatusFilter,_that.fromDate,_that.toDate,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure,_that.lastAction,_that.mutatingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PurchaseInvoiceModel> invoices,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int? supplierIdFilter,  InvoiceStatus? statusFilter,  InvoicePaymentStatus? paymentStatusFilter,  String? fromDate,  String? toDate,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure,  InvoiceActionResult? lastAction,  int? mutatingId)  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceState():
return $default(_that.invoices,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.supplierIdFilter,_that.statusFilter,_that.paymentStatusFilter,_that.fromDate,_that.toDate,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure,_that.lastAction,_that.mutatingId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PurchaseInvoiceModel> invoices,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int? supplierIdFilter,  InvoiceStatus? statusFilter,  InvoicePaymentStatus? paymentStatusFilter,  String? fromDate,  String? toDate,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure,  InvoiceActionResult? lastAction,  int? mutatingId)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceState() when $default != null:
return $default(_that.invoices,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.supplierIdFilter,_that.statusFilter,_that.paymentStatusFilter,_that.fromDate,_that.toDate,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure,_that.lastAction,_that.mutatingId);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseInvoiceState implements PurchaseInvoiceState {
  const _PurchaseInvoiceState({ List<PurchaseInvoiceModel> invoices = const <PurchaseInvoiceModel>[], this.isInitialLoading = false, this.isLoadingMore = false, this.isRefreshing = false, this.supplierIdFilter, this.statusFilter, this.paymentStatusFilter, this.fromDate, this.toDate, this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.failure, this.lastAction, this.mutatingId}): _invoices = invoices;
  

 final  List<PurchaseInvoiceModel> _invoices;
@override@JsonKey() List<PurchaseInvoiceModel> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isRefreshing;
@override final  int? supplierIdFilter;
@override final  InvoiceStatus? statusFilter;
@override final  InvoicePaymentStatus? paymentStatusFilter;
@override final  String? fromDate;
@override final  String? toDate;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  bool hasMore;
@override final  Failure? failure;
@override final  InvoiceActionResult? lastAction;
@override final  int? mutatingId;

/// Create a copy of PurchaseInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseInvoiceStateCopyWith<_PurchaseInvoiceState> get copyWith => __$PurchaseInvoiceStateCopyWithImpl<_PurchaseInvoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseInvoiceState&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.supplierIdFilter, supplierIdFilter) || other.supplierIdFilter == supplierIdFilter)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.paymentStatusFilter, paymentStatusFilter) || other.paymentStatusFilter == paymentStatusFilter)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction)&&(identical(other.mutatingId, mutatingId) || other.mutatingId == mutatingId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),isInitialLoading,isLoadingMore,isRefreshing,supplierIdFilter,statusFilter,paymentStatusFilter,fromDate,toDate,currentPage,lastPage,hasMore,failure,lastAction,mutatingId);

@override
String toString() {
  return 'PurchaseInvoiceState(invoices: $invoices, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, supplierIdFilter: $supplierIdFilter, statusFilter: $statusFilter, paymentStatusFilter: $paymentStatusFilter, fromDate: $fromDate, toDate: $toDate, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure, lastAction: $lastAction, mutatingId: $mutatingId)';
}


}

/// @nodoc
abstract mixin class _$PurchaseInvoiceStateCopyWith<$Res> implements $PurchaseInvoiceStateCopyWith<$Res> {
  factory _$PurchaseInvoiceStateCopyWith(_PurchaseInvoiceState value, $Res Function(_PurchaseInvoiceState) _then) = __$PurchaseInvoiceStateCopyWithImpl;
@override @useResult
$Res call({
 List<PurchaseInvoiceModel> invoices, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int? supplierIdFilter, InvoiceStatus? statusFilter, InvoicePaymentStatus? paymentStatusFilter, String? fromDate, String? toDate, int currentPage, int lastPage, bool hasMore, Failure? failure, InvoiceActionResult? lastAction, int? mutatingId
});




}
/// @nodoc
class __$PurchaseInvoiceStateCopyWithImpl<$Res>
    implements _$PurchaseInvoiceStateCopyWith<$Res> {
  __$PurchaseInvoiceStateCopyWithImpl(this._self, this._then);

  final _PurchaseInvoiceState _self;
  final $Res Function(_PurchaseInvoiceState) _then;

/// Create a copy of PurchaseInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? supplierIdFilter = freezed,Object? statusFilter = freezed,Object? paymentStatusFilter = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,Object? lastAction = freezed,Object? mutatingId = freezed,}) {
  return _then(_PurchaseInvoiceState(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<PurchaseInvoiceModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,supplierIdFilter: freezed == supplierIdFilter ? _self.supplierIdFilter : supplierIdFilter // ignore: cast_nullable_to_non_nullable
as int?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as InvoiceStatus?,paymentStatusFilter: freezed == paymentStatusFilter ? _self.paymentStatusFilter : paymentStatusFilter // ignore: cast_nullable_to_non_nullable
as InvoicePaymentStatus?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as InvoiceActionResult?,mutatingId: freezed == mutatingId ? _self.mutatingId : mutatingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
