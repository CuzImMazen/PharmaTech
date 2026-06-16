import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/header/today_revenue_stats_container.dart';

class TodayRevenueSection extends StatelessWidget {
  const TodayRevenueSection({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.decimalPattern();
    final percentFormatter = NumberFormat.decimalPercentPattern(
      decimalDigits: 1,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr.today_revenue,
          style: context.text.titleSmall?.copyWith(
            fontSize: 14,
            color: Colors.white.withAlpha(153),
          ),
        ),
        context.vSm,

        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              currencyFormatter.format(1800),
              style: context.text.titleLarge?.copyWith(
                fontSize: 42,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1.0,
              ),
            ),
            context.hSm,

            Text(
              context.tr.sp,
              style: context.text.titleSmall?.copyWith(
                fontSize: 22,
                color: Colors.white.withAlpha(200),
                height: 1.0,
              ),
            ),
            context.hSm,

            // The Growth Badge
            Baseline(
              baseline: 0.0,
              baselineType: TextBaseline.alphabetic,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(38),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 12,
                    ),
                    context.hXs,
                    Text(
                      "${percentFormatter.format(0.052)} ${context.tr.from_yesterday}",
                      style: context.text.titleSmall?.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        context.vLg,
        TodayRevenueStatsContainer(currencyFormatter: currencyFormatter),
      ],
    );
  }
}
