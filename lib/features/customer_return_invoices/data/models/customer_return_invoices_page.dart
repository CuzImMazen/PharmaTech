import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoice_model.dart';

/// A page of customer return invoices plus its pagination meta (mirrors
/// `SalesInvoicesPage` and the Laravel `{data, links, meta}` wrapper).
class CustomerReturnInvoicesPage {
  CustomerReturnInvoicesPage({
    required this.returns,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<CustomerReturnInvoiceModel> returns;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
