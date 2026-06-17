import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/header/dashboard_header.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/recent_transactions/recent_transactions_card.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stats_grid/stats_grid.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stock_alerts/stock_alerts_section.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/title_row.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/weekly_revenue/weekly_revenue_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            const DashboardHeader(),
            const StatsSliverGrid(),
            const WeeklyRevenueCard(),
            TitleRow(
              title: context.tr.recent_transactions,
              actionText: context.tr.view_all,
            ),
            const RecentTransactionsCard(),
            TitleRow(
              title: context.tr.stock_alerts_title,
              actionText: context.tr.manage_inventory,
            ),
            const StockAlertsSection(),
          ],
        ),
      ),
    );
  }
}
