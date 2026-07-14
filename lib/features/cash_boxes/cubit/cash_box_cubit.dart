import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/cash_boxes/cubit/cash_box_state.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transaction_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/repo/cash_box_repository.dart';

/// Drives the Cash Box screen: loads the pharmacy's single cash box (or the
/// "no box" setup state on 404), creates it when absent, and paginates the
/// transaction history with an optional transaction-type filter.
class CashBoxCubit extends Cubit<CashBoxState> {
  CashBoxCubit({required this.repository}) : super(const CashBoxState());

  final CashBoxRepository repository;

  /// Initial load: the box, then the first page of transactions.
  Future<void> loadCashBox() async {
    if (isClosed) return;
    emit(state.copyWith(isInitialLoading: true, failure: null));
    final boxResult = await repository.fetchCashBox();
    if (isClosed) return;

    // A 404 (no box yet) is not a hard error — it drives the setup card. We
    // distinguish it from a real network failure by checking the Failure type.
    await boxResult.fold(
      (failure) async {
        if (_isNotFound(failure)) {
          emit(
            state.copyWith(
              isInitialLoading: false,
              hasNoBox: true,
              cashBox: null,
              failure: null,
            ),
          );
        } else {
          emit(state.copyWith(isInitialLoading: false, failure: failure));
        }
      },
      (box) async {
        emit(
          state.copyWith(
            isInitialLoading: false,
            hasNoBox: false,
            cashBox: box,
            failure: null,
          ),
        );
        await Future.wait<void>([
          _fetchTransactions(reset: true),
          _fetchStatistics(),
        ]);
      },
    );
  }

  /// Pull-to-refresh / retry.
  Future<void> refresh() async {
    if (isClosed) return;
    emit(state.copyWith(isRefreshing: true, failure: null));
    final boxResult = await repository.fetchCashBox();
    if (isClosed) return;
    await boxResult.fold(
      (failure) async {
        if (_isNotFound(failure)) {
          emit(
            state.copyWith(
              isRefreshing: false,
              hasNoBox: true,
              cashBox: null,
              failure: null,
            ),
          );
        } else {
          emit(state.copyWith(isRefreshing: false, failure: failure));
        }
      },
      (box) async {
        emit(
          state.copyWith(
            isRefreshing: false,
            hasNoBox: false,
            cashBox: box,
            failure: null,
          ),
        );
        await Future.wait<void>([
          _fetchTransactions(reset: true),
          _fetchStatistics(),
        ]);
      },
    );
  }

  /// One-time setup: create the box with the given opening balance.
  Future<void> createCashBox(double openingBalance) async {
    if (isClosed || state.isCreating) return;
    emit(state.copyWith(isCreating: true, failure: null));
    final result = await repository.createCashBox(openingBalance);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isCreating: false, failure: failure)),
      (box) async {
        emit(
          state.copyWith(
            isCreating: false,
            hasNoBox: false,
            cashBox: box,
            lastAction: CashBoxAction.created,
          ),
        );
        await Future.wait<void>([
          _fetchTransactions(reset: true),
          _fetchStatistics(),
        ]);
      },
    );
  }

  // ---- Transactions ----------------------------------------------------- //

  Future<void> loadTransactions() => _fetchTransactions(reset: true);

  Future<void> refreshTransactions() => _fetchTransactions(reset: true);

  Future<void> loadNextTransactions() async {
    if (isClosed || state.isLoadingMore || !state.hasMore) return;
    await _fetchTransactions(page: state.currentPage + 1, append: true);
  }

  /// Changes the transaction-type filter and reloads from page 1.
  Future<void> setTxFilter(CashTransactionType? type) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        txFilter: type,
        areTransactionsLoading: state.transactions.isEmpty,
        isLoadingMore: false,
        failure: null,
        currentPage: 1,
      ),
    );
    await _fetchTransactions(reset: true);
  }

  /// Changes the date-range filter and reloads from page 1.
  Future<void> setDateRange({String? from, String? to}) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        fromDate: from,
        toDate: to,
        areTransactionsLoading: state.transactions.isEmpty,
        isLoadingMore: false,
        failure: null,
        currentPage: 1,
      ),
    );
    await _fetchTransactions(reset: true);
  }

  /// Clears transaction-type and date-range filters.
  Future<void> clearFilters() async {
    if (isClosed) return;
    emit(
      state.copyWith(
        txFilter: null,
        fromDate: null,
        toDate: null,
        areTransactionsLoading: state.transactions.isEmpty,
        isLoadingMore: false,
        failure: null,
        currentPage: 1,
      ),
    );
    await _fetchTransactions(reset: true);
  }

  Future<void> _fetchTransactions({
    bool reset = false,
    int page = 1,
    bool append = false,
  }) async {
    if (isClosed || state.hasNoBox) return;
    if (reset) {
      emit(
        state.copyWith(
          areTransactionsLoading: state.transactions.isEmpty,
          isLoadingMore: false,
          failure: null,
          currentPage: 1,
        ),
      );
    } else if (append) {
      emit(state.copyWith(isLoadingMore: true, failure: null));
    }

    final result = await repository.fetchTransactions(
      transactionType: state.txFilter,
      fromDate: state.fromDate,
      toDate: state.toDate,
      page: reset ? 1 : page,
    );
    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          areTransactionsLoading: false,
          isRefreshing: false,
          isLoadingMore: false,
          failure: failure,
        ),
      ),
      (pageResult) {
        final list = append
            ? [...state.transactions, ...pageResult.transactions]
            : pageResult.transactions;
        emit(
          state.copyWith(
            areTransactionsLoading: false,
            isRefreshing: false,
            isLoadingMore: false,
            transactions: list,
            currentPage: pageResult.currentPage,
            lastPage: pageResult.lastPage,
            hasMore: pageResult.hasMore,
            failure: null,
          ),
        );
      },
    );
  }

  // ---- Statistics ------------------------------------------------------- //

  Future<void> _fetchStatistics() async {
    if (isClosed || state.hasNoBox) return;
    emit(state.copyWith(isLoadingStatistics: true, failure: null));
    final result = await repository.fetchStatistics();
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingStatistics: false,
          failure: failure,
        ),
      ),
      (statistics) => emit(
        state.copyWith(
          isLoadingStatistics: false,
          statistics: statistics,
          failure: null,
        ),
      ),
    );
  }

  /// Clears the transient action/failure signal after the UI has reacted.
  void clearAction() {
    if (isClosed) return;
    if (state.lastAction != null || state.failure != null) {
      emit(state.copyWith(lastAction: null, failure: null));
    }
  }

  /// The backend returns 404 when the pharmacy has no cash box yet.
  bool _isNotFound(Failure failure) {
    // UnknownFailure is what the API error handler maps a 404 response to when
    // no dedicated Failure exists for it.
    return failure is UnknownFailure;
  }
}
