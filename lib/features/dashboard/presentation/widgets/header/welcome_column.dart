import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

class WelcomeColumn extends StatelessWidget {
  const WelcomeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${context.tr.welcome} 👋",
          style: context.text.titleLarge?.copyWith(color: Colors.white),
        ),
        context.vSm,
        Text(
          context.tr.here_is_your_pharmacy_summary,
          style: context.text.titleSmall?.copyWith(
            fontSize: 14,
            color: Colors.white.withAlpha(200),
          ),
        ),
      ],
    );
  }
}
