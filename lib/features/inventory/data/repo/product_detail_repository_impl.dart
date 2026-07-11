import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_medical_info_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_movement_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/product_detail_repository.dart';

class ProductDetailRepositoryImpl implements ProductDetailRepository {
  ProductDetailRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, ProductDetailModel>> fetchProduct(int id) async {
    try {
      final response = await api.get(ApiRoutes.productDetail(id));
      final product = ApiParser.parseWrapped(
        response.data,
        'data',
        ProductDetailModel.fromJson,
      );
      return Right(product);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<StockBatchModel>>> fetchBatches(
    int id, {
    int perPage = 15,
  }) async {
    try {
      // All batches for the product (active + depleted + expired + inactive).
      // `available` endpoint only returns active/qty>0, which hides history.
      final response = await api.get(
        ApiRoutes.stockBatches,
        queryParameters: {'product_id': id, 'per_page': perPage},
      );
      final batches = ApiParser.parseWrappedList(
        response.data,
        'data',
        StockBatchModel.fromJson,
      );
      return Right(batches);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ProductMedicalInfoModel?>> fetchMedicalInfo(
    int id,
  ) async {
    try {
      final response = await api.get(ApiRoutes.productMedicalInfo(id));
      // Backend returns {"data": null} when no row exists.
      final data =
          response.data is Map<String, dynamic>
              ? response.data['data']
              : null;
      final medicalInfo = ProductMedicalInfoModel.fromJsonOrNull(data);
      return Right(medicalInfo);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ProductMedicalInfoModel>> upsertMedicalInfo(
    int id,
    Map<String, String?> body,
  ) async {
    try {
      final response = await api.put(
        ApiRoutes.productMedicalInfo(id),
        data: body,
      );
      final medicalInfo = ApiParser.parseWrapped(
        response.data,
        'data',
        ProductMedicalInfoModel.fromJson,
      );
      return Right(medicalInfo);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMedicalInfo(int id) async {
    try {
      await api.delete(ApiRoutes.productMedicalInfo(id));
      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ProductDetailModel>> createProduct(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.post(ApiRoutes.products, data: body);
      final product = ApiParser.parseWrapped(
        response.data,
        'data',
        ProductDetailModel.fromJson,
      );
      return Right(product);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ProductDetailModel>> updateProduct(
    int id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.put(ApiRoutes.productDetail(id), data: body);
      final product = ApiParser.parseWrapped(
        response.data,
        'data',
        ProductDetailModel.fromJson,
      );
      return Right(product);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    try {
      await api.delete(ApiRoutes.productDetail(id));
      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, StockBatchModel>> markBatchExpired(
    int batchId,
  ) async {
    try {
      final response = await api.patch(ApiRoutes.markBatchExpired(batchId));
      final batch = ApiParser.parseWrapped(
        response.data,
        'data',
        StockBatchModel.fromJson,
      );
      return Right(batch);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, StockBatchModel>> addStockBatch(
    Map<String, dynamic> body,
  ) async {
    try {
      // StockAdjustmentResource = {"batch": {...}, "movement": {...}}.
      final response = await api.post(ApiRoutes.stockAdjustments, data: body);
      final data = response.data is Map<String, dynamic>
          ? response.data['data']
          : null;
      if (data is! Map<String, dynamic>) {
        return const Left(ParsingFailure());
      }
      final batch = StockBatchModel.fromJson(
        data['batch'] as Map<String, dynamic>,
      );
      return Right(batch);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<StockMovementModel>>> fetchStockMovements(
    int productId, {
    int perPage = 50,
  }) async {
    try {
      final response = await api.get(
        ApiRoutes.stockMovements,
        queryParameters: {'product_id': productId, 'per_page': perPage},
      );
      final movements = ApiParser.parseWrappedList(
        response.data,
        'data',
        StockMovementModel.fromJson,
      );
      return Right(movements);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
