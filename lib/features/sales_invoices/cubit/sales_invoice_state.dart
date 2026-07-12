import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';

part 'sales_invoice_state.freezed.dart';

/// Outcome of a sales-invoice mutation, surfaced to the UI via BlocListener.
enum SalesInvoiceActionResult { cancelled }

@freezed
sealed class SalesInvoiceState with _$SalesInvoiceState {
  const factory SalesInvoiceState({
    @Default(<SalesInvoiceModel>[])
    List<SalesInvoiceModel> invoices,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,

    // Filters
    int? customerIdFilter,
    InvoiceStatus? statusFilter,
    InvoicePaymentStatus? paymentStatusFilter,
    String? fromDate,
    String? toDate,

    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    Failure? failure,
    SalesInvoiceActionResult? lastAction,
    int? mutatingId,
  }) = _SalesInvoiceState;
}
