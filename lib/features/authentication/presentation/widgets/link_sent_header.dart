import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/icon_container.dart';

class LinkSentHeader extends StatelessWidget {
  const LinkSentHeader({
    super.key,
    required this.email,
    required this.title,
    required this.subtitle,
  });

  final String email;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    final mutedStyle = context.text.bodyLarge!.copyWith(color: context.muted);

    final emailStyle = context.text.bodyLarge!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: context.text.bodyLarge!.fontSize! + 2,
    );

    return Column(
      children: [
        IconContainer(icon: LucideIcons.mail),

        context.vXxl,

        Text(
          title,
          style: context.text.headlineLarge,
          textAlign: TextAlign.center,
        ),

        context.vXl,

        Text(subtitle, style: mutedStyle, textAlign: TextAlign.center),

        context.vMd,

        Text(email, style: emailStyle, textAlign: TextAlign.center),
      ],
    );
  }
}
