import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';

/// A page of purchase invoices plus its pagination meta (mirrors
/// `SuppliersPage` and the Laravel `{data, links, meta}` wrapper).
class PurchaseInvoicesPage {
  PurchaseInvoicesPage({
    required this.invoices,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<PurchaseInvoiceModel> invoices;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
