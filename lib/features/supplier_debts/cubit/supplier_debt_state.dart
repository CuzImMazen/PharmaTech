import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';

part 'supplier_debt_state.freezed.dart';

@freezed
sealed class SupplierDebtState with _$SupplierDebtState {
  const factory SupplierDebtState({
    @Default(<SupplierDebtModel>[]) List<SupplierDebtModel> debts,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    int? supplierIdFilter,
    SupplierDebtStatus? statusFilter,
    Failure? failure,
  }) = _SupplierDebtState;
}
