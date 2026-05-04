import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/utils/helpers/image_helper.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/on_boarding_text.dart';

class OnBoardingTabletLayout extends StatelessWidget {
  const OnBoardingTabletLayout({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AppImage.asset(image, fit: BoxFit.contain)),

        Expanded(
          child: Padding(
            padding: context.pScreen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnBoardingText(title: title, description: description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
