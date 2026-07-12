import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_movement_model.dart';

part 'stock_adjustment_state.freezed.dart';

@freezed
sealed class StockAdjustmentState with _$StockAdjustmentState {
  const factory StockAdjustmentState({
    @Default(<StockMovementModel>[]) List<StockMovementModel> adjustments,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    Failure? failure,
  }) = _StockAdjustmentState;
}
