import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/helpers/adaptive_layout.dart';


import 'onboarding_mobile_layout.dart';
import 'onboarding_tablet_layout.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.image, required this.title, required this.description});

  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => OnBoardingMobileLayout(
        image: image,
        title: title,
        description: description,
      ),
      tabletLayout: (context) => OnBoardingTabletLayout(
        image: image,
        title: title,
        description: description,
      ),
    );
  }
}
