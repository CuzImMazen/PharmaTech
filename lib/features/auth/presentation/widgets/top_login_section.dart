import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/auth_pill_logo.dart';

class TopLoginSection extends StatelessWidget {
  const TopLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthPillLogo(),
        AppSpaces.vXl,

        Text(context.tr.auth_login_title, style: context.text.headlineLarge),

        AppSpaces.vSm,

        Text(
          context.tr.auth_login_subtitle,
          style: context.text.bodyLarge?.copyWith(
            color: context.muted,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
