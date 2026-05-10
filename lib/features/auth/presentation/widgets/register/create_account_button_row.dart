import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';

class CreateAccountButtonRow extends StatelessWidget {
  const CreateAccountButtonRow({
    super.key,
    required this.onBack,
    required this.onCreateAccount,
  });

  final void Function()? onBack;
  final void Function()? onCreateAccount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Back Button: Now more compact and subtle
        SizedBox(
          height: context.btnLg,
          width: context.btnLg, // Make it a perfect square
          child: TextButton(
            onPressed: onBack,
            style: TextButton.styleFrom(
              backgroundColor: context.colors.surfaceContainerHighest
                  .withValues(alpha: 0.5),
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

        context.hLg, // Horizontal gap
        // Create Account Button: Takes the remaining space
        Expanded(
          child: CustomButton(
            height: context.btnLg,
            onTap: onCreateAccount,
            // Suggested: Add a slight gradient or inner shadow inside CustomButton if possible
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
