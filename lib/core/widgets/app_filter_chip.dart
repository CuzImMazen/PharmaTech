import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

class AppFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const AppFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final chipUnselected = context.mutedSurface;
    final textUnselected = context.muted;

    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      labelStyle: TextStyle(
        color: selected ? Colors.white : textUnselected,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: chipUnselected,
      selectedColor: AppColors.primary,
      showCheckmark: true,
      checkmarkColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
      visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      side: BorderSide.none,
      elevation: 0,
      pressElevation: 0,
    );
  }
}
