import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_state.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/header/today_revenue_stats_container.dart';

class TodayRevenueSection extends StatelessWidget {
  const TodayRevenueSection({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.decimalPattern();
    final percentFormatter = NumberFormat.decimalPercentPattern(
      decimalDigits: 1,
    );

    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (p, c) => p.header != c.header,
      builder: (context, state) {
        final header = state.header;
        final revenue = header?.todayRevenue ?? 0;
        final change = header?.todayRevenueChangePercent ?? 0;
        final invoiceCount = header?.todayInvoiceCount ?? 0;
        final avgInvoice = header?.todayAvgInvoice ?? 0;
        final unitsSold = header?.todayUnitsSold ?? 0;
        final hasHeader = header != null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  context.tr.today_revenue,
                  style: context.text.titleSmall?.copyWith(
                    fontSize: 14,
                    color: Colors.white.withAlpha(153),
                  ),
                ),
                const Spacer(),
                if (!hasHeader)
                  _HeaderRetryButton(
                    onTap: () => context.read<DashboardCubit>().refreshHeader(),
                  ),
              ],
            ),
            context.vSm,
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  currencyFormatter.format(revenue),
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
                        Icon(
                          change >= 0
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: Colors.white,
                          size: 12,
                        ),
                        context.hXs,
                        Text(
                          "${percentFormatter.format(change / 100)} ${context.tr.from_yesterday}",
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
            if (!hasHeader) ...[
              context.vSm,
              Text(
                context.tr.dashboard_no_data_hint,
                style: context.text.bodySmall?.copyWith(
                  color: Colors.white.withAlpha(180),
                ),
              ),
            ],
            context.vLg,
            TodayRevenueStatsContainer(
              invoiceCount: invoiceCount,
              avgInvoiceValue: avgInvoice,
              unitsSold: unitsSold,
              currencyFormatter: currencyFormatter,
            ),
          ],
        );
      },
    );
  }
}

class _HeaderRetryButton extends StatelessWidget {
  const _HeaderRetryButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.refresh_rounded,
              color: Colors.white.withAlpha(200),
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              context.tr.inventory_retry,
              style: context.text.labelSmall?.copyWith(
                color: Colors.white.withAlpha(200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
