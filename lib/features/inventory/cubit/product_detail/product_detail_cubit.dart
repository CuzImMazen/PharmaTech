import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_medical_info_model.dart';
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
              batches: batches,
              failure: null,
            ),
          ),
        );
      },
    );
  }

  Future<void> refresh(int productId) => loadAll(productId);

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
}
