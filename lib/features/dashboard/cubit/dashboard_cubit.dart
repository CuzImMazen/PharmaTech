import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_state.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_cards_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_header_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_transaction_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_transactions_page.dart';
import 'package:pharmacy_app/features/dashboard/data/models/weekly_revenue_point_model.dart';
import 'package:pharmacy_app/features/dashboard/data/repo/dashboard_repository.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';

/// Drives the Dashboard by aggregating real backend data:
/// - today's header stats via `GET /dashboard/header`
/// - summary cards via `GET /dashboard/cards`
/// - weekly revenue chart via `GET /dashboard/weekly-revenue`
/// - recent transactions via `GET /dashboard/transactions`
/// - low-stock alerts via `GET /products/low-stock`
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required this.dashboardRepository,
    required this.inventoryRepository,
  }) : super(const DashboardState());

  final DashboardRepository dashboardRepository;
  final InventoryRepository inventoryRepository;

  /// Loads all dashboard sections in parallel.
  ///
  /// - On first load, shows the shimmer via [isInitialLoading].
  /// - On refresh, keeps existing data visible via [isRefreshing].
  /// - If some endpoints fail, whatever succeeded is preserved and the first
  ///   failure is surfaced in [failure]. This prevents the "error-first"
  ///   flash when a transient error resolves on the next poll/pull.
  Future<void> loadDashboard() async {
    if (isClosed) return;

    final isFirstLoad =
        state.header == null &&
        state.cards == null &&
        state.weeklyRevenue.isEmpty &&
        state.recentTransactions.isEmpty;

    emit(
      state.copyWith(
        isInitialLoading: isFirstLoad,
        isRefreshing: !isFirstLoad,
        failure: null,
      ),
    );

    final results = await Future.wait([
      dashboardRepository.fetchHeader(),
      dashboardRepository.fetchCards(),
      dashboardRepository.fetchWeeklyRevenue(),
      dashboardRepository.fetchTransactions(perPage: 5),
      inventoryRepository.fetchLowStock(perPage: 100),
    ]);

    if (isClosed) return;

    final headerResult = results[0] as Either<Failure, DashboardHeaderModel>;
    final cardsResult = results[1] as Either<Failure, DashboardCardsModel>;
    final weeklyRevenueResult =
        results[2] as Either<Failure, List<WeeklyRevenuePointModel>>;
    final transactionsPageResult =
        results[3] as Either<Failure, DashboardTransactionsPage>;
    final lowStockResult =
        results[4] as Either<Failure, List<ProductCardModel>>;

    final firstFailure = _firstFailure([
      headerResult,
      cardsResult,
      weeklyRevenueResult,
      transactionsPageResult,
      lowStockResult,
    ]);

    emit(
      state.copyWith(
        isInitialLoading: false,
        isRefreshing: false,
        header: _rightOrNull(headerResult) ?? state.header,
        cards: _rightOrNull(cardsResult) ?? state.cards,
        weeklyRevenue: _rightOrEmpty(weeklyRevenueResult, state.weeklyRevenue),
        recentTransactions: _pageTransactionsOrEmpty(
          transactionsPageResult,
          state.recentTransactions,
        ),
        lowStockProducts: _rightOrEmpty(lowStockResult, state.lowStockProducts),
        failure: firstFailure,
      ),
    );
  }

  /// Alias for [loadDashboard] to use in pull-to-refresh contexts.
  Future<void> refresh() => loadDashboard();

  /// Refreshes only the header section.
  Future<void> refreshHeader() async {
    if (isClosed) return;
    final result = await dashboardRepository.fetchHeader();
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(failure: state.failure ?? failure)),
      (header) => emit(
        state.copyWith(
          header: header,
          failure: state.failure,
        ),
      ),
    );
  }

  /// Refreshes only the summary cards section.
  Future<void> refreshCards() async {
    if (isClosed) return;
    final result = await dashboardRepository.fetchCards();
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(failure: state.failure ?? failure)),
      (cards) => emit(
        state.copyWith(
          cards: cards,
          failure: state.failure,
        ),
      ),
    );
  }

  /// Refreshes only the weekly revenue chart section.
  Future<void> refreshWeeklyRevenue() async {
    if (isClosed) return;
    final result = await dashboardRepository.fetchWeeklyRevenue();
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(failure: state.failure ?? failure)),
      (points) => emit(
        state.copyWith(
          weeklyRevenue: points,
          failure: state.failure,
        ),
      ),
    );
  }

  /// Refreshes only the recent transactions section.
  Future<void> refreshTransactions() async {
    if (isClosed) return;
    final result = await dashboardRepository.fetchTransactions(perPage: 5);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(failure: state.failure ?? failure)),
      (page) => emit(
        state.copyWith(
          recentTransactions: page.transactions,
          failure: state.failure,
        ),
      ),
    );
  }

  /// Clears the transient failure after the UI has shown it.
  void clearFailure() {
    if (isClosed) return;
    if (state.failure != null) emit(state.copyWith(failure: null));
  }

  /// Refreshes only the low-stock alerts section without disturbing the rest of
  /// the dashboard.
  Future<void> refreshLowStock() async {
    if (isClosed) return;
    final result = await inventoryRepository.fetchLowStock(perPage: 100);
    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(failure: state.failure ?? failure)),
      (products) => emit(
        state.copyWith(lowStockProducts: products, failure: state.failure),
      ),
    );
  }

  Failure? _firstFailure(List<Either<Failure, dynamic>> results) {
    for (final result in results) {
      final failure = result.fold((f) => f, (_) => null);
      if (failure != null) return failure;
    }
    return null;
  }

  T? _rightOrNull<T>(Either<Failure, T> result) {
    return result.fold((_) => null, (data) => data);
  }

  List<T> _rightOrEmpty<T>(Either<Failure, List<T>> result, List<T> fallback) {
    return result.fold((_) => fallback, (data) => data);
  }

  List<DashboardTransactionModel> _pageTransactionsOrEmpty(
    Either<Failure, DashboardTransactionsPage> result,
    List<DashboardTransactionModel> fallback,
  ) {
    return result.fold((_) => fallback, (page) => page.transactions);
  }

  /// Derives a [StockAlertType] from a product's quantities, mirroring the
  /// backend severity logic in `ProductController::lowStock`:
  /// out (no active stock) / critical (min_stock >= stock*4) / low otherwise.
  StockAlertType severityFor(ProductCardModel product) {
    final qty = product.quantity;
    final min = product.minStock;
    if (qty <= 0) return StockAlertType.out;
    if (min > 0 && qty * 4 <= min) return StockAlertType.critical;
    return StockAlertType.low;
  }
}
