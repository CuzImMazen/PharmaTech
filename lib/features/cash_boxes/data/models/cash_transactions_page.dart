import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transaction_model.dart';

/// A page of cash-box transactions plus its pagination meta (mirrors
/// `SuppliersPage` and the Laravel `{data, links, meta}` wrapper).
class CashTransactionsPage {
  CashTransactionsPage({
    required this.transactions,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<CashTransactionModel> transactions;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
