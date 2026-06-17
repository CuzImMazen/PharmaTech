import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/widgets/dot.dart';

class WeeklyRevenueCard extends StatelessWidget {
  const WeeklyRevenueCard({super.key});

  static const _weeklyData = [
    {'day': 'Tue', 'amount': 2500},
    {'day': 'Wed', 'amount': 3800},
    {'day': 'Thu', 'amount': 4200},
    {'day': 'Fri', 'amount': 3600},
    {'day': 'Sat', 'amount': 2900},
    {'day': 'Sun', 'amount': 3240},
    {'day': 'Mon', 'amount': 1800, 'isToday': true},
  ];

  static const _primary = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final maxAmount = _weeklyData
        .map((d) => d['amount'] as int)
        .reduce((value, element) => math.max(value, element));

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
                    color: onSurface.withAlpha(128),
                  ),
                ),
              ],
            ),
            context.vMd,

            // Bars
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _weeklyData.map((d) {
                  final isToday = d['isToday'] == true;
                  final ratio = (d['amount'] as int) / maxAmount;

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${((d['amount'] as int) / 1000).toStringAsFixed(1)}k',
                            style: TextStyle(
                              fontSize: 8,
                              color: isToday
                                  ? _primary
                                  : onSurface.withAlpha(115),
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
                            d['day'] as String,
                            style: TextStyle(
                              fontSize: 8,
                              color: onSurface.withAlpha(115),
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
                    color: onSurface.withAlpha(128),
                  ),
                ),
                context.hMd,
                Dot(color: _primary.withAlpha(77)),
                context.hSm,
                Text(
                  context.tr.prevs_day,
                  style: TextStyle(
                    fontSize: 11,
                    color: onSurface.withAlpha(128),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
