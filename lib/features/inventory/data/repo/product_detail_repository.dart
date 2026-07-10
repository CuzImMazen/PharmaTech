import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_medical_info_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';

/// Data source for the Product Detail page.
abstract class ProductDetailRepository {
  Future<Either<Failure, ProductDetailModel>> fetchProduct(int id);

  Future<Either<Failure, List<StockBatchModel>>> fetchBatches(
    int id, {
    int perPage = 15,
  });

  /// Returns the medical info, or `null` when the product has none
  /// (backend responds `{"data": null}` with HTTP 200 in that case).
  Future<Either<Failure, ProductMedicalInfoModel?>> fetchMedicalInfo(int id);

  /// Upserts (create or update) the medical info. [body] is a map of the 9
  /// nullable-string fields (snake_case keys). Returns the saved model.
  Future<Either<Failure, ProductMedicalInfoModel>> upsertMedicalInfo(
    int id,
    Map<String, String?> body,
  );

  /// Deletes the medical info. Idempotent — safe to call when none exists.
  Future<Either<Failure, void>> deleteMedicalInfo(int id);

  // ---- Product CRUD ----------------------------------------------------- //

  /// Creates a new product. [body] uses snake_case keys matching the backend
  /// `StoreProductRequest` (`barcode`, `brand_name`, `category_id`,
  /// `buying_price`, `selling_price` required; the rest optional). Returns the
  /// created product (`ProductResource`).
  Future<Either<Failure, ProductDetailModel>> createProduct(
    Map<String, dynamic> body,
  );

  /// Updates an existing product. [body] uses snake_case keys; all fields are
  /// `sometimes` on the backend so only provided keys are validated/applied.
  /// Returns the updated product (`ProductResource` incl. `medical_info`).
  Future<Either<Failure, ProductDetailModel>> updateProduct(
    int id,
    Map<String, dynamic> body,
  );

  /// Soft-deletes a product. Idempotent on the backend.
  Future<Either<Failure, void>> deleteProduct(int id);
}
