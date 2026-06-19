import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

extension ThemeColors on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  Brightness get brightness => Theme.of(this).brightness;

  bool get isDark => brightness == Brightness.dark;

  Color get primary => colors.primary;
  Color get surface => colors.surface;
  Color get onSurface => colors.onSurface;
  Color get mutedSurface =>
      isDark ? AppColors.mutedSurfaceDark : AppColors.mutedSurfaceLight;

  Color get muted => isDark ? AppColors.mutedDark : AppColors.mutedLight;
}
