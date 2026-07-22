import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';

/// Compact date-range picker used on every report that supports filtering.
class DateRangeFilter extends StatelessWidget {
  const DateRangeFilter({
    super.key,
    required this.range,
    required this.onChanged,
  });

  final DateTimeRange? range;
  final ValueChanged<DateTimeRange?> onChanged;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Row(
      children: [
        Expanded(
          child: _Chip(
            label: range != null
                ? DateFormatter.toDateOnly(range!.start.toIso8601String()) ??
                    tr.reports_date_from
                : tr.reports_date_from,
            icon: Icons.calendar_today_rounded,
            onTap: () => _pickRange(context),
          ),
        ),
        context.hSm,
        Icon(Icons.arrow_forward_rounded, size: 16, color: context.muted),
        context.hSm,
        Expanded(
          child: _Chip(
            label: range != null
                ? DateFormatter.toDateOnly(range!.end.toIso8601String()) ??
                    tr.reports_date_to
                : tr.reports_date_to,
            icon: Icons.calendar_today_rounded,
            onTap: () => _pickRange(context),
          ),
        ),
      ],
    );
  }

  Future<void> _pickRange(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(now.year + 1, 12, 31),
      initialDateRange: range ??
          DateTimeRange(
            start: now.subtract(const Duration(days: 30)),
            end: now,
          ),
    );
    if (picked != null) onChanged(picked);
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surfaceContainer,
      borderRadius: context.rMd,
      child: InkWell(
        borderRadius: context.rMd,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sMd,
            vertical: context.sSm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: context.muted),
              context.hSm,
              Expanded(
                child: Text(
                  label,
                  style: context.text.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
