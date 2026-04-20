import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/color/appcolors.dart';
import 'package:pharmacy_app/core/theme/app_text_theme.dart';

class AppTheme {
  // ☀️ LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.surfaceLight,

      onSurface: AppColors.foregroundLight,
      onPrimary: Colors.white,

      secondary: AppColors.mutedLight, // 👈 muted text
    ),

    scaffoldBackgroundColor: AppColors.backgroundLight,
  );

  // 🌙 DARK THEME
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,

    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.surfaceDark,

      onSurface: AppColors.foregroundDark,
      onPrimary: Colors.white,

      secondary: AppColors.mutedDark, // 👈 muted text
    ),

    scaffoldBackgroundColor: AppColors.backgroundDark,
  );
}
