import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class OnboardingActionButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onTap;

  const OnboardingActionButton({
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
        borderRadius: BorderRadius.circular(AppBorderRadius.lg),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.lg),
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
          padding: const EdgeInsets.symmetric(vertical: AppPadding.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLastPage
                    ? context.tr.onboarding_start
                    : context.tr.onboarding_next,
                style: context.text.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppSpaces.hSm,
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
