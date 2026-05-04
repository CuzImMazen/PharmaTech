import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class PillContainer extends StatelessWidget {
  const PillContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.sXl),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: context.sXl,
            spreadRadius: context.sSm,
          ),
        ],
      ),
      child: Icon(
        LucideIcons.pill,
        size: context.iHuge,
        color: context.colors.primary,
      ),
    );
  }
}
