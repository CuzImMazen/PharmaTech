// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_invoice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalesInvoiceState {

 List<SalesInvoiceModel> get invoices; bool get isInitialLoading; bool get isLoadingMore; bool get isRefreshing; int? get customerIdFilter; InvoiceStatus? get statusFilter; InvoicePaymentStatus? get paymentStatusFilter; String? get fromDate; String? get toDate; int get currentPage; int get lastPage; bool get hasMore; Failure? get failure; SalesInvoiceActionResult? get lastAction; int? get mutatingId;
/// Create a copy of SalesInvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesInvoiceStateCopyWith<SalesInvoiceState> get copyWith => _$SalesInvoiceStateCopyWithImpl<SalesInvoiceState>(this as SalesInvoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesInvoiceState&&const DeepCollectionEquality().equals(other.invoices, invoices)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.customerIdFilter, customerIdFilter) || other.customerIdFilter == customerIdFilter)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.paymentStatusFilter, paymentStatusFilter) || other.paymentStatusFilter == paymentStatusFilter)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction)&&(identical(other.mutatingId, mutatingId) || other.mutatingId == mutatingId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invoices),isInitialLoading,isLoadingMore,isRefreshing,customerIdFilter,statusFilter,paymentStatusFilter,fromDate,toDate,currentPage,lastPage,hasMore,failure,lastAction,mutatingId);

@override
String toString() {
  return 'SalesInvoiceState(invoices: $invoices, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, customerIdFilter: $customerIdFilter, statusFilter: $statusFilter, paymentStatusFilter: $paymentStatusFilter, fromDate: $fromDate, toDate: $toDate, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure, lastAction: $lastAction, mutatingId: $mutatingId)';
}


}

/// @nodoc
abstract mixin class $SalesInvoiceStateCopyWith<$Res>  {
  factory $SalesInvoiceStateCopyWith(SalesInvoiceState value, $Res Function(SalesInvoiceState) _then) = _$SalesInvoiceStateCopyWithImpl;
@useResult
$Res call({
 List<SalesInvoiceModel> invoices, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int? customerIdFilter, InvoiceStatus? statusFilter, InvoicePaymentStatus? paymentStatusFilter, String? fromDate, String? toDate, int currentPage, int lastPage, bool hasMore, Failure? failure, SalesInvoiceActionResult? lastAction, int? mutatingId
});




}
/// @nodoc
class _$SalesInvoiceStateCopyWithImpl<$Res>
    implements $SalesInvoiceStateCopyWith<$Res> {
  _$SalesInvoiceStateCopyWithImpl(this._self, this._then);

  final SalesInvoiceState _self;
  final $Res Function(SalesInvoiceState) _then;

/// Create a copy of SalesInvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoices = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? customerIdFilter = freezed,Object? statusFilter = freezed,Object? paymentStatusFilter = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,Object? lastAction = freezed,Object? mutatingId = freezed,}) {
  return _then(SalesInvoiceState(
invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<SalesInvoiceModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,customerIdFilter: freezed == customerIdFilter ? _self.customerIdFilter : customerIdFilter // ignore: cast_nullable_to_non_nullable
as int?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as InvoiceStatus?,paymentStatusFilter: freezed == paymentStatusFilter ? _self.paymentStatusFilter : paymentStatusFilter // ignore: cast_nullable_to_non_nullable
as InvoicePaymentStatus?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as SalesInvoiceActionResult?,mutatingId: freezed == mutatingId ? _self.mutatingId : mutatingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesInvoiceState].
extension SalesInvoiceStatePatterns on SalesInvoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesInvoiceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesInvoiceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesInvoiceState value)  $default,){
final _that = this;
switch (_that) {
case _SalesInvoiceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesInvoiceState value)?  $default,){
final _that = this;
switch (_that) {
case _SalesInvoiceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SalesInvoiceModel> invoices,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int? customerIdFilter,  InvoiceStatus? statusFilter,  InvoicePaymentStatus? paymentStatusFilter,  String? fromDate,  String? toDate,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure,  SalesInvoiceActionResult? lastAction,  int? mutatingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesInvoiceState() when $default != null:
return $default(_that.invoices,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.customerIdFilter,_that.statusFilter,_that.paymentStatusFilter,_that.fromDate,_that.toDate,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure,_that.lastAction,_that.mutatingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SalesInvoiceModel> invoices,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int? customerIdFilter,  InvoiceStatus? statusFilter,  InvoicePaymentStatus? paymentStatusFilter,  String? fromDate,  String? toDate,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure,  SalesInvoiceActionResult? lastAction,  int? mutatingId)  $default,) {final _that = this;
switch (_that) {
case _SalesInvoiceState():
return $default(_that.invoices,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.customerIdFilter,_that.statusFilter,_that.paymentStatusFilter,_that.fromDate,_that.toDate,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure,_that.lastAction,_that.mutatingId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SalesInvoiceModel> invoices,  bool isInitialLoading,  bool isLoadingMore,  bool isRefreshing,  int? customerIdFilter,  InvoiceStatus? statusFilter,  InvoicePaymentStatus? paymentStatusFilter,  String? fromDate,  String? toDate,  int currentPage,  int lastPage,  bool hasMore,  Failure? failure,  SalesInvoiceActionResult? lastAction,  int? mutatingId)?  $default,) {final _that = this;
switch (_that) {
case _SalesInvoiceState() when $default != null:
return $default(_that.invoices,_that.isInitialLoading,_that.isLoadingMore,_that.isRefreshing,_that.customerIdFilter,_that.statusFilter,_that.paymentStatusFilter,_that.fromDate,_that.toDate,_that.currentPage,_that.lastPage,_that.hasMore,_that.failure,_that.lastAction,_that.mutatingId);case _:
  return null;

}
}

}

/// @nodoc


class _SalesInvoiceState implements SalesInvoiceState {
  const _SalesInvoiceState({ List<SalesInvoiceModel> invoices = const <SalesInvoiceModel>[], this.isInitialLoading = false, this.isLoadingMore = false, this.isRefreshing = false, this.customerIdFilter, this.statusFilter, this.paymentStatusFilter, this.fromDate, this.toDate, this.currentPage = 1, this.lastPage = 1, this.hasMore = true, this.failure, this.lastAction, this.mutatingId}): _invoices = invoices;
  

 final  List<SalesInvoiceModel> _invoices;
@override@JsonKey() List<SalesInvoiceModel> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isRefreshing;
@override final  int? customerIdFilter;
@override final  InvoiceStatus? statusFilter;
@override final  InvoicePaymentStatus? paymentStatusFilter;
@override final  String? fromDate;
@override final  String? toDate;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  bool hasMore;
@override final  Failure? failure;
@override final  SalesInvoiceActionResult? lastAction;
@override final  int? mutatingId;

/// Create a copy of SalesInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesInvoiceStateCopyWith<_SalesInvoiceState> get copyWith => __$SalesInvoiceStateCopyWithImpl<_SalesInvoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesInvoiceState&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.customerIdFilter, customerIdFilter) || other.customerIdFilter == customerIdFilter)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.paymentStatusFilter, paymentStatusFilter) || other.paymentStatusFilter == paymentStatusFilter)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.lastAction, lastAction) || other.lastAction == lastAction)&&(identical(other.mutatingId, mutatingId) || other.mutatingId == mutatingId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),isInitialLoading,isLoadingMore,isRefreshing,customerIdFilter,statusFilter,paymentStatusFilter,fromDate,toDate,currentPage,lastPage,hasMore,failure,lastAction,mutatingId);

@override
String toString() {
  return 'SalesInvoiceState(invoices: $invoices, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, customerIdFilter: $customerIdFilter, statusFilter: $statusFilter, paymentStatusFilter: $paymentStatusFilter, fromDate: $fromDate, toDate: $toDate, currentPage: $currentPage, lastPage: $lastPage, hasMore: $hasMore, failure: $failure, lastAction: $lastAction, mutatingId: $mutatingId)';
}


}

/// @nodoc
abstract mixin class _$SalesInvoiceStateCopyWith<$Res> implements $SalesInvoiceStateCopyWith<$Res> {
  factory _$SalesInvoiceStateCopyWith(_SalesInvoiceState value, $Res Function(_SalesInvoiceState) _then) = __$SalesInvoiceStateCopyWithImpl;
@override @useResult
$Res call({
 List<SalesInvoiceModel> invoices, bool isInitialLoading, bool isLoadingMore, bool isRefreshing, int? customerIdFilter, InvoiceStatus? statusFilter, InvoicePaymentStatus? paymentStatusFilter, String? fromDate, String? toDate, int currentPage, int lastPage, bool hasMore, Failure? failure, SalesInvoiceActionResult? lastAction, int? mutatingId
});




}
/// @nodoc
class __$SalesInvoiceStateCopyWithImpl<$Res>
    implements _$SalesInvoiceStateCopyWith<$Res> {
  __$SalesInvoiceStateCopyWithImpl(this._self, this._then);

  final _SalesInvoiceState _self;
  final $Res Function(_SalesInvoiceState) _then;

/// Create a copy of SalesInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? customerIdFilter = freezed,Object? statusFilter = freezed,Object? paymentStatusFilter = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? currentPage = null,Object? lastPage = null,Object? hasMore = null,Object? failure = freezed,Object? lastAction = freezed,Object? mutatingId = freezed,}) {
  return _then(_SalesInvoiceState(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<SalesInvoiceModel>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,customerIdFilter: freezed == customerIdFilter ? _self.customerIdFilter : customerIdFilter // ignore: cast_nullable_to_non_nullable
as int?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as InvoiceStatus?,paymentStatusFilter: freezed == paymentStatusFilter ? _self.paymentStatusFilter : paymentStatusFilter // ignore: cast_nullable_to_non_nullable
as InvoicePaymentStatus?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,lastAction: freezed == lastAction ? _self.lastAction : lastAction // ignore: cast_nullable_to_non_nullable
as SalesInvoiceActionResult?,mutatingId: freezed == mutatingId ? _self.mutatingId : mutatingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
