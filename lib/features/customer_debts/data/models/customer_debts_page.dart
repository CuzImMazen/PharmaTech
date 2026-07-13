import 'package:pharmacy_app/features/customer_debts/data/models/customer_debt_model.dart';

/// A page of customer debts plus its pagination meta (mirrors
/// `SupplierDebtsPage` and the Laravel `{data, links, meta}` wrapper).
class CustomerDebtsPage {
  CustomerDebtsPage({
    required this.debts,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<CustomerDebtModel> debts;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
