import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/header/dashboard_header.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stats_grid/stats_grid.dart';
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
            const SliverToBoxAdapter(child: DashboardHeader()),
            const StatsSliverGrid(),
            const SliverToBoxAdapter(child: WeeklyRevenueCard()),
            SliverToBoxAdapter(child: context.vMd),
            const SliverToBoxAdapter(child: _TitleRow()),
          ],
        ),
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text('Recent Transactions', style: context.text.titleLarge),
          Spacer(),
          InkWell(
            splashColor: AppColors.primary.withAlpha(70),
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    'View All',
                    style: context.text.labelLarge?.copyWith(
                      color: context.colors.primary,
                    ),
                  ),
                  context.hSm,
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: context.colors.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
