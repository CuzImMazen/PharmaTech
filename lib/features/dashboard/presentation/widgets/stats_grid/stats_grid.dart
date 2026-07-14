import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_state.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stats_grid/stat_card.dart';

class StatsSliverGrid extends StatelessWidget {
  const StatsSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (p, c) => p.cards != c.cards,
      builder: (context, state) {
        final cards = state.cards;
        final currencyFormatter = NumberFormat.decimalPattern();

        final yesterdayRevenue = cards?.yesterdayRevenue ?? 0;
        final yesterdayChange = cards?.yesterdayWeekChangePercent ?? 0;
        final totalProducts = cards?.totalProducts ?? 0;
        final inStockProducts = cards?.inStockProducts ?? 0;
        final stockAlerts = cards?.stockAlertsCount ?? 0;
        final outOfStock = cards?.outOfStockCount ?? 0;
        final todaySales = cards?.todaySalesCount ?? 0;
        final todaySalesChange = cards?.todaySalesChangePercent ?? 0;

        final showYesterdayArrow = yesterdayRevenue > 0 || yesterdayChange != 0;
        final showTodaySalesArrow = todaySales > 0 || todaySalesChange != 0;

        return SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.95,
            ),
            delegate: SliverChildListDelegate.fixed([
              StatCard(
                icon: LucideIcons.trendingUp,
                value: currencyFormatter.format(yesterdayRevenue),
                label: context.tr.yesterday_revenue,
                infoValue: '${yesterdayChange.abs()}%',
                infoLabel: context.tr.this_week,
                showArrow: showYesterdayArrow,
                isPositiveTrend: yesterdayChange >= 0,
                color: AppColors.cozyEmerald,
              ),
              StatCard(
                icon: LucideIcons.package,
                value: currencyFormatter.format(totalProducts),
                label: context.tr.total_items,
                infoValue: currencyFormatter.format(inStockProducts),
                infoLabel: context.tr.items_in_stock,
                color: AppColors.cozyBlue,
              ),
              StatCard(
                icon: LucideIcons.triangleAlert,
                value: currencyFormatter.format(stockAlerts),
                label: context.tr.stock_alerts,
                infoValue: currencyFormatter.format(outOfStock),
                infoLabel: context.tr.out_of_stock,
                color: AppColors.cozyAmber,
              ),
              StatCard(
                icon: LucideIcons.shoppingBag,
                value: currencyFormatter.format(todaySales),
                label: context.tr.today_sales,
                infoValue: '${todaySalesChange.abs()}%',
                infoLabel: context.tr.from_yesterday,
                showArrow: showTodaySalesArrow,
                isPositiveTrend: todaySalesChange >= 0,
                color: AppColors.cozyPurple,
              ),
            ]),
          ),
        );
      },
    );
  }
}
