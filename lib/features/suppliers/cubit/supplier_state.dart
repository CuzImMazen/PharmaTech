import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';

part 'supplier_state.freezed.dart';

/// Outcome of a supplier mutation, surfaced to the UI via BlocListener.
enum SupplierActionResult { created, updated, deleted, restored }

@freezed
sealed class SupplierState with _$SupplierState {
  const factory SupplierState({
    @Default(<SupplierModel>[]) List<SupplierModel> suppliers,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default('') String searchQuery,
    @Default(false) bool showDeleted,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    Failure? failure,
    SupplierActionResult? lastAction,
    int? actionId,
    @Default(false) bool isSaving,
    int? mutatingId,
  }) = _SupplierState;
}
