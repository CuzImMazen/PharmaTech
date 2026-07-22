import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/error/failure.dart';

/// Centered error state shown when a report fails to load.
class ReportErrorState extends StatelessWidget {
  const ReportErrorState({
    super.key,
    required this.failure,
    required this.onRetry,
  });

  final Failure failure;
  final VoidCallback onRetry;

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
              LucideIcons.triangleAlert,
              size: context.iXl,
              color: context.muted,
            ),
            context.vMd,
            Text(
              tr.reports_load_error,
              style: context.text.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            context.vXs,
            Text(
              failure.localizedMessage(context),
              style: context.text.bodyMedium?.copyWith(color: context.muted),
              textAlign: TextAlign.center,
            ),
            context.vMd,
            CustomButton(
              onTap: onRetry,
              text: tr.inventory_retry,
            ),
          ],
        ),
      ),
    );
  }
}
