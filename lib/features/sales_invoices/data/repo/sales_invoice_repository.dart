import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoices_page.dart';

/// Data source for the Sales Invoices feature.
abstract class SalesInvoiceRepository {
  /// Paginated list of the pharmacy's sales invoices. Filters: customer,
  /// invoice status, payment status, and invoice-date range.
  Future<Either<Failure, SalesInvoicesPage>> fetchSalesInvoices({
    int? customerId,
    InvoiceStatus? status,
    InvoicePaymentStatus? paymentStatus,
    String? fromDate,
    String? toDate,
    int page = 1,
    int perPage = 15,
  });

  /// Single invoice with `items[].product` + `customer_debt` loaded.
  Future<Either<Failure, SalesInvoiceModel>> fetchSalesInvoice(int id);

  /// Creates a sales invoice. [body] is the snake_case payload:
  /// `{customer_id?, invoice_date, payment_method, amount_paid, due_date?,
  /// notes?, items[]: {product_id, quantity, selling_price, tax?, discount?}}`.
  /// On the backend this also decrements stock (FIFO), optionally records a
  /// cash-box `sale_in`, and creates a customer debt when not fully paid.
  Future<Either<Failure, SalesInvoiceModel>> createSalesInvoice(
    Map<String, dynamic> body,
  );

  /// Updates an invoice's notes only (`PUT /sales-invoices/{id}`).
  Future<Either<Failure, SalesInvoiceModel>> updateSalesInvoiceNotes(
    int id,
    Map<String, dynamic> body,
  );

  /// Cancels an invoice (`PATCH /sales-invoices/{id}/cancel`). Reverses the
  /// stock decrement, refunds any cash paid, and cancels the linked debt.
  Future<Either<Failure, SalesInvoiceModel>> cancelSalesInvoice(int id);
}
