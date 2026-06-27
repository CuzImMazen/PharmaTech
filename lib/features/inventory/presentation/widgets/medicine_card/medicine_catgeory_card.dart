import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class MedicineCategoryCard extends StatelessWidget {
  final String categoryName;

  const MedicineCategoryCard({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final Color medicalAccent = isDarkMode
        ? const Color(0xFF4FD1C5)
        : const Color(0xFF0D9488);

    final Color backgroundColor = isDarkMode
        ? const Color(0xFF134E4A).withAlpha(100)
        : const Color(0xFFCCFBF1).withAlpha(150);

    return Container(
      decoration: BoxDecoration(
        borderRadius: context.rMd,
        color: backgroundColor,
        border: Border.all(color: medicalAccent.withAlpha(60), width: 1.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      child: Text(
        categoryName,
        style: context.text.labelSmall?.copyWith(
          color: medicalAccent,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
