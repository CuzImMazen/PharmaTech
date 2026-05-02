import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class OnboardingTextCard extends StatelessWidget {
  const OnboardingTextCard({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: context.colors.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.lg,
          vertical: AppPadding.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.text.headlineLarge,
            ),

            AppSpaces.vMd,

            Text(
              description,
              textAlign: TextAlign.center,
              style: context.text.bodyLarge?.copyWith(
                color: context.muted,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
