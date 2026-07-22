import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/reports/data/models/inventory_value_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/profit_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/sales_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/stock_health_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/supplier_prices_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/top_products_report_model.dart';

import 'reports_repository.dart';

class ReportsRepositoryImpl implements ReportsRepository {
  ReportsRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, SalesReportModel>> fetchSalesReport({
    required String period,
    required String dateFrom,
    required String dateTo,
  }) async {
    try {
      final response = await api.get(
        ApiRoutes.reportsSales,
        queryParameters: {
          'period': period,
          'date_from': dateFrom,
          'date_to': dateTo,
        },
      );
      final report = ApiParser.parseWrapped(
        response.data,
        'data',
        SalesReportModel.fromJson,
      );
      return Right(report);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, TopProductsReportModel>> fetchTopProductsReport({
    required String dateFrom,
    required String dateTo,
    int? limit,
  }) async {
    try {
      final response = await api.get(
        ApiRoutes.reportsTopProducts,
        queryParameters: {
          'date_from': dateFrom,
          'date_to': dateTo,
          'limit': limit,
        },
      );
      final report = ApiParser.parseWrapped(
        response.data,
        'data',
        TopProductsReportModel.fromJson,
      );
      return Right(report);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ProfitReportModel>> fetchProfitReport({
    required String dateFrom,
    required String dateTo,
  }) async {
    try {
      final response = await api.get(
        ApiRoutes.reportsProfit,
        queryParameters: {
          'date_from': dateFrom,
          'date_to': dateTo,
        },
      );
      final report = ApiParser.parseWrapped(
        response.data,
        'data',
        ProfitReportModel.fromJson,
      );
      return Right(report);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SupplierPricesReportModel>> fetchSupplierPricesReport({
    int? productId,
    String? dateFrom,
    String? dateTo,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'product_id': productId,
        'date_from': dateFrom,
        'date_to': dateTo,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.reportsSupplierPrices,
        queryParameters: queryParameters,
      );
      final report = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierPricesReportModel.fromJson,
      );
      return Right(report);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, InventoryValueReportModel>>
      fetchInventoryValueReport() async {
    try {
      final response = await api.get(ApiRoutes.reportsInventoryValue);
      final report = ApiParser.parseWrapped(
        response.data,
        'data',
        InventoryValueReportModel.fromJson,
      );
      return Right(report);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, StockHealthReportModel>> fetchStockHealthReport({
    required int expiryDays,
  }) async {
    try {
      final response = await api.get(
        ApiRoutes.reportsStockHealth,
        queryParameters: {'expiry_days': expiryDays},
      );
      final report = ApiParser.parseWrapped(
        response.data,
        'data',
        StockHealthReportModel.fromJson,
      );
      return Right(report);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
