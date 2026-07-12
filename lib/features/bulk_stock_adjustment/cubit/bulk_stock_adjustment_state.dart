import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';

part 'bulk_stock_adjustment_state.freezed.dart';

/// Direction of a bulk adjustment line item. `add` creates a new batch;
/// `remove` draws down an existing batch.
enum BulkAdjustmentType { add, remove }

/// Holds the dynamic line-items + product dropdown options for the Bulk Stock
/// Adjustment form. Text-field values (quantity, prices, batch number, notes)
/// live in controllers in the form widget; this holds the structural state
/// (the items list, the loaded products, and the transient save outcome).
@freezed
abstract class BulkStockAdjustmentState with _$BulkStockAdjustmentState {
  const factory BulkStockAdjustmentState({
    @Default(<ProductCardModel>[]) List<ProductCardModel> products,
    @Default(false) bool isProductsLoading,
    @Default(false) bool hasProductsError,

    @Default(<BulkAdjustmentItemInput>[])
    List<BulkAdjustmentItemInput> items,

    /// Per-row validation errors surfaced inline (index → message). Cleared on
    /// the next edit / submit attempt. Not a [Failure] — validation is local.
    @Default(<int, String>{}) Map<int, String> rowErrors,

    @Default(false) bool isSubmitting,
    Failure? failure,
    @Default(false) bool saved,
  }) = _BulkStockAdjustmentState;
}

/// One editable line item in the Bulk Stock Adjustment form. Fields that only
/// apply to one direction are kept but ignored when building the body for the
/// other direction (e.g. `selectedBatch`/`batches` are ignored for `add` rows;
/// `purchasePrice`/`sellingPrice`/`batchNumber`/`expiryDate` are ignored for
/// `remove` rows).
@freezed
abstract class BulkAdjustmentItemInput with _$BulkAdjustmentItemInput {
  const factory BulkAdjustmentItemInput({
    @Default(BulkAdjustmentType.add) BulkAdjustmentType type,
    ProductCardModel? product,
    @Default('') String quantity,
    // add-only fields
    @Default('') String purchasePrice,
    @Default('') String sellingPrice,
    @Default('') String batchNumber,
    @Default('') String expiryDate,
    // remove-only fields
    StockBatchModel? selectedBatch,
    @Default(<StockBatchModel>[]) List<StockBatchModel> batches,
    @Default(false) bool isBatchesLoading,
    // shared optional
    @Default('') String notes,
    @Default(true) bool expanded,
  }) = _BulkAdjustmentItemInput;
}
