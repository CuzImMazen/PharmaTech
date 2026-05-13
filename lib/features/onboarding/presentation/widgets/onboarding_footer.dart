import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_button.dart';

class OnboardingFooter extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingFooter({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: isFirst
              ? const SizedBox.shrink()
              : SizedBox(
                  width: 110,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: onBack,
                    icon: Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: context.muted,
                    ),
                    label: Text(
                      context.tr.onboarding_back,
                      style: context.text.bodyLarge?.copyWith(
                        color: context.muted,
                      ),
                    ),
                  ),
                ),
        ),

        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isFirst ? 0 : 12,
        ),

        Expanded(
          child: OnboardingButton(isLastPage: isLast, onTap: onNext),
        ),
      ],
    );
  }
}
