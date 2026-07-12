import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';

/// A page of suppliers plus its pagination meta (mirrors
/// `InventoryProductsPage` and the Laravel `{data, links, meta}` wrapper).
class SuppliersPage {
  SuppliersPage({
    required this.suppliers,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<SupplierModel> suppliers;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
