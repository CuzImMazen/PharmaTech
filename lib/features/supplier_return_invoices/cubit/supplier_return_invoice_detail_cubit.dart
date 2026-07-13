import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/cubit/supplier_return_invoice_detail_state.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/repo/supplier_return_invoice_repository.dart';

/// Loads a single supplier return invoice (with items + supplier) and handles
/// the cancel mutation for the detail screen.
class SupplierReturnInvoiceDetailCubit
    extends Cubit<SupplierReturnInvoiceDetailState> {
  SupplierReturnInvoiceDetailCubit({required this.repository})
      : super(const SupplierReturnInvoiceDetailState());

  final SupplierReturnInvoiceRepository repository;

  Future<void> loadReturn(int id) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, failure: null));
    final result = await repository.fetchReturn(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (invoice) =>
          emit(state.copyWith(isLoading: false, returnInvoice: invoice)),
    );
  }

  Future<void> refresh(int id) async {
    if (isClosed) return;
    emit(state.copyWith(isRefreshing: true));
    final result = await repository.fetchReturn(id);
    if (isClosed) return;
    result.fold(
      (failure) =>
          emit(state.copyWith(isRefreshing: false, failure: failure)),
      (invoice) => emit(
        state.copyWith(isRefreshing: false, returnInvoice: invoice),
      ),
    );
  }

  Future<void> cancelReturn(int id) async {
    if (isClosed || state.isCancelling) return;
    emit(state.copyWith(isCancelling: true, failure: null, lastAction: null));
    final result = await repository.cancelReturn(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isCancelling: false, failure: failure)),
      (invoice) => emit(
        state.copyWith(
          isCancelling: false,
          returnInvoice: invoice,
          lastAction: SupplierReturnDetailAction.cancelled,
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
