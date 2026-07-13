import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/customer_debts/cubit/customer_debt_state.dart';
import 'package:pharmacy_app/features/customer_debts/data/models/customer_debt_model.dart';
import 'package:pharmacy_app/features/customer_debts/data/repo/customer_debt_repository.dart';

/// Drives the Customer Debts list screen: paginated fetch with customer +
/// status filters. Read-only — payments are recorded from the detail screen.
class CustomerDebtCubit extends Cubit<CustomerDebtState> {
  CustomerDebtCubit({required this.repository})
    : super(const CustomerDebtState());

  final CustomerDebtRepository repository;

  /// Initial load.
  Future<void> loadDebts() => _fetch(reset: true);

  /// Pull-to-refresh / retry.
  Future<void> refresh() => _fetch(reset: true, forceRefresh: true);

  /// Infinite-scroll next page.
  Future<void> loadNextPage() async {
    if (state.isInitialLoading || state.isLoadingMore || !state.hasMore) return;
    await _fetch(page: state.currentPage + 1, append: true);
  }

  /// Changes the customer filter and reloads from page 1.
  Future<void> setCustomerFilter(int? customerId) async {
    emit(state.copyWith(customerIdFilter: customerId));
    await _fetch(reset: true);
  }

  /// Changes the status filter and reloads from page 1.
  Future<void> setStatusFilter(CustomerDebtStatus? status) async {
    emit(state.copyWith(statusFilter: status));
    await _fetch(reset: true);
  }

  /// Clears both filters and reloads.
  Future<void> clearFilters() async {
    emit(state.copyWith(customerIdFilter: null, statusFilter: null));
    await _fetch(reset: true);
  }

  Future<void> _fetch({
    bool reset = false,
    bool forceRefresh = false,
    int page = 1,
    bool append = false,
  }) async {
    if (isClosed) return;

    if (reset) {
      final firstLoad = state.debts.isEmpty;
      emit(
        state.copyWith(
          isInitialLoading: firstLoad,
          isRefreshing: !firstLoad || forceRefresh,
          isLoadingMore: false,
          failure: null,
          currentPage: 1,
        ),
      );
    } else if (append) {
      emit(state.copyWith(isLoadingMore: true, failure: null));
    }

    final result = await repository.fetchDebts(
      customerId: state.customerIdFilter,
      status: state.statusFilter,
      page: reset ? 1 : page,
    );
    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isInitialLoading: false,
          isRefreshing: false,
          isLoadingMore: false,
          failure: failure,
        ),
      ),
      (pageResult) {
        final list = append
            ? [...state.debts, ...pageResult.debts]
            : pageResult.debts;
        emit(
          state.copyWith(
            isInitialLoading: false,
            isRefreshing: false,
            isLoadingMore: false,
            debts: list,
            currentPage: pageResult.currentPage,
            lastPage: pageResult.lastPage,
            hasMore: pageResult.hasMore,
            failure: null,
          ),
        );
      },
    );
  }
}
