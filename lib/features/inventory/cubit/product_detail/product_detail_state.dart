import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_medical_info_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';

part 'product_detail_state.freezed.dart';

/// Outcome of a medical-info mutation, surfaced to the UI via BlocListener.
enum MedicalActionResult { saved, deleted }

@freezed
abstract class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    ProductDetailModel? product,
    @Default(<StockBatchModel>[]) List<StockBatchModel> batches,
    ProductMedicalInfoModel? medicalInfo,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isRefreshing,
    @Default(false) bool isBatchesLoading,
    @Default(false) bool isMedicalLoading,
    @Default(false) bool isMedicalSaving,
    @Default(false) bool isMedicalDeleting,
    @Default(false) bool isProductDeleting,
    // Transient signal set after a successful product delete so the screen's
    // BlocListener can pop back to the inventory. Null otherwise.
    @Default(false) bool isProductDeleted,
    // Set on a failed mutation; cleared on the next successful one. The UI
    // shows it via a BlocListener then it is ignored until it changes again.
    Failure? medicalFailure,
    // Set transiently on a successful save/delete so the UI's BlocListener can
    // react (snackbar). Null otherwise.
    MedicalActionResult? lastMedicalAction,
    Failure? failure,
  }) = _ProductDetailState;
}
