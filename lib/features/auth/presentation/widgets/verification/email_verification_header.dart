import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class EmailVerificationHeader extends StatelessWidget {
  const EmailVerificationHeader({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final mutedStyle = context.text.bodyLarge!.copyWith(color: context.muted);

    final emailStyle = context.text.bodyLarge!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: context.text.bodyLarge!.fontSize! + 2,
    );

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(context.sXxl),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colors.primary.withAlpha(30),
          ),
          child: Icon(
            LucideIcons.mail,
            size: 100,
            color: context.colors.primary.withAlpha(150),
          ),
        ),

        context.vXxl,

        Text(
          context.tr.emailVerificationTitle,
          style: context.text.headlineLarge,
          textAlign: TextAlign.center,
        ),

        context.vXl,

        Text(
          context.tr.emailSentTo,
          style: mutedStyle,
          textAlign: TextAlign.center,
        ),

        context.vMd,

        Text(email, style: emailStyle, textAlign: TextAlign.center),
      ],
    );
  }
}
