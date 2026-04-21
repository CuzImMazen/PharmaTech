import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class AuthPillLogo extends StatelessWidget {
  const AuthPillLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.md),
        color: context.colors.primary.withAlpha(50),
      ),
      child: Icon(LucideIcons.pill, size: 50, color: context.colors.primary),
    );
  }
}
