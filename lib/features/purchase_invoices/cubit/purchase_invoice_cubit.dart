import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/purchase_invoices/cubit/purchase_invoice_state.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/repo/purchase_invoice_repository.dart';

/// Drives the Purchase Invoices list screen: paginated fetch with supplier,
/// status, payment-status, and date-range filters, plus a cancel mutation.
class PurchaseInvoiceCubit extends Cubit<PurchaseInvoiceState> {
  PurchaseInvoiceCubit({required this.repository})
      : super(const PurchaseInvoiceState());

  final PurchaseInvoiceRepository repository;

  /// Initial load.
  Future<void> loadInvoices() => _fetch(reset: true);

  /// Pull-to-refresh / retry.
  Future<void> refresh() => _fetch(reset: true, forceRefresh: true);

  /// Infinite-scroll next page.
  Future<void> loadNextPage() async {
    if (state.isInitialLoading || state.isLoadingMore || !state.hasMore) return;
    await _fetch(page: state.currentPage + 1, append: true);
  }

  // ---- Filters ---------------------------------------------------------- //

  Future<void> setSupplierFilter(int? supplierId) async {
    emit(state.copyWith(supplierIdFilter: supplierId));
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
        supplierIdFilter: null,
        statusFilter: null,
        paymentStatusFilter: null,
        fromDate: null,
        toDate: null,
      ),
    );
    await _fetch(reset: true);
  }

  bool get hasActiveFilters =>
      state.supplierIdFilter != null ||
      state.statusFilter != null ||
      state.paymentStatusFilter != null ||
      state.fromDate != null ||
      state.toDate != null;

  // ---- Mutation -------------------------------------------------------- //

  Future<void> cancelInvoice(int id) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        mutatingId: id,
        failure: null,
        lastAction: null,
      ),
    );
    final result = await repository.cancelInvoice(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(mutatingId: null, failure: failure)),
      (_) {
        emit(
          state.copyWith(
            mutatingId: null,
            lastAction: InvoiceActionResult.cancelled,
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

    final result = await repository.fetchInvoices(
      supplierId: state.supplierIdFilter,
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
