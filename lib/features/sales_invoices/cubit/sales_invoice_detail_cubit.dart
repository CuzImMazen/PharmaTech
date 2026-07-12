import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/sales_invoices/cubit/sales_invoice_detail_state.dart';
import 'package:pharmacy_app/features/sales_invoices/data/repo/sales_invoice_repository.dart';

/// Loads a single sales invoice (with items + customer debt) and handles the
/// cancel + notes-update mutations for the detail screen.
class SalesInvoiceDetailCubit extends Cubit<SalesInvoiceDetailState> {
  SalesInvoiceDetailCubit({required this.repository})
      : super(const SalesInvoiceDetailState());

  final SalesInvoiceRepository repository;

  Future<void> loadSalesInvoice(int id) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, failure: null));
    final result = await repository.fetchSalesInvoice(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (invoice) => emit(state.copyWith(isLoading: false, invoice: invoice)),
    );
  }

  Future<void> refresh(int id) async {
    if (isClosed) return;
    emit(state.copyWith(isRefreshing: true));
    final result = await repository.fetchSalesInvoice(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isRefreshing: false, failure: failure)),
      (invoice) =>
          emit(state.copyWith(isRefreshing: false, invoice: invoice)),
    );
  }

  Future<void> cancelSalesInvoice(int id) async {
    if (isClosed || state.isCancelling) return;
    emit(state.copyWith(isCancelling: true, failure: null, lastAction: null));
    final result = await repository.cancelSalesInvoice(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(isCancelling: false, failure: failure),
      ),
      (invoice) => emit(
        state.copyWith(
          isCancelling: false,
          invoice: invoice,
          lastAction: SalesInvoiceDetailAction.cancelled,
        ),
      ),
    );
  }

  Future<void> updateNotes(int id, String? notes) async {
    if (isClosed) return;
    emit(state.copyWith(failure: null, lastAction: null));
    final body = <String, dynamic>{
      if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
    };
    final result = await repository.updateSalesInvoiceNotes(id, body);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(failure: failure)),
      (invoice) => emit(
        state.copyWith(
          invoice: invoice,
          lastAction: SalesInvoiceDetailAction.notesUpdated,
        ),
      ),
    );
  }

  void clearAction() {
    if (isClosed) return;
    if (state.lastAction != null || state.failure != null) {
      emit(state.copyWith(lastAction: null, failure: null));
    }
  }
}
