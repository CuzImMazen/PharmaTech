import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/purchase_invoices/cubit/purchase_invoice_detail_state.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/repo/purchase_invoice_repository.dart';

/// Loads a single purchase invoice (with items + supplier debt + payments) and
/// handles the cancel + notes-update mutations for the detail screen.
class PurchaseInvoiceDetailCubit extends Cubit<PurchaseInvoiceDetailState> {
  PurchaseInvoiceDetailCubit({required this.repository})
      : super(const PurchaseInvoiceDetailState());

  final PurchaseInvoiceRepository repository;

  Future<void> loadInvoice(int id) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, failure: null));
    final result = await repository.fetchInvoice(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (invoice) => emit(state.copyWith(isLoading: false, invoice: invoice)),
    );
  }

  Future<void> refresh(int id) async {
    if (isClosed) return;
    emit(state.copyWith(isRefreshing: true));
    final result = await repository.fetchInvoice(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isRefreshing: false, failure: failure)),
      (invoice) =>
          emit(state.copyWith(isRefreshing: false, invoice: invoice)),
    );
  }

  Future<void> cancelInvoice(int id) async {
    if (isClosed || state.isCancelling) return;
    emit(state.copyWith(isCancelling: true, failure: null, lastAction: null));
    final result = await repository.cancelInvoice(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(isCancelling: false, failure: failure),
      ),
      (invoice) => emit(
        state.copyWith(
          isCancelling: false,
          invoice: invoice,
          lastAction: InvoiceDetailAction.cancelled,
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
    final result = await repository.updateInvoiceNotes(id, body);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(failure: failure)),
      (invoice) => emit(
        state.copyWith(
          invoice: invoice,
          lastAction: InvoiceDetailAction.notesUpdated,
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
