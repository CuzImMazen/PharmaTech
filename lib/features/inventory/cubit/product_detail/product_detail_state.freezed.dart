// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailState {

 ProductDetailModel? get product; List<StockBatchModel> get batches; List<StockMovementModel> get movements; ProductMedicalInfoModel? get medicalInfo; bool get isInitialLoading; bool get isRefreshing; bool get isBatchesLoading; bool get isMovementsLoading; bool get isMedicalLoading; bool get isMedicalSaving; bool get isMedicalDeleting; bool get isProductDeleting; bool get isProductDeleted; Failure? get medicalFailure; MedicalActionResult? get lastMedicalAction; int? get mutatingBatchId; bool get isAddingBatch; BatchActionResult? get lastBatchAction; Failure? get batchFailure; Failure? get movementsFailure; Failure? get failure;
/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailStateCopyWith<ProductDetailState> get copyWith => _$ProductDetailStateCopyWithImpl<ProductDetailState>(this as ProductDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailState&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other.batches, batches)&&const DeepCollectionEquality().equals(other.movements, movements)&&(identical(other.medicalInfo, medicalInfo) || other.medicalInfo == medicalInfo)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isBatchesLoading, isBatchesLoading) || other.isBatchesLoading == isBatchesLoading)&&(identical(other.isMovementsLoading, isMovementsLoading) || other.isMovementsLoading == isMovementsLoading)&&(identical(other.isMedicalLoading, isMedicalLoading) || other.isMedicalLoading == isMedicalLoading)&&(identical(other.isMedicalSaving, isMedicalSaving) || other.isMedicalSaving == isMedicalSaving)&&(identical(other.isMedicalDeleting, isMedicalDeleting) || other.isMedicalDeleting == isMedicalDeleting)&&(identical(other.isProductDeleting, isProductDeleting) || other.isProductDeleting == isProductDeleting)&&(identical(other.isProductDeleted, isProductDeleted) || other.isProductDeleted == isProductDeleted)&&(identical(other.medicalFailure, medicalFailure) || other.medicalFailure == medicalFailure)&&(identical(other.lastMedicalAction, lastMedicalAction) || other.lastMedicalAction == lastMedicalAction)&&(identical(other.mutatingBatchId, mutatingBatchId) || other.mutatingBatchId == mutatingBatchId)&&(identical(other.isAddingBatch, isAddingBatch) || other.isAddingBatch == isAddingBatch)&&(identical(other.lastBatchAction, lastBatchAction) || other.lastBatchAction == lastBatchAction)&&(identical(other.batchFailure, batchFailure) || other.batchFailure == batchFailure)&&(identical(other.movementsFailure, movementsFailure) || other.movementsFailure == movementsFailure)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hashAll([runtimeType,product,const DeepCollectionEquality().hash(batches),const DeepCollectionEquality().hash(movements),medicalInfo,isInitialLoading,isRefreshing,isBatchesLoading,isMovementsLoading,isMedicalLoading,isMedicalSaving,isMedicalDeleting,isProductDeleting,isProductDeleted,medicalFailure,lastMedicalAction,mutatingBatchId,isAddingBatch,lastBatchAction,batchFailure,movementsFailure,failure]);

@override
String toString() {
  return 'ProductDetailState(product: $product, batches: $batches, movements: $movements, medicalInfo: $medicalInfo, isInitialLoading: $isInitialLoading, isRefreshing: $isRefreshing, isBatchesLoading: $isBatchesLoading, isMovementsLoading: $isMovementsLoading, isMedicalLoading: $isMedicalLoading, isMedicalSaving: $isMedicalSaving, isMedicalDeleting: $isMedicalDeleting, isProductDeleting: $isProductDeleting, isProductDeleted: $isProductDeleted, medicalFailure: $medicalFailure, lastMedicalAction: $lastMedicalAction, mutatingBatchId: $mutatingBatchId, isAddingBatch: $isAddingBatch, lastBatchAction: $lastBatchAction, batchFailure: $batchFailure, movementsFailure: $movementsFailure, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ProductDetailStateCopyWith<$Res>  {
  factory $ProductDetailStateCopyWith(ProductDetailState value, $Res Function(ProductDetailState) _then) = _$ProductDetailStateCopyWithImpl;
@useResult
$Res call({
 ProductDetailModel? product, List<StockBatchModel> batches, List<StockMovementModel> movements, ProductMedicalInfoModel? medicalInfo, bool isInitialLoading, bool isRefreshing, bool isBatchesLoading, bool isMovementsLoading, bool isMedicalLoading, bool isMedicalSaving, bool isMedicalDeleting, bool isProductDeleting, bool isProductDeleted, Failure? medicalFailure, MedicalActionResult? lastMedicalAction, int? mutatingBatchId, bool isAddingBatch, BatchActionResult? lastBatchAction, Failure? batchFailure, Failure? movementsFailure, Failure? failure
});




}
/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._self, this._then);

  final ProductDetailState _self;
  final $Res Function(ProductDetailState) _then;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = freezed,Object? batches = null,Object? movements = null,Object? medicalInfo = freezed,Object? isInitialLoading = null,Object? isRefreshing = null,Object? isBatchesLoading = null,Object? isMovementsLoading = null,Object? isMedicalLoading = null,Object? isMedicalSaving = null,Object? isMedicalDeleting = null,Object? isProductDeleting = null,Object? isProductDeleted = null,Object? medicalFailure = freezed,Object? lastMedicalAction = freezed,Object? mutatingBatchId = freezed,Object? isAddingBatch = null,Object? lastBatchAction = freezed,Object? batchFailure = freezed,Object? movementsFailure = freezed,Object? failure = freezed,}) {
  return _then(ProductDetailState(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDetailModel?,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<StockBatchModel>,movements: null == movements ? _self.movements : movements // ignore: cast_nullable_to_non_nullable
as List<StockMovementModel>,medicalInfo: freezed == medicalInfo ? _self.medicalInfo : medicalInfo // ignore: cast_nullable_to_non_nullable
as ProductMedicalInfoModel?,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isBatchesLoading: null == isBatchesLoading ? _self.isBatchesLoading : isBatchesLoading // ignore: cast_nullable_to_non_nullable
as bool,isMovementsLoading: null == isMovementsLoading ? _self.isMovementsLoading : isMovementsLoading // ignore: cast_nullable_to_non_nullable
as bool,isMedicalLoading: null == isMedicalLoading ? _self.isMedicalLoading : isMedicalLoading // ignore: cast_nullable_to_non_nullable
as bool,isMedicalSaving: null == isMedicalSaving ? _self.isMedicalSaving : isMedicalSaving // ignore: cast_nullable_to_non_nullable
as bool,isMedicalDeleting: null == isMedicalDeleting ? _self.isMedicalDeleting : isMedicalDeleting // ignore: cast_nullable_to_non_nullable
as bool,isProductDeleting: null == isProductDeleting ? _self.isProductDeleting : isProductDeleting // ignore: cast_nullable_to_non_nullable
as bool,isProductDeleted: null == isProductDeleted ? _self.isProductDeleted : isProductDeleted // ignore: cast_nullable_to_non_nullable
as bool,medicalFailure: freezed == medicalFailure ? _self.medicalFailure : medicalFailure // ignore: cast_nullable_to_non_nullable
as Failure?,lastMedicalAction: freezed == lastMedicalAction ? _self.lastMedicalAction : lastMedicalAction // ignore: cast_nullable_to_non_nullable
as MedicalActionResult?,mutatingBatchId: freezed == mutatingBatchId ? _self.mutatingBatchId : mutatingBatchId // ignore: cast_nullable_to_non_nullable
as int?,isAddingBatch: null == isAddingBatch ? _self.isAddingBatch : isAddingBatch // ignore: cast_nullable_to_non_nullable
as bool,lastBatchAction: freezed == lastBatchAction ? _self.lastBatchAction : lastBatchAction // ignore: cast_nullable_to_non_nullable
as BatchActionResult?,batchFailure: freezed == batchFailure ? _self.batchFailure : batchFailure // ignore: cast_nullable_to_non_nullable
as Failure?,movementsFailure: freezed == movementsFailure ? _self.movementsFailure : movementsFailure // ignore: cast_nullable_to_non_nullable
as Failure?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailState].
extension ProductDetailStatePatterns on ProductDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductDetailModel? product,  List<StockBatchModel> batches,  List<StockMovementModel> movements,  ProductMedicalInfoModel? medicalInfo,  bool isInitialLoading,  bool isRefreshing,  bool isBatchesLoading,  bool isMovementsLoading,  bool isMedicalLoading,  bool isMedicalSaving,  bool isMedicalDeleting,  bool isProductDeleting,  bool isProductDeleted,  Failure? medicalFailure,  MedicalActionResult? lastMedicalAction,  int? mutatingBatchId,  bool isAddingBatch,  BatchActionResult? lastBatchAction,  Failure? batchFailure,  Failure? movementsFailure,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
return $default(_that.product,_that.batches,_that.movements,_that.medicalInfo,_that.isInitialLoading,_that.isRefreshing,_that.isBatchesLoading,_that.isMovementsLoading,_that.isMedicalLoading,_that.isMedicalSaving,_that.isMedicalDeleting,_that.isProductDeleting,_that.isProductDeleted,_that.medicalFailure,_that.lastMedicalAction,_that.mutatingBatchId,_that.isAddingBatch,_that.lastBatchAction,_that.batchFailure,_that.movementsFailure,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductDetailModel? product,  List<StockBatchModel> batches,  List<StockMovementModel> movements,  ProductMedicalInfoModel? medicalInfo,  bool isInitialLoading,  bool isRefreshing,  bool isBatchesLoading,  bool isMovementsLoading,  bool isMedicalLoading,  bool isMedicalSaving,  bool isMedicalDeleting,  bool isProductDeleting,  bool isProductDeleted,  Failure? medicalFailure,  MedicalActionResult? lastMedicalAction,  int? mutatingBatchId,  bool isAddingBatch,  BatchActionResult? lastBatchAction,  Failure? batchFailure,  Failure? movementsFailure,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailState():
return $default(_that.product,_that.batches,_that.movements,_that.medicalInfo,_that.isInitialLoading,_that.isRefreshing,_that.isBatchesLoading,_that.isMovementsLoading,_that.isMedicalLoading,_that.isMedicalSaving,_that.isMedicalDeleting,_that.isProductDeleting,_that.isProductDeleted,_that.medicalFailure,_that.lastMedicalAction,_that.mutatingBatchId,_that.isAddingBatch,_that.lastBatchAction,_that.batchFailure,_that.movementsFailure,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductDetailModel? product,  List<StockBatchModel> batches,  List<StockMovementModel> movements,  ProductMedicalInfoModel? medicalInfo,  bool isInitialLoading,  bool isRefreshing,  bool isBatchesLoading,  bool isMovementsLoading,  bool isMedicalLoading,  bool isMedicalSaving,  bool isMedicalDeleting,  bool isProductDeleting,  bool isProductDeleted,  Failure? medicalFailure,  MedicalActionResult? lastMedicalAction,  int? mutatingBatchId,  bool isAddingBatch,  BatchActionResult? lastBatchAction,  Failure? batchFailure,  Failure? movementsFailure,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
return $default(_that.product,_that.batches,_that.movements,_that.medicalInfo,_that.isInitialLoading,_that.isRefreshing,_that.isBatchesLoading,_that.isMovementsLoading,_that.isMedicalLoading,_that.isMedicalSaving,_that.isMedicalDeleting,_that.isProductDeleting,_that.isProductDeleted,_that.medicalFailure,_that.lastMedicalAction,_that.mutatingBatchId,_that.isAddingBatch,_that.lastBatchAction,_that.batchFailure,_that.movementsFailure,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _ProductDetailState implements ProductDetailState {
  const _ProductDetailState({this.product,  List<StockBatchModel> batches = const <StockBatchModel>[],  List<StockMovementModel> movements = const <StockMovementModel>[], this.medicalInfo, this.isInitialLoading = false, this.isRefreshing = false, this.isBatchesLoading = false, this.isMovementsLoading = false, this.isMedicalLoading = false, this.isMedicalSaving = false, this.isMedicalDeleting = false, this.isProductDeleting = false, this.isProductDeleted = false, this.medicalFailure, this.lastMedicalAction, this.mutatingBatchId, this.isAddingBatch = false, this.lastBatchAction, this.batchFailure, this.movementsFailure, this.failure}): _batches = batches,_movements = movements;
  

@override final  ProductDetailModel? product;
 final  List<StockBatchModel> _batches;
@override@JsonKey() List<StockBatchModel> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}

 final  List<StockMovementModel> _movements;
@override@JsonKey() List<StockMovementModel> get movements {
  if (_movements is EqualUnmodifiableListView) return _movements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movements);
}

@override final  ProductMedicalInfoModel? medicalInfo;
@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool isBatchesLoading;
@override@JsonKey() final  bool isMovementsLoading;
@override@JsonKey() final  bool isMedicalLoading;
@override@JsonKey() final  bool isMedicalSaving;
@override@JsonKey() final  bool isMedicalDeleting;
@override@JsonKey() final  bool isProductDeleting;
@override@JsonKey() final  bool isProductDeleted;
@override final  Failure? medicalFailure;
@override final  MedicalActionResult? lastMedicalAction;
@override final  int? mutatingBatchId;
@override@JsonKey() final  bool isAddingBatch;
@override final  BatchActionResult? lastBatchAction;
@override final  Failure? batchFailure;
@override final  Failure? movementsFailure;
@override final  Failure? failure;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailStateCopyWith<_ProductDetailState> get copyWith => __$ProductDetailStateCopyWithImpl<_ProductDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailState&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other._batches, _batches)&&const DeepCollectionEquality().equals(other._movements, _movements)&&(identical(other.medicalInfo, medicalInfo) || other.medicalInfo == medicalInfo)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isBatchesLoading, isBatchesLoading) || other.isBatchesLoading == isBatchesLoading)&&(identical(other.isMovementsLoading, isMovementsLoading) || other.isMovementsLoading == isMovementsLoading)&&(identical(other.isMedicalLoading, isMedicalLoading) || other.isMedicalLoading == isMedicalLoading)&&(identical(other.isMedicalSaving, isMedicalSaving) || other.isMedicalSaving == isMedicalSaving)&&(identical(other.isMedicalDeleting, isMedicalDeleting) || other.isMedicalDeleting == isMedicalDeleting)&&(identical(other.isProductDeleting, isProductDeleting) || other.isProductDeleting == isProductDeleting)&&(identical(other.isProductDeleted, isProductDeleted) || other.isProductDeleted == isProductDeleted)&&(identical(other.medicalFailure, medicalFailure) || other.medicalFailure == medicalFailure)&&(identical(other.lastMedicalAction, lastMedicalAction) || other.lastMedicalAction == lastMedicalAction)&&(identical(other.mutatingBatchId, mutatingBatchId) || other.mutatingBatchId == mutatingBatchId)&&(identical(other.isAddingBatch, isAddingBatch) || other.isAddingBatch == isAddingBatch)&&(identical(other.lastBatchAction, lastBatchAction) || other.lastBatchAction == lastBatchAction)&&(identical(other.batchFailure, batchFailure) || other.batchFailure == batchFailure)&&(identical(other.movementsFailure, movementsFailure) || other.movementsFailure == movementsFailure)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hashAll([runtimeType,product,const DeepCollectionEquality().hash(_batches),const DeepCollectionEquality().hash(_movements),medicalInfo,isInitialLoading,isRefreshing,isBatchesLoading,isMovementsLoading,isMedicalLoading,isMedicalSaving,isMedicalDeleting,isProductDeleting,isProductDeleted,medicalFailure,lastMedicalAction,mutatingBatchId,isAddingBatch,lastBatchAction,batchFailure,movementsFailure,failure]);

@override
String toString() {
  return 'ProductDetailState(product: $product, batches: $batches, movements: $movements, medicalInfo: $medicalInfo, isInitialLoading: $isInitialLoading, isRefreshing: $isRefreshing, isBatchesLoading: $isBatchesLoading, isMovementsLoading: $isMovementsLoading, isMedicalLoading: $isMedicalLoading, isMedicalSaving: $isMedicalSaving, isMedicalDeleting: $isMedicalDeleting, isProductDeleting: $isProductDeleting, isProductDeleted: $isProductDeleted, medicalFailure: $medicalFailure, lastMedicalAction: $lastMedicalAction, mutatingBatchId: $mutatingBatchId, isAddingBatch: $isAddingBatch, lastBatchAction: $lastBatchAction, batchFailure: $batchFailure, movementsFailure: $movementsFailure, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailStateCopyWith<$Res> implements $ProductDetailStateCopyWith<$Res> {
  factory _$ProductDetailStateCopyWith(_ProductDetailState value, $Res Function(_ProductDetailState) _then) = __$ProductDetailStateCopyWithImpl;
@override @useResult
$Res call({
 ProductDetailModel? product, List<StockBatchModel> batches, List<StockMovementModel> movements, ProductMedicalInfoModel? medicalInfo, bool isInitialLoading, bool isRefreshing, bool isBatchesLoading, bool isMovementsLoading, bool isMedicalLoading, bool isMedicalSaving, bool isMedicalDeleting, bool isProductDeleting, bool isProductDeleted, Failure? medicalFailure, MedicalActionResult? lastMedicalAction, int? mutatingBatchId, bool isAddingBatch, BatchActionResult? lastBatchAction, Failure? batchFailure, Failure? movementsFailure, Failure? failure
});




}
/// @nodoc
class __$ProductDetailStateCopyWithImpl<$Res>
    implements _$ProductDetailStateCopyWith<$Res> {
  __$ProductDetailStateCopyWithImpl(this._self, this._then);

  final _ProductDetailState _self;
  final $Res Function(_ProductDetailState) _then;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = freezed,Object? batches = null,Object? movements = null,Object? medicalInfo = freezed,Object? isInitialLoading = null,Object? isRefreshing = null,Object? isBatchesLoading = null,Object? isMovementsLoading = null,Object? isMedicalLoading = null,Object? isMedicalSaving = null,Object? isMedicalDeleting = null,Object? isProductDeleting = null,Object? isProductDeleted = null,Object? medicalFailure = freezed,Object? lastMedicalAction = freezed,Object? mutatingBatchId = freezed,Object? isAddingBatch = null,Object? lastBatchAction = freezed,Object? batchFailure = freezed,Object? movementsFailure = freezed,Object? failure = freezed,}) {
  return _then(_ProductDetailState(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDetailModel?,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<StockBatchModel>,movements: null == movements ? _self._movements : movements // ignore: cast_nullable_to_non_nullable
as List<StockMovementModel>,medicalInfo: freezed == medicalInfo ? _self.medicalInfo : medicalInfo // ignore: cast_nullable_to_non_nullable
as ProductMedicalInfoModel?,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isBatchesLoading: null == isBatchesLoading ? _self.isBatchesLoading : isBatchesLoading // ignore: cast_nullable_to_non_nullable
as bool,isMovementsLoading: null == isMovementsLoading ? _self.isMovementsLoading : isMovementsLoading // ignore: cast_nullable_to_non_nullable
as bool,isMedicalLoading: null == isMedicalLoading ? _self.isMedicalLoading : isMedicalLoading // ignore: cast_nullable_to_non_nullable
as bool,isMedicalSaving: null == isMedicalSaving ? _self.isMedicalSaving : isMedicalSaving // ignore: cast_nullable_to_non_nullable
as bool,isMedicalDeleting: null == isMedicalDeleting ? _self.isMedicalDeleting : isMedicalDeleting // ignore: cast_nullable_to_non_nullable
as bool,isProductDeleting: null == isProductDeleting ? _self.isProductDeleting : isProductDeleting // ignore: cast_nullable_to_non_nullable
as bool,isProductDeleted: null == isProductDeleted ? _self.isProductDeleted : isProductDeleted // ignore: cast_nullable_to_non_nullable
as bool,medicalFailure: freezed == medicalFailure ? _self.medicalFailure : medicalFailure // ignore: cast_nullable_to_non_nullable
as Failure?,lastMedicalAction: freezed == lastMedicalAction ? _self.lastMedicalAction : lastMedicalAction // ignore: cast_nullable_to_non_nullable
as MedicalActionResult?,mutatingBatchId: freezed == mutatingBatchId ? _self.mutatingBatchId : mutatingBatchId // ignore: cast_nullable_to_non_nullable
as int?,isAddingBatch: null == isAddingBatch ? _self.isAddingBatch : isAddingBatch // ignore: cast_nullable_to_non_nullable
as bool,lastBatchAction: freezed == lastBatchAction ? _self.lastBatchAction : lastBatchAction // ignore: cast_nullable_to_non_nullable
as BatchActionResult?,batchFailure: freezed == batchFailure ? _self.batchFailure : batchFailure // ignore: cast_nullable_to_non_nullable
as Failure?,movementsFailure: freezed == movementsFailure ? _self.movementsFailure : movementsFailure // ignore: cast_nullable_to_non_nullable
as Failure?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
