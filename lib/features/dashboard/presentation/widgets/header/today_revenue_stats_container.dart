import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

class TodayRevenueStatsContainer extends StatelessWidget {
  const TodayRevenueStatsContainer({
    super.key,
    required this.currencyFormatter,
  });

  final NumberFormat currencyFormatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(38),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            _StatItem(
              value: currencyFormatter.format(1800),
              label: context.tr.invoice,
            ),
            _Divider(),
            _StatItem(
              value: currencyFormatter.format(1200),
              label: context.tr.avg_invoice_value,
            ),
            _Divider(),
            _StatItem(
              value: currencyFormatter.format(600),
              label: context.tr.units_sold,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: context.text.titleSmall?.copyWith(
              fontSize: 16,
              color: Colors.white.withAlpha(200),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: context.text.titleSmall?.copyWith(
              fontSize: 12,
              color: Colors.white.withAlpha(150),
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, color: Colors.white.withAlpha(70));
  }
}
