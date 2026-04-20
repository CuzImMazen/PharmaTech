import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class PillContainer extends StatelessWidget {
  const PillContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Icon(
        LucideIcons.pill,
        size: AppIconSizes.huge,
        color: context.primary,
      ),
    );
  }
}
