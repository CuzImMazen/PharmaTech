import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoices_page.dart';

/// Data source for the Purchase Invoices feature.
abstract class PurchaseInvoiceRepository {
  /// Paginated list of the pharmacy's purchase invoices. Filters: supplier,
  /// invoice status, payment status, and invoice-date range.
  Future<Either<Failure, PurchaseInvoicesPage>> fetchInvoices({
    int? supplierId,
    InvoiceStatus? status,
    InvoicePaymentStatus? paymentStatus,
    String? fromDate,
    String? toDate,
    int page = 1,
    int perPage = 15,
  });

  /// Single invoice with `items[].product` + `supplier_debt.payments` loaded.
  Future<Either<Failure, PurchaseInvoiceModel>> fetchInvoice(int id);

  /// Creates an invoice. [body] is the snake_case payload:
  /// `{supplier_id, invoice_date, payment_method, amount_paid, notes?, items[]}`.
  /// On the backend this also creates stock batches + movements + an optional
  /// supplier debt. Returns the full created resource (201).
  Future<Either<Failure, PurchaseInvoiceModel>> createInvoice(
    Map<String, dynamic> body,
  );

  /// Updates an invoice's notes only (`PUT /purchase-invoices/{id}`).
  Future<Either<Failure, PurchaseInvoiceModel>> updateInvoiceNotes(
    int id,
    Map<String, dynamic> body,
  );

  /// Cancels an invoice (`PATCH /purchase-invoices/{id}/cancel`). Reverses the
  /// stock batches, refunds any cash paid, and cancels the linked debt.
  Future<Either<Failure, PurchaseInvoiceModel>> cancelInvoice(int id);
}
