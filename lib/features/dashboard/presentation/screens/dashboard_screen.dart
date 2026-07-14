import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_state.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/dashboard_shimmer.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/header/dashboard_header.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/recent_transactions/recent_transactions_card.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stats_grid/stats_grid.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stock_alerts/stock_alerts_section.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/title_row.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/weekly_revenue/weekly_revenue_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    await context.read<DashboardCubit>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocBuilder<DashboardCubit, DashboardState>(
          buildWhen: (p, c) =>
              p.isInitialLoading != c.isInitialLoading ||
              p.isRefreshing != c.isRefreshing || // Add this line!
              p.failure != c.failure,
          builder: (context, state) {
            if (state.isInitialLoading) {
              return const DashboardShimmer();
            }

            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  if (state.failure != null)
                    _DashboardErrorBanner(
                      message: state.failure!.localizedMessage(context),
                      onRetry: () => _onRefresh(context),
                    ),
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
            );
          },
        ),
      ),
    );
  }
}

class _DashboardErrorBanner extends StatelessWidget {
  const _DashboardErrorBanner({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.onErrorContainer,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
            ),
            TextButton(
              onPressed: onRetry,
              child: Text(context.tr.inventory_retry),
            ),
          ],
        ),
      ),
    );
  }
}
