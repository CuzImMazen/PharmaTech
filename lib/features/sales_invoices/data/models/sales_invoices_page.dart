import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';

/// A page of sales invoices plus its pagination meta (mirrors
/// `PurchaseInvoicesPage` and the Laravel `{data, links, meta}` wrapper).
class SalesInvoicesPage {
  SalesInvoicesPage({
    required this.invoices,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<SalesInvoiceModel> invoices;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
