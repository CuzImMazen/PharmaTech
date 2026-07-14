import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_box_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_box_statistics_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transaction_model.dart';

part 'cash_box_state.freezed.dart';

/// Outcome of a cash-box mutation, surfaced to the UI via BlocListener.
enum CashBoxAction { created, refreshed }

@freezed
sealed class CashBoxState with _$CashBoxState {
  const factory CashBoxState({
    /// The pharmacy's cash box. `null` when the box doesn't exist yet (404).
    CashBoxModel? cashBox,

    /// `true` when the box fetch returned 404 (no box yet) — drives the
    /// "Create cash box" setup card.
    @Default(false) bool hasNoBox,

    @Default(false) bool isInitialLoading,
    @Default(false) bool isRefreshing,

    /// Income/outcome totals per period.
    CashBoxStatisticsModel? statistics,
    @Default(false) bool isLoadingStatistics,

    /// Transactions list + its pagination state.
    @Default(<CashTransactionModel>[]) List<CashTransactionModel> transactions,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
    @Default(false) bool areTransactionsLoading,

    /// Active transaction-type filter (`null` = all types).
    CashTransactionType? txFilter,

    /// Inclusive date-range filters (`YYYY-MM-DD`) for transactions.
    String? fromDate,
    String? toDate,

    /// Creating the cash box (one-time setup).
    @Default(false) bool isCreating,

    Failure? failure,
    CashBoxAction? lastAction,
  }) = _CashBoxState;

  const CashBoxState._();

  bool get hasActiveFilters =>
      txFilter != null || fromDate != null || toDate != null;
}
