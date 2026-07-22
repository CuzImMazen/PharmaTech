// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncReport<T> {

 bool get isLoading; bool get isRefreshing; Failure? get failure; T? get data;
/// Create a copy of AsyncReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<T, AsyncReport<T>> get copyWith => _$AsyncReportCopyWithImpl<T, AsyncReport<T>>(this as AsyncReport<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncReport<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,failure,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AsyncReport<$T>(isLoading: $isLoading, isRefreshing: $isRefreshing, failure: $failure, data: $data)';
}


}

/// @nodoc
abstract mixin class $AsyncReportCopyWith<T,$Res>  {
  factory $AsyncReportCopyWith(AsyncReport<T> value, $Res Function(AsyncReport<T>) _then) = _$AsyncReportCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isRefreshing, Failure? failure, T? data
});




}
/// @nodoc
class _$AsyncReportCopyWithImpl<T,$Res>
    implements $AsyncReportCopyWith<T, $Res> {
  _$AsyncReportCopyWithImpl(this._self, this._then);

  final AsyncReport<T> _self;
  final $Res Function(AsyncReport<T>) _then;

/// Create a copy of AsyncReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? failure = freezed,Object? data = freezed,}) {
  return _then(AsyncReport(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [AsyncReport].
extension AsyncReportPatterns<T> on AsyncReport<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AsyncReport<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AsyncReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AsyncReport<T> value)  $default,){
final _that = this;
switch (_that) {
case _AsyncReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AsyncReport<T> value)?  $default,){
final _that = this;
switch (_that) {
case _AsyncReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  Failure? failure,  T? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AsyncReport() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.failure,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  Failure? failure,  T? data)  $default,) {final _that = this;
switch (_that) {
case _AsyncReport():
return $default(_that.isLoading,_that.isRefreshing,_that.failure,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isRefreshing,  Failure? failure,  T? data)?  $default,) {final _that = this;
switch (_that) {
case _AsyncReport() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.failure,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _AsyncReport<T> extends AsyncReport<T> {
  const _AsyncReport({this.isLoading = false, this.isRefreshing = false, this.failure, this.data}): super._();
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isRefreshing;
@override final  Failure? failure;
@override final  T? data;

/// Create a copy of AsyncReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AsyncReportCopyWith<T, _AsyncReport<T>> get copyWith => __$AsyncReportCopyWithImpl<T, _AsyncReport<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AsyncReport<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,failure,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AsyncReport<$T>(isLoading: $isLoading, isRefreshing: $isRefreshing, failure: $failure, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AsyncReportCopyWith<T,$Res> implements $AsyncReportCopyWith<T, $Res> {
  factory _$AsyncReportCopyWith(_AsyncReport<T> value, $Res Function(_AsyncReport<T>) _then) = __$AsyncReportCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isRefreshing, Failure? failure, T? data
});




}
/// @nodoc
class __$AsyncReportCopyWithImpl<T,$Res>
    implements _$AsyncReportCopyWith<T, $Res> {
  __$AsyncReportCopyWithImpl(this._self, this._then);

  final _AsyncReport<T> _self;
  final $Res Function(_AsyncReport<T>) _then;

/// Create a copy of AsyncReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? failure = freezed,Object? data = freezed,}) {
  return _then(_AsyncReport<T>(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

/// @nodoc
mixin _$ReportsState {

 ReportType get selectedType; SalesPeriod get salesPeriod; DateTimeRange? get dateRange; int get topProductsLimit; int get stockHealthExpiryDays; int? get supplierPricesProductId; AsyncReport<SalesReportModel> get sales; AsyncReport<TopProductsReportModel> get topProducts; AsyncReport<ProfitReportModel> get profit; AsyncReport<SupplierPricesReportModel> get supplierPrices; AsyncReport<InventoryValueReportModel> get inventoryValue; AsyncReport<StockHealthReportModel> get stockHealth;
/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportsStateCopyWith<ReportsState> get copyWith => _$ReportsStateCopyWithImpl<ReportsState>(this as ReportsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportsState&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.salesPeriod, salesPeriod) || other.salesPeriod == salesPeriod)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&(identical(other.topProductsLimit, topProductsLimit) || other.topProductsLimit == topProductsLimit)&&(identical(other.stockHealthExpiryDays, stockHealthExpiryDays) || other.stockHealthExpiryDays == stockHealthExpiryDays)&&(identical(other.supplierPricesProductId, supplierPricesProductId) || other.supplierPricesProductId == supplierPricesProductId)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.topProducts, topProducts) || other.topProducts == topProducts)&&(identical(other.profit, profit) || other.profit == profit)&&(identical(other.supplierPrices, supplierPrices) || other.supplierPrices == supplierPrices)&&(identical(other.inventoryValue, inventoryValue) || other.inventoryValue == inventoryValue)&&(identical(other.stockHealth, stockHealth) || other.stockHealth == stockHealth));
}


@override
int get hashCode => Object.hash(runtimeType,selectedType,salesPeriod,dateRange,topProductsLimit,stockHealthExpiryDays,supplierPricesProductId,sales,topProducts,profit,supplierPrices,inventoryValue,stockHealth);

@override
String toString() {
  return 'ReportsState(selectedType: $selectedType, salesPeriod: $salesPeriod, dateRange: $dateRange, topProductsLimit: $topProductsLimit, stockHealthExpiryDays: $stockHealthExpiryDays, supplierPricesProductId: $supplierPricesProductId, sales: $sales, topProducts: $topProducts, profit: $profit, supplierPrices: $supplierPrices, inventoryValue: $inventoryValue, stockHealth: $stockHealth)';
}


}

/// @nodoc
abstract mixin class $ReportsStateCopyWith<$Res>  {
  factory $ReportsStateCopyWith(ReportsState value, $Res Function(ReportsState) _then) = _$ReportsStateCopyWithImpl;
@useResult
$Res call({
 ReportType selectedType, SalesPeriod salesPeriod, DateTimeRange? dateRange, int topProductsLimit, int stockHealthExpiryDays, int? supplierPricesProductId, AsyncReport<SalesReportModel> sales, AsyncReport<TopProductsReportModel> topProducts, AsyncReport<ProfitReportModel> profit, AsyncReport<SupplierPricesReportModel> supplierPrices, AsyncReport<InventoryValueReportModel> inventoryValue, AsyncReport<StockHealthReportModel> stockHealth
});


$AsyncReportCopyWith<SalesReportModel, $Res> get sales;$AsyncReportCopyWith<TopProductsReportModel, $Res> get topProducts;$AsyncReportCopyWith<ProfitReportModel, $Res> get profit;$AsyncReportCopyWith<SupplierPricesReportModel, $Res> get supplierPrices;$AsyncReportCopyWith<InventoryValueReportModel, $Res> get inventoryValue;$AsyncReportCopyWith<StockHealthReportModel, $Res> get stockHealth;

}
/// @nodoc
class _$ReportsStateCopyWithImpl<$Res>
    implements $ReportsStateCopyWith<$Res> {
  _$ReportsStateCopyWithImpl(this._self, this._then);

  final ReportsState _self;
  final $Res Function(ReportsState) _then;

/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedType = null,Object? salesPeriod = null,Object? dateRange = freezed,Object? topProductsLimit = null,Object? stockHealthExpiryDays = null,Object? supplierPricesProductId = freezed,Object? sales = null,Object? topProducts = null,Object? profit = null,Object? supplierPrices = null,Object? inventoryValue = null,Object? stockHealth = null,}) {
  return _then(ReportsState(
selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as ReportType,salesPeriod: null == salesPeriod ? _self.salesPeriod : salesPeriod // ignore: cast_nullable_to_non_nullable
as SalesPeriod,dateRange: freezed == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange?,topProductsLimit: null == topProductsLimit ? _self.topProductsLimit : topProductsLimit // ignore: cast_nullable_to_non_nullable
as int,stockHealthExpiryDays: null == stockHealthExpiryDays ? _self.stockHealthExpiryDays : stockHealthExpiryDays // ignore: cast_nullable_to_non_nullable
as int,supplierPricesProductId: freezed == supplierPricesProductId ? _self.supplierPricesProductId : supplierPricesProductId // ignore: cast_nullable_to_non_nullable
as int?,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as AsyncReport<SalesReportModel>,topProducts: null == topProducts ? _self.topProducts : topProducts // ignore: cast_nullable_to_non_nullable
as AsyncReport<TopProductsReportModel>,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as AsyncReport<ProfitReportModel>,supplierPrices: null == supplierPrices ? _self.supplierPrices : supplierPrices // ignore: cast_nullable_to_non_nullable
as AsyncReport<SupplierPricesReportModel>,inventoryValue: null == inventoryValue ? _self.inventoryValue : inventoryValue // ignore: cast_nullable_to_non_nullable
as AsyncReport<InventoryValueReportModel>,stockHealth: null == stockHealth ? _self.stockHealth : stockHealth // ignore: cast_nullable_to_non_nullable
as AsyncReport<StockHealthReportModel>,
  ));
}
/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<SalesReportModel, $Res> get sales {
  
  return $AsyncReportCopyWith<SalesReportModel, $Res>(_self.sales, (value) {
    return _then(_self.copyWith(sales: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<TopProductsReportModel, $Res> get topProducts {
  
  return $AsyncReportCopyWith<TopProductsReportModel, $Res>(_self.topProducts, (value) {
    return _then(_self.copyWith(topProducts: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<ProfitReportModel, $Res> get profit {
  
  return $AsyncReportCopyWith<ProfitReportModel, $Res>(_self.profit, (value) {
    return _then(_self.copyWith(profit: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<SupplierPricesReportModel, $Res> get supplierPrices {
  
  return $AsyncReportCopyWith<SupplierPricesReportModel, $Res>(_self.supplierPrices, (value) {
    return _then(_self.copyWith(supplierPrices: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<InventoryValueReportModel, $Res> get inventoryValue {
  
  return $AsyncReportCopyWith<InventoryValueReportModel, $Res>(_self.inventoryValue, (value) {
    return _then(_self.copyWith(inventoryValue: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<StockHealthReportModel, $Res> get stockHealth {
  
  return $AsyncReportCopyWith<StockHealthReportModel, $Res>(_self.stockHealth, (value) {
    return _then(_self.copyWith(stockHealth: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportsState].
extension ReportsStatePatterns on ReportsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportsState value)  $default,){
final _that = this;
switch (_that) {
case _ReportsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportsState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReportType selectedType,  SalesPeriod salesPeriod,  DateTimeRange? dateRange,  int topProductsLimit,  int stockHealthExpiryDays,  int? supplierPricesProductId,  AsyncReport<SalesReportModel> sales,  AsyncReport<TopProductsReportModel> topProducts,  AsyncReport<ProfitReportModel> profit,  AsyncReport<SupplierPricesReportModel> supplierPrices,  AsyncReport<InventoryValueReportModel> inventoryValue,  AsyncReport<StockHealthReportModel> stockHealth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportsState() when $default != null:
return $default(_that.selectedType,_that.salesPeriod,_that.dateRange,_that.topProductsLimit,_that.stockHealthExpiryDays,_that.supplierPricesProductId,_that.sales,_that.topProducts,_that.profit,_that.supplierPrices,_that.inventoryValue,_that.stockHealth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReportType selectedType,  SalesPeriod salesPeriod,  DateTimeRange? dateRange,  int topProductsLimit,  int stockHealthExpiryDays,  int? supplierPricesProductId,  AsyncReport<SalesReportModel> sales,  AsyncReport<TopProductsReportModel> topProducts,  AsyncReport<ProfitReportModel> profit,  AsyncReport<SupplierPricesReportModel> supplierPrices,  AsyncReport<InventoryValueReportModel> inventoryValue,  AsyncReport<StockHealthReportModel> stockHealth)  $default,) {final _that = this;
switch (_that) {
case _ReportsState():
return $default(_that.selectedType,_that.salesPeriod,_that.dateRange,_that.topProductsLimit,_that.stockHealthExpiryDays,_that.supplierPricesProductId,_that.sales,_that.topProducts,_that.profit,_that.supplierPrices,_that.inventoryValue,_that.stockHealth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReportType selectedType,  SalesPeriod salesPeriod,  DateTimeRange? dateRange,  int topProductsLimit,  int stockHealthExpiryDays,  int? supplierPricesProductId,  AsyncReport<SalesReportModel> sales,  AsyncReport<TopProductsReportModel> topProducts,  AsyncReport<ProfitReportModel> profit,  AsyncReport<SupplierPricesReportModel> supplierPrices,  AsyncReport<InventoryValueReportModel> inventoryValue,  AsyncReport<StockHealthReportModel> stockHealth)?  $default,) {final _that = this;
switch (_that) {
case _ReportsState() when $default != null:
return $default(_that.selectedType,_that.salesPeriod,_that.dateRange,_that.topProductsLimit,_that.stockHealthExpiryDays,_that.supplierPricesProductId,_that.sales,_that.topProducts,_that.profit,_that.supplierPrices,_that.inventoryValue,_that.stockHealth);case _:
  return null;

}
}

}

/// @nodoc


class _ReportsState extends ReportsState {
  const _ReportsState({this.selectedType = ReportType.sales, this.salesPeriod = SalesPeriod.daily, this.dateRange, this.topProductsLimit = 10, this.stockHealthExpiryDays = 90, this.supplierPricesProductId, this.sales = const AsyncReport(), this.topProducts = const AsyncReport(), this.profit = const AsyncReport(), this.supplierPrices = const AsyncReport(), this.inventoryValue = const AsyncReport(), this.stockHealth = const AsyncReport()}): super._();
  

@override@JsonKey() final  ReportType selectedType;
@override@JsonKey() final  SalesPeriod salesPeriod;
@override final  DateTimeRange? dateRange;
@override@JsonKey() final  int topProductsLimit;
@override@JsonKey() final  int stockHealthExpiryDays;
@override final  int? supplierPricesProductId;
@override@JsonKey() final  AsyncReport<SalesReportModel> sales;
@override@JsonKey() final  AsyncReport<TopProductsReportModel> topProducts;
@override@JsonKey() final  AsyncReport<ProfitReportModel> profit;
@override@JsonKey() final  AsyncReport<SupplierPricesReportModel> supplierPrices;
@override@JsonKey() final  AsyncReport<InventoryValueReportModel> inventoryValue;
@override@JsonKey() final  AsyncReport<StockHealthReportModel> stockHealth;

/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportsStateCopyWith<_ReportsState> get copyWith => __$ReportsStateCopyWithImpl<_ReportsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportsState&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.salesPeriod, salesPeriod) || other.salesPeriod == salesPeriod)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&(identical(other.topProductsLimit, topProductsLimit) || other.topProductsLimit == topProductsLimit)&&(identical(other.stockHealthExpiryDays, stockHealthExpiryDays) || other.stockHealthExpiryDays == stockHealthExpiryDays)&&(identical(other.supplierPricesProductId, supplierPricesProductId) || other.supplierPricesProductId == supplierPricesProductId)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.topProducts, topProducts) || other.topProducts == topProducts)&&(identical(other.profit, profit) || other.profit == profit)&&(identical(other.supplierPrices, supplierPrices) || other.supplierPrices == supplierPrices)&&(identical(other.inventoryValue, inventoryValue) || other.inventoryValue == inventoryValue)&&(identical(other.stockHealth, stockHealth) || other.stockHealth == stockHealth));
}


@override
int get hashCode => Object.hash(runtimeType,selectedType,salesPeriod,dateRange,topProductsLimit,stockHealthExpiryDays,supplierPricesProductId,sales,topProducts,profit,supplierPrices,inventoryValue,stockHealth);

@override
String toString() {
  return 'ReportsState(selectedType: $selectedType, salesPeriod: $salesPeriod, dateRange: $dateRange, topProductsLimit: $topProductsLimit, stockHealthExpiryDays: $stockHealthExpiryDays, supplierPricesProductId: $supplierPricesProductId, sales: $sales, topProducts: $topProducts, profit: $profit, supplierPrices: $supplierPrices, inventoryValue: $inventoryValue, stockHealth: $stockHealth)';
}


}

/// @nodoc
abstract mixin class _$ReportsStateCopyWith<$Res> implements $ReportsStateCopyWith<$Res> {
  factory _$ReportsStateCopyWith(_ReportsState value, $Res Function(_ReportsState) _then) = __$ReportsStateCopyWithImpl;
@override @useResult
$Res call({
 ReportType selectedType, SalesPeriod salesPeriod, DateTimeRange? dateRange, int topProductsLimit, int stockHealthExpiryDays, int? supplierPricesProductId, AsyncReport<SalesReportModel> sales, AsyncReport<TopProductsReportModel> topProducts, AsyncReport<ProfitReportModel> profit, AsyncReport<SupplierPricesReportModel> supplierPrices, AsyncReport<InventoryValueReportModel> inventoryValue, AsyncReport<StockHealthReportModel> stockHealth
});


@override $AsyncReportCopyWith<SalesReportModel, $Res> get sales;@override $AsyncReportCopyWith<TopProductsReportModel, $Res> get topProducts;@override $AsyncReportCopyWith<ProfitReportModel, $Res> get profit;@override $AsyncReportCopyWith<SupplierPricesReportModel, $Res> get supplierPrices;@override $AsyncReportCopyWith<InventoryValueReportModel, $Res> get inventoryValue;@override $AsyncReportCopyWith<StockHealthReportModel, $Res> get stockHealth;

}
/// @nodoc
class __$ReportsStateCopyWithImpl<$Res>
    implements _$ReportsStateCopyWith<$Res> {
  __$ReportsStateCopyWithImpl(this._self, this._then);

  final _ReportsState _self;
  final $Res Function(_ReportsState) _then;

/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedType = null,Object? salesPeriod = null,Object? dateRange = freezed,Object? topProductsLimit = null,Object? stockHealthExpiryDays = null,Object? supplierPricesProductId = freezed,Object? sales = null,Object? topProducts = null,Object? profit = null,Object? supplierPrices = null,Object? inventoryValue = null,Object? stockHealth = null,}) {
  return _then(_ReportsState(
selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as ReportType,salesPeriod: null == salesPeriod ? _self.salesPeriod : salesPeriod // ignore: cast_nullable_to_non_nullable
as SalesPeriod,dateRange: freezed == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange?,topProductsLimit: null == topProductsLimit ? _self.topProductsLimit : topProductsLimit // ignore: cast_nullable_to_non_nullable
as int,stockHealthExpiryDays: null == stockHealthExpiryDays ? _self.stockHealthExpiryDays : stockHealthExpiryDays // ignore: cast_nullable_to_non_nullable
as int,supplierPricesProductId: freezed == supplierPricesProductId ? _self.supplierPricesProductId : supplierPricesProductId // ignore: cast_nullable_to_non_nullable
as int?,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as AsyncReport<SalesReportModel>,topProducts: null == topProducts ? _self.topProducts : topProducts // ignore: cast_nullable_to_non_nullable
as AsyncReport<TopProductsReportModel>,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as AsyncReport<ProfitReportModel>,supplierPrices: null == supplierPrices ? _self.supplierPrices : supplierPrices // ignore: cast_nullable_to_non_nullable
as AsyncReport<SupplierPricesReportModel>,inventoryValue: null == inventoryValue ? _self.inventoryValue : inventoryValue // ignore: cast_nullable_to_non_nullable
as AsyncReport<InventoryValueReportModel>,stockHealth: null == stockHealth ? _self.stockHealth : stockHealth // ignore: cast_nullable_to_non_nullable
as AsyncReport<StockHealthReportModel>,
  ));
}

/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<SalesReportModel, $Res> get sales {
  
  return $AsyncReportCopyWith<SalesReportModel, $Res>(_self.sales, (value) {
    return _then(_self.copyWith(sales: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<TopProductsReportModel, $Res> get topProducts {
  
  return $AsyncReportCopyWith<TopProductsReportModel, $Res>(_self.topProducts, (value) {
    return _then(_self.copyWith(topProducts: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<ProfitReportModel, $Res> get profit {
  
  return $AsyncReportCopyWith<ProfitReportModel, $Res>(_self.profit, (value) {
    return _then(_self.copyWith(profit: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<SupplierPricesReportModel, $Res> get supplierPrices {
  
  return $AsyncReportCopyWith<SupplierPricesReportModel, $Res>(_self.supplierPrices, (value) {
    return _then(_self.copyWith(supplierPrices: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<InventoryValueReportModel, $Res> get inventoryValue {
  
  return $AsyncReportCopyWith<InventoryValueReportModel, $Res>(_self.inventoryValue, (value) {
    return _then(_self.copyWith(inventoryValue: value));
  });
}/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncReportCopyWith<StockHealthReportModel, $Res> get stockHealth {
  
  return $AsyncReportCopyWith<StockHealthReportModel, $Res>(_self.stockHealth, (value) {
    return _then(_self.copyWith(stockHealth: value));
  });
}
}

// dart format on
