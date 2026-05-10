import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/auth_pill_logo.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthPillLogo(),
        context.vXl,

        Text(title, style: context.text.headlineLarge),

        context.vSm,

        Text(
          subTitle,
          style: context.text.bodyLarge?.copyWith(
            color: context.muted,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
