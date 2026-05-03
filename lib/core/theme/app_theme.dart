import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy_app/core/theme/appcolors.dart';
import 'package:pharmacy_app/core/theme/app_text_theme.dart';

class AppTheme {
  // ☀️ LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,

      surface: AppColors.surfaceLight,
      onSurface: AppColors.foregroundLight,
      onPrimary: Colors.white,
    ),

    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
  );

  // 🌙 DARK THEME
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,

      surface: AppColors.surfaceDark,
      onSurface: AppColors.foregroundDark,
      onPrimary: Colors.white,
    ),

    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
}
