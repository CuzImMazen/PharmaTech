import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/screen_size.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_text_card.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.model});
  final OnboardingPageModel model;

  @override
  Widget build(BuildContext context) {
    final size = ScreenSize(context);
    final iconSize = size.hp(0.12);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: iconSize * 2,
                  height: iconSize * 2,
                  decoration: BoxDecoration(
                    color: model.color.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(model.icon, size: iconSize, color: model.color),
                ),
                AppSpaces.vXl,
                OnboardingTextCard(
                  title: model.title,
                  description: model.description,
                ),

                SizedBox(height: constraints.maxHeight * 0.05),
              ],
            ),
          ),
        );
      },
    );
  }
}
