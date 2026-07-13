import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/models/supplier_return_invoice_model.dart';

part 'supplier_return_invoice_detail_state.freezed.dart';

/// Outcome of a detail-screen mutation, surfaced via BlocListener.
enum SupplierReturnDetailAction { cancelled }

@freezed
sealed class SupplierReturnInvoiceDetailState
    with _$SupplierReturnInvoiceDetailState {
  const factory SupplierReturnInvoiceDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default(false) bool isCancelling,
    SupplierReturnInvoiceModel? returnInvoice,
    Failure? failure,
    SupplierReturnDetailAction? lastAction,
  }) = _SupplierReturnInvoiceDetailState;
}
