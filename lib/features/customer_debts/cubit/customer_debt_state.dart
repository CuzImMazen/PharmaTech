import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customer_debts/data/models/customer_debt_model.dart';

part 'customer_debt_state.freezed.dart';

@freezed
sealed class CustomerDebtState with _$CustomerDebtState {
  const factory CustomerDebtState({
    @Default(<CustomerDebtModel>[]) List<CustomerDebtModel> debts,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    int? customerIdFilter,
    CustomerDebtStatus? statusFilter,
    Failure? failure,
  }) = _CustomerDebtState;
}
