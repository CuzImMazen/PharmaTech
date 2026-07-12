import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/cubit/sales_invoice_state.dart';
import 'package:pharmacy_app/features/sales_invoices/data/repo/sales_invoice_repository.dart';

/// Drives the Sales Invoices list screen: paginated fetch with customer,
/// status, payment-status, and date-range filters, plus a cancel mutation.
class SalesInvoiceCubit extends Cubit<SalesInvoiceState> {
  SalesInvoiceCubit({required this.repository})
      : super(const SalesInvoiceState());

  final SalesInvoiceRepository repository;

  /// Initial load.
  Future<void> loadSalesInvoices() => _fetch(reset: true);

  /// Pull-to-refresh / retry.
  Future<void> refresh() => _fetch(reset: true, forceRefresh: true);

  /// Infinite-scroll next page.
  Future<void> loadNextPage() async {
    if (state.isInitialLoading || state.isLoadingMore || !state.hasMore) return;
    await _fetch(page: state.currentPage + 1, append: true);
  }

  // ---- Filters ---------------------------------------------------------- //

  Future<void> setCustomerFilter(int? customerId) async {
    emit(state.copyWith(customerIdFilter: customerId));
    await _fetch(reset: true);
  }

  Future<void> setStatusFilter(InvoiceStatus? status) async {
    emit(state.copyWith(statusFilter: status));
    await _fetch(reset: true);
  }

  Future<void> setPaymentStatusFilter(InvoicePaymentStatus? status) async {
    emit(state.copyWith(paymentStatusFilter: status));
    await _fetch(reset: true);
  }

  Future<void> setDateRange({String? from, String? to}) async {
    emit(state.copyWith(fromDate: from, toDate: to));
    await _fetch(reset: true);
  }

  Future<void> clearFilters() async {
    emit(
      state.copyWith(
        customerIdFilter: null,
        statusFilter: null,
        paymentStatusFilter: null,
        fromDate: null,
        toDate: null,
      ),
    );
    await _fetch(reset: true);
  }

  bool get hasActiveFilters =>
      state.customerIdFilter != null ||
      state.statusFilter != null ||
      state.paymentStatusFilter != null ||
      state.fromDate != null ||
      state.toDate != null;

  // ---- Mutation -------------------------------------------------------- //

  Future<void> cancelSalesInvoice(int id) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        mutatingId: id,
        failure: null,
        lastAction: null,
      ),
    );
    final result = await repository.cancelSalesInvoice(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(mutatingId: null, failure: failure)),
      (_) {
        emit(
          state.copyWith(
            mutatingId: null,
            lastAction: SalesInvoiceActionResult.cancelled,
          ),
        );
        // Cancellation changes server state (status, stock, debt) — refresh.
        _fetch(reset: true);
      },
    );
  }

  /// Clears the transient action/failure signal after the UI has reacted.
  void clearAction() {
    if (isClosed) return;
    if (state.lastAction != null || state.failure != null) {
      emit(state.copyWith(lastAction: null, failure: null));
    }
  }

  Future<void> _fetch({
    bool reset = false,
    bool forceRefresh = false,
    int page = 1,
    bool append = false,
  }) async {
    if (isClosed) return;

    if (reset) {
      final firstLoad = state.invoices.isEmpty;
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

    final result = await repository.fetchSalesInvoices(
      customerId: state.customerIdFilter,
      status: state.statusFilter,
      paymentStatus: state.paymentStatusFilter,
      fromDate: state.fromDate,
      toDate: state.toDate,
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
            ? [...state.invoices, ...pageResult.invoices]
            : pageResult.invoices;
        emit(
          state.copyWith(
            isInitialLoading: false,
            isRefreshing: false,
            isLoadingMore: false,
            invoices: list,
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
