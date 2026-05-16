import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

import 'package:pharmacy_app/core/widgets/custom_button.dart';

class CreateAccountFooter extends StatelessWidget {
  const CreateAccountFooter({
    super.key,
    required this.onBack,
    required this.onTap,
  });

  final void Function()? onBack;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: context.btnLg,
          width: context.btnLg,
          child: TextButton(
            onPressed: onBack,
            style: TextButton.styleFrom(
              backgroundColor: context.colors.surfaceContainerHighest
                  .withValues(alpha: 1.5),
              shape: RoundedRectangleBorder(borderRadius: context.rXl),
              padding: EdgeInsets.zero,
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ),

        context.hLg,

        Expanded(
          child: CustomButton(
            height: context.btnLg,
            onTap: onTap,

            child: Text(
              context.tr.create_account,
              style: context.text.labelLarge?.copyWith(
                color: context.colors.onPrimary,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
