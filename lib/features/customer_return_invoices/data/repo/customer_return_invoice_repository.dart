import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoice_model.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoices_page.dart';

/// Data source for the Customer Return Invoices feature.
abstract class CustomerReturnInvoiceRepository {
  /// Paginated list of the pharmacy's customer return invoices.
  Future<Either<Failure, CustomerReturnInvoicesPage>> fetchReturns({
    int page = 1,
    int perPage = 15,
  });

  /// Single return invoice with `items[].product` + `customer` loaded.
  Future<Either<Failure, CustomerReturnInvoiceModel>> fetchReturn(int id);

  /// Creates a customer return invoice. [body] is the snake_case payload:
  /// `{customer_id?, original_sales_invoice_id?, invoice_date,
  /// refund_method, reason?, notes?, items[]: {product_id, quantity,
  /// unit_price, tax?, discount?}}`. On the backend this also reverses the
  /// sale's stock decrement (FIFO) and records a cash-box `return_out` when
  /// refunded in cash.
  Future<Either<Failure, CustomerReturnInvoiceModel>> createReturn(
    Map<String, dynamic> body,
  );

  /// Cancels a return invoice (`PATCH /customer-return-invoices/{id}/cancel`).
  /// Reverses the return's stock effect and any cash refund recorded.
  Future<Either<Failure, CustomerReturnInvoiceModel>> cancelReturn(int id);
}
