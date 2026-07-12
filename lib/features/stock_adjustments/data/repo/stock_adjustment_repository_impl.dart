import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_movement_model.dart';
import 'package:pharmacy_app/features/stock_adjustments/data/models/stock_adjustments_page.dart';

import 'stock_adjustment_repository.dart';

class StockAdjustmentRepositoryImpl implements StockAdjustmentRepository {
  StockAdjustmentRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, StockAdjustmentsPage>> fetchAdjustments({
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.stockAdjustments,
        queryParameters: queryParameters,
      );

      final adjustments = ApiParser.parseWrappedList(
        response.data,
        'data',
        StockMovementModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        StockAdjustmentsPage(
          adjustments: adjustments,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? page,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? page,
          total: (meta?['total'] as num?)?.toInt() ?? adjustments.length,
        ),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
