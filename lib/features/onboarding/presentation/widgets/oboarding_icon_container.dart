import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/screen_size.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class OnboardingIconContainer extends StatelessWidget {
  const OnboardingIconContainer({
    super.key,
    required this.color,
    required this.icon,
  });
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    ScreenSize size = ScreenSize(context);

    final containerSize = size.wp(0.55).clamp(160.0, 280.0);
    return Container(
      height: containerSize,
      width: containerSize,
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
