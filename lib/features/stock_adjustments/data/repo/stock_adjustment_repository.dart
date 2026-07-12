import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/stock_adjustments/data/models/stock_adjustments_page.dart';

/// Read-only data source for the Stock Adjustments log. Adjustments are
/// created server-side from `POST /stock-adjustments` (manual stock add /
/// remove); this repo only lists them pharmacy-wide via
/// `GET /stock-adjustments` (a `StockMovementResource` collection filtered to
/// `adjustment_in`/`adjustment_out`).
abstract class StockAdjustmentRepository {
  /// Paginated list of the pharmacy's manual stock adjustments (newest first).
  Future<Either<Failure, StockAdjustmentsPage>> fetchAdjustments({
    int page = 1,
    int perPage = 15,
  });
}
