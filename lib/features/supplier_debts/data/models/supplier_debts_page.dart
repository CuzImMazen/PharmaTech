import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';

/// A page of supplier debts plus its pagination meta (mirrors
/// `SuppliersPage` and the Laravel `{data, links, meta}` wrapper).
class SupplierDebtsPage {
  SupplierDebtsPage({
    required this.debts,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<SupplierDebtModel> debts;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
