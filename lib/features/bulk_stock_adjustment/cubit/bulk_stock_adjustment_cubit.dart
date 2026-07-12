import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/bulk_stock_adjustment/cubit/bulk_stock_adjustment_state.dart';
import 'package:pharmacy_app/features/bulk_stock_adjustment/data/repo/bulk_stock_adjustment_repository.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/inventory/data/repo/product_detail_repository.dart';

/// Per-row validation error keys. The screen maps these to localized strings
/// via [BulkRowError.label]. Keeping them as an enum (not raw strings) makes
/// the cubit UI-agnostic while the screen owns localization.
enum BulkRowError {
  productRequired,
  qtyRequired,
  priceRequired,
  batchRequired,
  tooMuch,
}

/// Drives the Bulk Stock Adjustment form. Loads the product dropdown options
/// and owns the dynamic line-items list. `setItemProduct` lazily loads the
/// product's batches for `remove` rows. `submit()` validates the rows (see
/// [_validate]), builds the snake_case `items` array, and POSTs it to
/// `/stock-adjustments/bulk` (atomic, all-or-nothing).
class BulkStockAdjustmentCubit extends Cubit<BulkStockAdjustmentState> {
  BulkStockAdjustmentCubit({
    required this.bulkRepository,
    required this.inventoryRepository,
    required this.productDetailRepository,
  }) : super(const BulkStockAdjustmentState());

  final BulkStockAdjustmentRepository bulkRepository;
  final InventoryRepository inventoryRepository;
  final ProductDetailRepository productDetailRepository;

  // ---- Options ---------------------------------------------------------- //

  Future<void> loadOptions() async {
    if (isClosed) return;
    emit(state.copyWith(isProductsLoading: true, hasProductsError: false));
    final result = await inventoryRepository.fetchProducts(page: 1, perPage: 200);
    if (isClosed) return;
    result.fold(
      (_) => emit(state.copyWith(isProductsLoading: false, hasProductsError: true)),
      (page) => emit(
        state.copyWith(
          isProductsLoading: false,
          hasProductsError: false,
          products: page.products,
          // Seed one expanded empty row so the form is immediately editable.
          items: state.items.isEmpty
              ? [const BulkAdjustmentItemInput()]
              : state.items,
        ),
      ),
    );
  }

  Future<void> reloadOptions() => loadOptions();

  // ---- Line items ------------------------------------------------------- //

  void addItem() {
    emit(
      state.copyWith(
        items: [...state.items, const BulkAdjustmentItemInput(expanded: true)],
      ),
    );
  }

  void removeItem(int index) {
    if (index < 0 || index >= state.items.length) return;
    final items = [...state.items]..removeAt(index);
    emit(state.copyWith(items: items));
  }

  void updateItem(int index, BulkAdjustmentItemInput updated) {
    if (index < 0 || index >= state.items.length) return;
    final items = [...state.items];
    items[index] = updated;
    emit(state.copyWith(items: items));
  }

  void setAdjustmentType(int index, BulkAdjustmentType type) {
    if (index < 0 || index >= state.items.length) return;
    final item = state.items[index];
    // Clear the fields that belong to the other direction so stale values
    // don't get submitted or shown.
    updateItem(
      index,
      item.copyWith(
        type: type,
        selectedBatch: null,
        batches: const <StockBatchModel>[],
        purchasePrice: type == BulkAdjustmentType.add ? item.purchasePrice : '',
        sellingPrice: type == BulkAdjustmentType.add ? item.sellingPrice : '',
        batchNumber: type == BulkAdjustmentType.add ? item.batchNumber : '',
        expiryDate: type == BulkAdjustmentType.add ? item.expiryDate : '',
      ),
    );
  }

  void toggleItemExpanded(int index) {
    if (index < 0 || index >= state.items.length) return;
    final item = state.items[index];
    updateItem(index, item.copyWith(expanded: !item.expanded));
  }

  /// Sets the product for a row. For `remove` rows, also loads the product's
  /// active, in-stock batches so the user can pick which batch to draw down.
  Future<void> setItemProduct(int index, ProductCardModel? product) async {
    if (index < 0 || index >= state.items.length) return;
    final item = state.items[index];
    updateItem(
      index,
      item.copyWith(
        product: product,
        selectedBatch: null,
        batches: const <StockBatchModel>[],
      ),
    );
    if (product == null) return;
    if (item.type == BulkAdjustmentType.remove) {
      await _loadBatchesFor(index, product.id);
    }
  }

  void setItemBatch(int index, StockBatchModel? batch) {
    if (index < 0 || index >= state.items.length) return;
    updateItem(index, state.items[index].copyWith(selectedBatch: batch));
  }

  Future<void> _loadBatchesFor(int index, int productId) async {
    if (isClosed) return;
    updateItem(index, state.items[index].copyWith(isBatchesLoading: true));
    final result = await productDetailRepository.fetchBatches(productId);
    if (isClosed) return;
    final batches = result.fold(
      (_) => <StockBatchModel>[],
      (all) => all
          .where(
            (b) =>
                b.quantityOnHand > 0 && b.status == StockBatchStatus.active,
          )
          .toList(),
    );
    updateItem(
      index,
      state.items[index].copyWith(
        batches: batches,
        isBatchesLoading: false,
        selectedBatch: null,
      ),
    );
  }

  // ---- Validation ------------------------------------------------------- //

  /// Validates every row and emits `rowErrors` (index → key). Returns whether
  /// the form is ready to submit. Empty rows (no product AND no quantity) are
  /// skipped so trailing blank rows don't block submit. Clears prior errors
  /// first; the screen reads `state.rowErrors` to render inline messages.
  bool validate() {
    final errors = <int, BulkRowError>{};
    for (var i = 0; i < state.items.length; i++) {
      final item = state.items[i];
      final isEmpty = item.product == null && item.quantity.trim().isEmpty;
      if (isEmpty) continue;

      if (item.product == null) {
        errors[i] = BulkRowError.productRequired;
        continue;
      }
      final qty = int.tryParse(item.quantity.trim());
      if (qty == null || qty < 1) {
        errors[i] = BulkRowError.qtyRequired;
        continue;
      }
      if (item.type == BulkAdjustmentType.add) {
        if (_num(item.purchasePrice) <= 0 || _num(item.sellingPrice) <= 0) {
          errors[i] = BulkRowError.priceRequired;
        }
      } else {
        if (item.selectedBatch == null) {
          errors[i] = BulkRowError.batchRequired;
        } else if (qty > item.selectedBatch!.quantityOnHand) {
          errors[i] = BulkRowError.tooMuch;
        }
      }
    }
    // freezed generates Map<int, String>; store the enum name as the string so
    // the screen can map it back to a localized message without a circular
    // import on the cubit.
    final asStrings = errors.map((k, v) => MapEntry(k, v.name));
    emit(state.copyWith(rowErrors: asStrings));
    return asStrings.isEmpty;
  }

  void clearRowErrors() {
    if (isClosed) return;
    if (state.rowErrors.isNotEmpty) emit(state.copyWith(rowErrors: const {}));
  }

  // ---- Submit ----------------------------------------------------------- //

  Future<void> submit() async {
    if (isClosed) return;

    final hasAny = state.items.any((i) => i.product != null);
    if (!hasAny) {
      emit(
        state.copyWith(
          rowErrors: {0: BulkRowError.productRequired.name},
        ),
      );
      return;
    }
    if (!validate()) return; // emits rowErrors; do not submit

    emit(state.copyWith(isSubmitting: true, failure: null, saved: false));

    final itemsJson = <Map<String, dynamic>>[];
    for (final i in state.items) {
      if (i.product == null) continue; // skip blank rows
      final qty = int.tryParse(i.quantity.trim()) ?? 0;
      final item = <String, dynamic>{
        'adjustment_type': i.type == BulkAdjustmentType.add ? 'add' : 'remove',
        'product_id': i.product!.id,
        'quantity': qty,
      };
      if (i.type == BulkAdjustmentType.add) {
        item['purchase_price'] = _num(i.purchasePrice);
        item['selling_price'] = _num(i.sellingPrice);
        if (i.batchNumber.trim().isNotEmpty) {
          item['batch_number'] = i.batchNumber.trim();
        }
        if (i.expiryDate.trim().isNotEmpty) {
          item['expiry_date'] = i.expiryDate.trim();
        }
      } else {
        item['batch_id'] = i.selectedBatch!.id;
      }
      if (i.notes.trim().isNotEmpty) item['notes'] = i.notes.trim();
      itemsJson.add(item);
    }

    final result = await bulkRepository.bulkAdjustment(itemsJson);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isSubmitting: false, failure: failure)),
      (_) => emit(state.copyWith(isSubmitting: false, saved: true)),
    );
  }

  void clearFailure() {
    if (isClosed) return;
    if (state.failure != null) emit(state.copyWith(failure: null));
  }

  double _num(String s) => double.tryParse(s.trim()) ?? 0;
}
