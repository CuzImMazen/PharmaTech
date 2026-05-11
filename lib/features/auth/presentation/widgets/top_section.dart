import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title;
  final String subTitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopSectionLogo(icon: icon),
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

class TopSectionLogo extends StatelessWidget {
  const TopSectionLogo({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: context.rXl,
        color: context.colors.primary.withAlpha(50),
      ),
      child: Icon(icon, size: 50, color: context.colors.primary),
    );
  }
}
