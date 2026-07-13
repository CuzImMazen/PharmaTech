import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoice_model.dart';

part 'customer_return_invoice_state.freezed.dart';

@freezed
sealed class CustomerReturnInvoiceState with _$CustomerReturnInvoiceState {
  const factory CustomerReturnInvoiceState({
    @Default(<CustomerReturnInvoiceModel>[])
    List<CustomerReturnInvoiceModel> returns,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    Failure? failure,
  }) = _CustomerReturnInvoiceState;
}
