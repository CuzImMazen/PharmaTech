import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_cards_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_header_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_transactions_page.dart';
import 'package:pharmacy_app/features/dashboard/data/models/weekly_revenue_point_model.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardHeaderModel>> fetchHeader();

  Future<Either<Failure, DashboardCardsModel>> fetchCards();

  Future<Either<Failure, List<WeeklyRevenuePointModel>>> fetchWeeklyRevenue();

  Future<Either<Failure, DashboardTransactionsPage>> fetchTransactions({
    int perPage,
  });
}
