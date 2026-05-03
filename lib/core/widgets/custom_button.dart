import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/extensions/radius_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,

      height: AppButtonSizes.lg,
      child: ElevatedButton(
        onPressed: onTap,
        style:
            ElevatedButton.styleFrom(
              elevation: isDisabled ? 0 : 4,
              shape: RoundedRectangleBorder(borderRadius: context.rXl),
              padding: EdgeInsets.zero,
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return context.colors.primary.withValues(alpha: 0.4);
                }

                return Colors.transparent;
              }),
              shadowColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.transparent;
                }
                return context.colors.primary.withValues(alpha: 0.3);
              }),
            ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: context.rXl,
            gradient: isDisabled
                ? null
                : LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      context.colors.primary,
                      context.colors.primary.withValues(alpha: 0.85),
                    ],
                  ),
          ),
          child: Center(
            child: Text(
              text,

              style: theme.textTheme.labelLarge?.copyWith(
                color: context.colors.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
