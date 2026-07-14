import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/widgets/dot.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_state.dart';
import 'package:pharmacy_app/features/dashboard/data/models/weekly_revenue_point_model.dart';

class WeeklyRevenueCard extends StatelessWidget {
  const WeeklyRevenueCard({super.key});

  static const _primary = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (p, c) => p.weeklyRevenue != c.weeklyRevenue,
      builder: (context, state) {
        final points = state.weeklyRevenue;
        if (points.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());

        final maxAmount = points
            .map((d) => d.revenue)
            .reduce((value, element) => math.max(value, element));
        final safeMaxAmount = maxAmount > 0 ? maxAmount : 1;

        final dayFormatter = DateFormat.E(Localizations.localeOf(context).toString());

        return SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: context.rMd,
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withAlpha(38),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.tr.weekly_revenue,
                      style: context.text.titleMedium,
                    ),
                    Text(
                      context.tr.sp,
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
                      ),
                    ),
                  ],
                ),
                context.vMd,
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: points.map((d) {
                      final isToday = d.isToday;
                      final ratio = d.revenue / safeMaxAmount;

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                _formatAmount(d.revenue),
                                style: TextStyle(
                                  fontSize: 8,
                                  color: isToday
                                      ? _primary
                                      : Theme.of(context).colorScheme.onSurface.withAlpha(115),
                                ),
                              ),
                              context.vXs,
                              Container(
                                height: 80 * ratio,
                                decoration: BoxDecoration(
                                  color: isToday
                                      ? _primary
                                      : _primary.withAlpha(77),
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                              ),
                              context.vXs,
                              Text(
                                _dayLabel(d, dayFormatter),
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Theme.of(context).colorScheme.onSurface.withAlpha(115),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                context.vMd,
                Row(
                  children: [
                    Dot(color: _primary),
                    context.hSm,
                    Text(
                      context.tr.today,
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
                      ),
                    ),
                    context.hMd,
                    Dot(color: _primary.withAlpha(77)),
                    context.hSm,
                    Text(
                      context.tr.prevs_day,
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatAmount(double amount) {
    if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(1)}k';
    }
    return amount.toStringAsFixed(0);
  }

  String _dayLabel(WeeklyRevenuePointModel point, DateFormat dayFormatter) {
    try {
      return dayFormatter.format(DateTime.parse(point.date));
    } catch (_) {
      return point.day;
    }
  }
}
