import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/screen_size.dart';
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
    final size = ScreenSize(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.wp(0.05),
                  vertical: AppPadding.xl,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OnboardingIconContainer(
                      color: model.color,
                      icon: model.icon,
                    ),

                    AppSpaces.vXxl,

                    OnboardingTextCard(
                      title: model.title,
                      description: model.description,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
