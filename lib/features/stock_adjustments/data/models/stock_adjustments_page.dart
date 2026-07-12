import 'package:pharmacy_app/features/inventory/data/models/stock_movement_model.dart';

/// A page of stock-adjustment movements plus its pagination meta (mirrors
/// `SupplierDebtsPage` and the Laravel `{data, links, meta}` wrapper).
///
/// The backend `GET /stock-adjustments` returns a paginated
/// `StockMovementResource` collection already filtered to
/// `adjustment_in`/`adjustment_out`, so each item is a [StockMovementModel].
class StockAdjustmentsPage {
  StockAdjustmentsPage({
    required this.adjustments,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<StockMovementModel> adjustments;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
