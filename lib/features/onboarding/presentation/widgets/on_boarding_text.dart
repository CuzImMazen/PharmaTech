import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.text.headlineMedium,
          textAlign: TextAlign.center,
        ),

        context.vMd,

        Text(
          description,
          style: context.text.bodyLarge!.copyWith(color: context.muted),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
