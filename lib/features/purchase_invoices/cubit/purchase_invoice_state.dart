import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';

part 'purchase_invoice_state.freezed.dart';

/// Outcome of an invoice mutation, surfaced to the UI via BlocListener.
enum InvoiceActionResult { cancelled }

@freezed
sealed class PurchaseInvoiceState with _$PurchaseInvoiceState {
  const factory PurchaseInvoiceState({
    @Default(<PurchaseInvoiceModel>[])
    List<PurchaseInvoiceModel> invoices,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,

    // Filters
    int? supplierIdFilter,
    InvoiceStatus? statusFilter,
    InvoicePaymentStatus? paymentStatusFilter,
    String? fromDate,
    String? toDate,

    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    Failure? failure,
    InvoiceActionResult? lastAction,
    int? mutatingId,
  }) = _PurchaseInvoiceState;
}
