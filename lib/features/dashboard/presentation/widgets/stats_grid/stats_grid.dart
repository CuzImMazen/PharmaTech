import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stats_grid/stat_card.dart';

class StatsSliverGrid extends StatelessWidget {
  const StatsSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
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
            value: '3,240',
            label: context.tr.yesterday_revenue,
            infoValue: '8%',
            infoLabel: context.tr.this_week,
            showArrow: true,
            color: AppColors.cozyEmerald,
          ),

          StatCard(
            icon: LucideIcons.package,
            value: '20',
            label: context.tr.total_items,
            infoValue: '18',
            infoLabel: context.tr.items_in_stock,
            color: AppColors.cozyBlue,
          ),

          StatCard(
            icon: LucideIcons.triangleAlert,
            value: '6',
            label: context.tr.stock_alerts,
            infoValue: '2',
            infoLabel: context.tr.out_of_stock,
            color: AppColors.cozyAmber,
          ),

          StatCard(
            icon: LucideIcons.shoppingBag,
            value: '23',
            label: context.tr.today_sales,
            infoValue: '5%',
            infoLabel: context.tr.from_yesterday,
            showArrow: true,
            color: AppColors.cozyPurple,
          ),
        ]),
      ),
    );
  }
}
