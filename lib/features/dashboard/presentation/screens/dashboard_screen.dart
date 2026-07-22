import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
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

  void _showFailureSnackbar(BuildContext context, DashboardState state) {
    final failure = state.failure;
    if (failure == null) return;
    AppSnackbar.failure(message: failure.localizedMessage(context));
    context.read<DashboardCubit>().clearFailure();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocListener<DashboardCubit, DashboardState>(
          listenWhen: (p, c) => p.failure != c.failure && c.failure != null,
          listener: _showFailureSnackbar,
          child: BlocBuilder<DashboardCubit, DashboardState>(
            buildWhen: (p, c) =>
                p.isInitialLoading != c.isInitialLoading ||
                p.isRefreshing != c.isRefreshing,
            builder: (context, state) {
              if (state.isInitialLoading) {
                return const DashboardShimmer();
              }

              return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: const [
                    DashboardHeader(),
                    StatsSliverGrid(),
                    WeeklyRevenueCard(),
                    _RecentTransactionsTitle(),
                    RecentTransactionsCard(),
                    _StockAlertsTitle(),
                    StockAlertsSection(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _RecentTransactionsTitle extends StatelessWidget {
  const _RecentTransactionsTitle();

  @override
  Widget build(BuildContext context) {
    return TitleRow(
      title: context.tr.recent_transactions,
      actionText: context.tr.view_all,
    );
  }
}

class _StockAlertsTitle extends StatelessWidget {
  const _StockAlertsTitle();

  @override
  Widget build(BuildContext context) {
    return TitleRow(
      title: context.tr.stock_alerts_title,
      actionText: context.tr.manage_inventory,
    );
  }
}
