import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class OboardingIconContainer extends StatelessWidget {
  const OboardingIconContainer({
    super.key,
    required this.color,
    required this.icon,
  });
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.60;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.xl),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withAlpha(80), context.colors.surface.withAlpha(150)],
        ),

        boxShadow: [
          BoxShadow(
            color: context.colors.onSurface.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(10, 10),
          ),

          BoxShadow(
            color: context.colors.surface.withValues(alpha: 0.8),
            blurRadius: 20,
            offset: const Offset(-6, -6),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: AppIconSizes.massive,
        color: color.withAlpha(200),
      ),
    );
  }
}
