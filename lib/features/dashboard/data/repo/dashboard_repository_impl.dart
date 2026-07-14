import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_cards_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_header_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_transaction_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_transactions_page.dart';
import 'package:pharmacy_app/features/dashboard/data/models/weekly_revenue_point_model.dart';

import 'dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, DashboardHeaderModel>> fetchHeader() async {
    try {
      final response = await api.get(ApiRoutes.dashboardHeader);
      final header = ApiParser.parseWrapped(
        response.data,
        'data',
        DashboardHeaderModel.fromJson,
      );
      return Right(header);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, DashboardCardsModel>> fetchCards() async {
    try {
      final response = await api.get(ApiRoutes.dashboardCards);
      final cards = ApiParser.parseWrapped(
        response.data,
        'data',
        DashboardCardsModel.fromJson,
      );
      return Right(cards);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<WeeklyRevenuePointModel>>>
  fetchWeeklyRevenue() async {
    try {
      final response = await api.get(ApiRoutes.dashboardWeeklyRevenue);
      final points = ApiParser.parseWrappedList(
        response.data,
        'data',
        WeeklyRevenuePointModel.fromJson,
      );
      return Right(points);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, DashboardTransactionsPage>> fetchTransactions({
    int perPage = 5,
  }) async {
    try {
      final response = await api.get(
        ApiRoutes.dashboardTransactions,
        queryParameters: {'per_page': perPage},
      );

      final transactions = ApiParser.parseWrappedList(
        response.data,
        'data',
        DashboardTransactionModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        DashboardTransactionsPage(
          transactions: transactions,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? 1,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? 1,
          total: (meta?['total'] as num?)?.toInt() ?? transactions.length,
        ),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
