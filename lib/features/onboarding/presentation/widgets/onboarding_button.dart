import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';

import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/radius_ext.dart';
import 'package:pharmacy_app/core/extensions/space_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class OnboardingButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onTap;

  const OnboardingButton({
    super.key,
    required this.isLastPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: context.rLg,
        child: Container(
          height: AppButtonSizes.md,
          decoration: BoxDecoration(
            borderRadius: context.rLg,
            gradient: LinearGradient(
              colors: [
                context.colors.primary,
                context.colors.primary.withValues(alpha: 0.85),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: context.colors.primary.withValues(alpha: 0.25),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isLastPage
                      ? context.tr.onboarding_start
                      : context.tr.onboarding_next,
                  style: context.text.labelLarge?.copyWith(
                    color: context.colors.onPrimary,
                  ),
                ),
                context.hSm,
                Icon(Icons.arrow_forward, color: context.colors.onPrimary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
