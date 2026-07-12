import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';

import 'bulk_stock_adjustment_repository.dart';

class BulkStockAdjustmentRepositoryImpl
    implements BulkStockAdjustmentRepository {
  BulkStockAdjustmentRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, void>> bulkAdjustment(
    List<Map<String, dynamic>> items,
  ) async {
    try {
      final response = await api.post(
        ApiRoutes.stockAdjustmentsBulk,
        data: {'items': items},
      );
      // The backend returns the created resources; we only need success/failure.
      ApiParser.parse<Map<String, dynamic>>(response.data, (json) => json);
      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
