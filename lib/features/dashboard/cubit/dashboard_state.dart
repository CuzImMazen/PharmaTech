import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_cards_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_header_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_transaction_model.dart';
import 'package:pharmacy_app/features/dashboard/data/models/weekly_revenue_point_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';

part 'dashboard_state.freezed.dart';

/// State for the Dashboard. Aggregates backend data from the dashboard
/// endpoints plus the low-stock product list (`GET /products/low-stock`).
@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    DashboardHeaderModel? header,
    DashboardCardsModel? cards,
    @Default(<WeeklyRevenuePointModel>[]) List<WeeklyRevenuePointModel> weeklyRevenue,
    @Default(<DashboardTransactionModel>[]) List<DashboardTransactionModel> recentTransactions,
    @Default(<ProductCardModel>[]) List<ProductCardModel> lowStockProducts,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isRefreshing,
    Failure? failure,
  }) = _DashboardState;
}
