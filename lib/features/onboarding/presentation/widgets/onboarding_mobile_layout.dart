import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/utils/helpers/image_helper.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/on_boarding_text.dart';

class OnBoardingMobileLayout extends StatelessWidget {
  const OnBoardingMobileLayout({
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
    final imageHeight = context.isLandScape
        ? context.hp(0.25)
        : context.hp(0.4);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: imageHeight,
            child: AppImage.asset(
              image,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),

          context.vMd,

          OnBoardingText(title: title, description: description),
        ],
      ),
    );
  }
}
