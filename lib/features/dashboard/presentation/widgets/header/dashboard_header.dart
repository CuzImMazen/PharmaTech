import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/header/notification_row.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/header/today_revenue_section.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/header/welcome_column.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(
          top: statusBarHeight + 24.0,
          bottom: 24.0,
          left: 16.0,
          right: 16.0,
        ),

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.dashBoardHeaderGradient,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationRow(),
            context.vXl,
            WelcomeColumn(),
            context.vLg,
            TodayRevenueSection(),
          ],
        ),
      ),
    );
  }
}
