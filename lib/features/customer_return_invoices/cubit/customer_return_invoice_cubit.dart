import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/customer_return_invoices/cubit/customer_return_invoice_state.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/repo/customer_return_invoice_repository.dart';

/// Drives the Customer Return Invoices list screen: paginated fetch. Read-only
/// — mutations (cancel) are handled by the detail screen's cubit. Mirrors
/// [SupplierDebtCubit], the cleanest list-paginate example.
class CustomerReturnInvoiceCubit extends Cubit<CustomerReturnInvoiceState> {
  CustomerReturnInvoiceCubit({required this.repository})
      : super(const CustomerReturnInvoiceState());

  final CustomerReturnInvoiceRepository repository;

  /// Initial load.
  Future<void> loadReturns() => _fetch(reset: true);

  /// Pull-to-refresh / retry.
  Future<void> refresh() => _fetch(reset: true, forceRefresh: true);

  /// Infinite-scroll next page.
  Future<void> loadNextPage() async {
    if (state.isInitialLoading || state.isLoadingMore || !state.hasMore) return;
    await _fetch(page: state.currentPage + 1, append: true);
  }

  Future<void> _fetch({
    bool reset = false,
    bool forceRefresh = false,
    int page = 1,
    bool append = false,
  }) async {
    if (isClosed) return;

    if (reset) {
      final firstLoad = state.returns.isEmpty;
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

    final result = await repository.fetchReturns(page: reset ? 1 : page);
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
            ? [...state.returns, ...pageResult.returns]
            : pageResult.returns;
        emit(
          state.copyWith(
            isInitialLoading: false,
            isRefreshing: false,
            isLoadingMore: false,
            returns: list,
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
