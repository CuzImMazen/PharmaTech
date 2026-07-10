import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';

/// Centered empty state for the Medical Info tab when no medical info exists.
///
/// Graphic: a large, heavily-rounded square holding a line-art alert icon.
/// Below it: a bold title, a muted subtitle, and a solid "+ Add" button.
class MedicalInfoEmptyState extends StatelessWidget {
  const MedicalInfoEmptyState({super.key, this.onAdd});

  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Center(
      child: Padding(
        padding: context.pAllLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Graphic: rounded square with alert icon.
            Container(
              width: context.iHuge,
              height: context.iHuge,
              decoration: BoxDecoration(
                color: AppColors.cozyAmber.withAlpha(25),
                borderRadius: context.rXl,
                border: Border.all(
                  color: AppColors.cozyAmber.withAlpha(120),
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.health_and_safety_outlined,
                size: context.iXl,
                color: AppColors.cozyAmber,
              ),
            ),
            context.vLg,
            Text(
              tr.detail_medical_empty_title,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            context.vSm,
            Text(
              tr.detail_medical_empty_subtitle,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
              textAlign: TextAlign.center,
            ),
            context.vLg,
            CustomButton(
              text: tr.detail_add_medical_info,
              onTap: onAdd,
            ),
          ],
        ),
      ),
    );
  }
}
