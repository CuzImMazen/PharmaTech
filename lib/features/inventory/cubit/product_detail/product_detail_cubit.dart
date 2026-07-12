import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_medical_info_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/product_detail_repository.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({required this.repository})
    : super(const ProductDetailState());

  final ProductDetailRepository repository;

  /// Loads the product, its batches, and (via the product payload) its medical
  /// info concurrently. A product-fetch failure is a hard error.
  Future<void> loadAll(int productId) async {
    if (isClosed) return;

    final isFirstLoad = state.product == null;
    emit(
      state.copyWith(
        isInitialLoading: isFirstLoad,
        isRefreshing: !isFirstLoad,
        isBatchesLoading: true,
        failure: null,
      ),
    );

    // Fire product + batches concurrently.
    final productResult = repository.fetchProduct(productId);
    final batchesResult = repository.fetchBatches(productId);

    final product = await productResult;
    if (isClosed) return;

    final batches = await batchesResult;
    if (isClosed) return;

    product.fold(
      (failure) => emit(
        state.copyWith(
          isInitialLoading: false,
          isRefreshing: false,
          isBatchesLoading: false,
          failure: failure,
        ),
      ),
      (product) {
        // The product payload already carries medical_info (nullable).
        batches.fold(
          (failure) => emit(
            state.copyWith(
              isInitialLoading: false,
              isRefreshing: false,
              isBatchesLoading: false,
              product: product,
              medicalInfo: product.medicalInfo,
              // A batches failure is non-fatal: keep the product, clear batches.
              failure: null,
            ),
          ),
          (batches) => emit(
            state.copyWith(
              isInitialLoading: false,
              isRefreshing: false,
              isBatchesLoading: false,
              product: product,
              medicalInfo: product.medicalInfo,
              batches: _sortBatchesAvailableFirst(batches),
              failure: null,
            ),
          ),
        );
      },
    );

    // Movements are loaded last and non-fatally: a failure here doesn't block
    // the product/batches from rendering.
    await reloadStockMovements(productId);
  }

  /// Sorts batches so available ones (active with stock) appear first, then
  /// depleted, inactive, and expired last. Within the available group, the
  /// soonest-expiring batch leads.
  static List<StockBatchModel> _sortBatchesAvailableFirst(
    List<StockBatchModel> batches,
  ) {
    final list = [...batches];
    list.sort((a, b) {
      final rankA = _availabilityRank(a);
      final rankB = _availabilityRank(b);
      if (rankA != rankB) return rankA.compareTo(rankB);
      // Same group: earliest expiry first (null expiry treated as latest).
      final aExp = a.expiryDate ?? '';
      final bExp = b.expiryDate ?? '';
      return aExp.compareTo(bExp);
    });
    return list;
  }

  /// Lower = shown first. Available (active, qty>0) = 0; depleted = 1;
  /// inactive = 2; expired = 3; anything else = 4.
  static int _availabilityRank(StockBatchModel b) {
    switch (b.status) {
      case StockBatchStatus.active:
        return b.quantityOnHand > 0 ? 0 : 1;
      case StockBatchStatus.depleted:
        return 1;
      case StockBatchStatus.inactive:
        return 2;
      case StockBatchStatus.expired:
        return 3;
    }
  }

  Future<void> refresh(int productId) => loadAll(productId);

  /// Re-fetches only the stock-movement history (newest first). Non-fatal: a
  /// failure is surfaced via [movementsFailure] without blocking the screen.
  Future<void> reloadStockMovements(int productId) async {
    if (isClosed) return;
    emit(state.copyWith(isMovementsLoading: true, movementsFailure: null));
    final result = await repository.fetchStockMovements(productId);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(isMovementsLoading: false, movementsFailure: failure),
      ),
      (movements) => emit(
        state.copyWith(isMovementsLoading: false, movements: movements),
      ),
    );
  }

  /// Called by the product form cubit after a successful update (the form
  /// returns the saved model). Updates the detail screen instantly without a
  /// refetch.
  void onProductUpdated(ProductDetailModel product) {
    if (isClosed) return;
    emit(
      state.copyWith(
        product: product,
        // Keep medical info in sync: an update response carries medical_info.
        medicalInfo: product.medicalInfo,
        failure: null,
      ),
    );
  }

  /// Soft-deletes the product. On success emits a transient `isProductDeleted`
  /// signal so the screen's BlocListener can pop back to the inventory.
  Future<void> deleteProduct(int productId) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        isProductDeleting: true,
        isProductDeleted: false,
        failure: null,
      ),
    );
    final result = await repository.deleteProduct(productId);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(
          isProductDeleting: false,
          isProductDeleted: false,
          failure: failure,
        ),
      ),
      (_) => emit(
        state.copyWith(
          isProductDeleting: false,
          isProductDeleted: true,
          failure: null,
        ),
      ),
    );
  }

  /// Clears the transient delete signal after the UI has reacted.
  void clearProductDeleted() {
    if (isClosed) return;
    if (state.isProductDeleted) {
      emit(state.copyWith(isProductDeleted: false));
    }
  }

  /// Restores a soft-deleted product. On success emits a transient
  /// `isProductRestored` signal so the screen's BlocListener can show a
  /// snackbar and pop back to the inventory (where the restored product
  /// reappears in the list).
  Future<void> restoreProduct(int productId) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        isProductRestoring: true,
        isProductRestored: false,
        failure: null,
      ),
    );
    final result = await repository.restoreProduct(productId);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(
          isProductRestoring: false,
          isProductRestored: false,
          failure: failure,
        ),
      ),
      (restoredProduct) => emit(
        state.copyWith(
          isProductRestoring: false,
          isProductRestored: true,
          product: restoredProduct,
          failure: null,
        ),
      ),
    );
  }

  /// Clears the transient restore signal after the UI has reacted.
  void clearProductRestored() {
    if (isClosed) return;
    if (state.isProductRestored) {
      emit(state.copyWith(isProductRestored: false));
    }
  }

  /// Re-fetches only the medical info (used after the form closes).
  Future<void> reloadMedicalInfo(int productId) async {
    if (isClosed) return;
    emit(state.copyWith(isMedicalLoading: true, medicalFailure: null));
    final result = await repository.fetchMedicalInfo(productId);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(isMedicalLoading: false, medicalFailure: failure),
      ),
      (info) => emit(
        state.copyWith(isMedicalLoading: false, medicalInfo: info),
      ),
    );
  }

  /// Called by the medical-info form cubit on success (the form returns the
  /// saved model). Updates the tab instantly and signals the UI.
  void onMedicalInfoSaved(ProductMedicalInfoModel info) {
    if (isClosed) return;
    emit(
      state.copyWith(
        medicalInfo: info,
        isMedicalSaving: false,
        medicalFailure: null,
        lastMedicalAction: MedicalActionResult.saved,
      ),
    );
  }

  Future<void> deleteMedicalInfo(int productId) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        isMedicalDeleting: true,
        medicalFailure: null,
        lastMedicalAction: null,
      ),
    );
    final result = await repository.deleteMedicalInfo(productId);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(isMedicalDeleting: false, medicalFailure: failure),
      ),
      (_) => emit(
        state.copyWith(
          isMedicalDeleting: false,
          medicalInfo: null,
          lastMedicalAction: MedicalActionResult.deleted,
        ),
      ),
    );
  }

  /// Clears the transient action signal after the UI has reacted.
  void clearMedicalAction() {
    if (isClosed) return;
    if (state.lastMedicalAction != null || state.medicalFailure != null) {
      emit(
        state.copyWith(
          lastMedicalAction: null,
          medicalFailure: null,
        ),
      );
    }
  }

  // ---- Batch mutations ------------------------------------------------- //

  /// Marks a batch expired. On success replaces that batch in [state.batches]
  /// with the returned (now-expired, qty=0) batch and re-sorts available-first.
  /// Emits a transient `lastBatchAction` so the UI shows a snackbar.
  Future<void> markBatchExpired(int batchId) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        mutatingBatchId: batchId,
        batchFailure: null,
        lastBatchAction: null,
      ),
    );
    final result = await repository.markBatchExpired(batchId);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(mutatingBatchId: null, batchFailure: failure),
      ),
      (batch) {
        final updated = state.batches
            .map((b) => b.id == batch.id ? batch : b)
            .toList();
        emit(
          state.copyWith(
            mutatingBatchId: null,
            batches: _sortBatchesAvailableFirst(updated),
            lastBatchAction: BatchActionResult.markedExpired,
          ),
        );
        // Refresh the movements history so the new expiry_out shows up.
        unawaited(reloadStockMovements(batch.productId));
      },
    );
  }

  /// Creates a new batch for the product via a manual stock-in adjustment.
  /// On success prepends the returned batch to [state.batches], re-sorts, and
  /// signals the UI. [body] is the snake_case payload (without
  /// `adjustment_type`, which is added here).
  Future<void> addBatch(Map<String, dynamic> body) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        isAddingBatch: true,
        batchFailure: null,
        lastBatchAction: null,
      ),
    );
    final result = await repository.addStockBatch({
      'adjustment_type': 'add',
      ...body,
    });
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(isAddingBatch: false, batchFailure: failure),
      ),
      (batch) {
        // Avoid duplicate batch numbers (idempotency safety).
        final withoutDup = state.batches.where((b) => b.id != batch.id).toList();
        final updated = [batch, ...withoutDup];
        emit(
          state.copyWith(
            isAddingBatch: false,
            batches: _sortBatchesAvailableFirst(updated),
            lastBatchAction: BatchActionResult.added,
          ),
        );
        // Refresh the movements history so the new adjustment_in shows up.
        unawaited(reloadStockMovements(batch.productId));
      },
    );
  }

  /// Records a manual stock-out adjustment for a batch. On success replaces
  /// the affected batch in [state.batches] (its on-hand quantity drops, and it
  /// becomes `depleted` when it reaches 0), re-sorts available-first, and
  /// signals the UI. [body] is the snake_case payload (without
  /// `adjustment_type`, which is added here). The backend validates that the
  /// batch belongs to the product and has enough quantity — a 422 surfaces via
  /// [batchFailure] with the localized backend message.
  Future<void> removeStock(Map<String, dynamic> body) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        isRemovingBatch: true,
        batchFailure: null,
        lastBatchAction: null,
      ),
    );
    final result = await repository.removeStock({
      'adjustment_type': 'remove',
      ...body,
    });
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(isRemovingBatch: false, batchFailure: failure),
      ),
      (batch) {
        // Replace the affected batch by id (its quantity_on_hand dropped).
        final updated = state.batches
            .map((b) => b.id == batch.id ? batch : b)
            .toList();
        emit(
          state.copyWith(
            isRemovingBatch: false,
            batches: _sortBatchesAvailableFirst(updated),
            lastBatchAction: BatchActionResult.removed,
          ),
        );
        // Refresh the movements history so the new adjustment_out shows up.
        unawaited(reloadStockMovements(batch.productId));
      },
    );
  }

  /// Clears the transient batch-action signal after the UI has reacted.
  void clearBatchAction() {
    if (isClosed) return;
    if (state.lastBatchAction != null || state.batchFailure != null) {
      emit(
        state.copyWith(
          lastBatchAction: null,
          batchFailure: null,
        ),
      );
    }
  }
}
