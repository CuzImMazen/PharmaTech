import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/models/supplier_return_invoice_model.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/models/supplier_return_invoices_page.dart';

/// Data source for the Supplier Return Invoices feature.
abstract class SupplierReturnInvoiceRepository {
  /// Paginated list of the pharmacy's supplier return invoices.
  Future<Either<Failure, SupplierReturnInvoicesPage>> fetchReturns({
    int page = 1,
    int perPage = 15,
  });

  /// Single return invoice with `items[].product` + `supplier` loaded.
  Future<Either<Failure, SupplierReturnInvoiceModel>> fetchReturn(int id);

  /// Creates a return invoice. [body] is the snake_case payload:
  /// `{supplier_id, original_purchase_invoice_id?, invoice_date,
  /// refund_method, reason?, notes?, items[]}`. Returns the full created
  /// resource (201).
  Future<Either<Failure, SupplierReturnInvoiceModel>> createReturn(
    Map<String, dynamic> body,
  );

  /// Cancels a return invoice (`PATCH /supplier-return-invoices/{id}/cancel`).
  /// Reverses the stock effect of the return.
  Future<Either<Failure, SupplierReturnInvoiceModel>> cancelReturn(int id);
}
