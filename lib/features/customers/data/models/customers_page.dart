import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';

/// A page of customers plus its pagination meta (mirrors
/// `InventoryProductsPage` and the Laravel `{data, links, meta}` wrapper).
class CustomersPage {
  CustomersPage({
    required this.customers,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<CustomerModel> customers;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
