import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/oboarding_icon_container.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_text_card.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.model});
  final OnboardingPageModel model;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.lg),
        child: Column(
          children: [
            AppSpaces.vXl,
            OboardingIconContainer(color: model.color, icon: model.icon),
            AppSpaces.vXl,

            OnboardingTextCard(
              title: model.title,
              description: model.description,
            ),
          ],
        ),
      ),
    );
  }
}
