import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';

part 'purchase_invoice_detail_state.freezed.dart';

/// Outcome of a detail-screen mutation, surfaced via BlocListener.
enum InvoiceDetailAction { cancelled, notesUpdated }

@freezed
sealed class PurchaseInvoiceDetailState with _$PurchaseInvoiceDetailState {
  const factory PurchaseInvoiceDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default(false) bool isCancelling,
    PurchaseInvoiceModel? invoice,
    Failure? failure,
    InvoiceDetailAction? lastAction,
  }) = _PurchaseInvoiceDetailState;
}
