import 'package:pharmacy_app/features/supplier_return_invoices/data/models/supplier_return_invoice_model.dart';

/// A page of supplier return invoices plus its pagination meta (mirrors
/// `PurchaseInvoicesPage` and the Laravel `{data, links, meta}` wrapper).
class SupplierReturnInvoicesPage {
  SupplierReturnInvoicesPage({
    required this.returns,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<SupplierReturnInvoiceModel> returns;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
