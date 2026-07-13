import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoice_model.dart';

part 'customer_return_invoice_detail_state.freezed.dart';

/// Outcome of a detail-screen mutation, surfaced via BlocListener.
enum CustomerReturnDetailAction { cancelled }

@freezed
sealed class CustomerReturnInvoiceDetailState
    with _$CustomerReturnInvoiceDetailState {
  const factory CustomerReturnInvoiceDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default(false) bool isCancelling,
    CustomerReturnInvoiceModel? returnInvoice,
    Failure? failure,
    CustomerReturnDetailAction? lastAction,
  }) = _CustomerReturnInvoiceDetailState;
}
