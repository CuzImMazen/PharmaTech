import 'package:pharmacy_app/features/dashboard/data/models/dashboard_transaction_model.dart';

/// A page of recent dashboard transactions plus its pagination meta
/// (mirrors `CashTransactionsPage` and the Laravel `{data, links, meta}` wrapper).
class DashboardTransactionsPage {
  DashboardTransactionsPage({
    required this.transactions,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<DashboardTransactionModel> transactions;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
