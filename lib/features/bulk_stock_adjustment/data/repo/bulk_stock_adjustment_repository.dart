import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';

/// Data source for bulk manual stock adjustments. The backend endpoint
/// `POST /stock-adjustments/bulk` accepts a single body `{items: [...]}` and
/// applies every item atomically inside one DB transaction (all-or-nothing).
/// Each item follows the same shape as a single `POST /stock-adjustments`:
///
/// - always: `adjustment_type` (`add`|`remove`), `product_id`, `quantity`.
/// - `add`: `purchase_price`, `selling_price`, optional `batch_number`,
///   `expiry_date`, `notes`.
/// - `remove`: `batch_id`, optional `notes`.
abstract class BulkStockAdjustmentRepository {
  /// Submits a batch of add/remove adjustments. On success every adjustment
  /// was committed; on failure (a 422 from the backend's per-item validation)
  /// nothing was committed and [Failure] carries the localized message.
  Future<Either<Failure, void>> bulkAdjustment(
    List<Map<String, dynamic>> items,
  );
}
