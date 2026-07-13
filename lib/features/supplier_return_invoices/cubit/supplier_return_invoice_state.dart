import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/models/supplier_return_invoice_model.dart';

part 'supplier_return_invoice_state.freezed.dart';

@freezed
sealed class SupplierReturnInvoiceState with _$SupplierReturnInvoiceState {
  const factory SupplierReturnInvoiceState({
    @Default(<SupplierReturnInvoiceModel>[])
    List<SupplierReturnInvoiceModel> returns,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    Failure? failure,
  }) = _SupplierReturnInvoiceState;
}
