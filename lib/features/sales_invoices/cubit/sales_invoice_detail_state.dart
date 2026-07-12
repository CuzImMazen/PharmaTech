import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';

part 'sales_invoice_detail_state.freezed.dart';

/// Outcome of a detail-screen mutation, surfaced via BlocListener.
enum SalesInvoiceDetailAction { cancelled, notesUpdated }

@freezed
sealed class SalesInvoiceDetailState with _$SalesInvoiceDetailState {
  const factory SalesInvoiceDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default(false) bool isCancelling,
    SalesInvoiceModel? invoice,
    Failure? failure,
    SalesInvoiceDetailAction? lastAction,
  }) = _SalesInvoiceDetailState;
}
