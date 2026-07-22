import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

/// Centered empty state shown when a report has no data.
class ReportEmptyState extends StatelessWidget {
  const ReportEmptyState({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Center(
      child: Padding(
        padding: context.pAllMd,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.clipboardList,
              size: context.iXl,
              color: context.muted,
            ),
            context.vMd,
            Text(
              message ?? tr.reports_empty_hint,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
