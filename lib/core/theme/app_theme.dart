import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/theme/app_text_theme.dart';

class AppTheme {
  static const _radius = Radius.circular(14);
  static const _borderRadius = BorderRadius.all(_radius);

  // ☀️ LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,

      // Layers for stacking light components
      surface: AppColors.surfaceLight, // Mapped for input fields / nested cards
      surfaceContainerLowest:
          AppColors.backgroundLight, // Bottom-most scaffold layer
      surfaceContainer: AppColors
          .cardLight, // Mapped for main parent components (MedicineListCard)
      surfaceContainerHighest: AppColors
          .surfaceLight, // Mapped for innermost structural blocks (MedicineInfoCard)

      onSurface: AppColors.foregroundLight,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      outline: AppColors.borderLight,
    ),

    scaffoldBackgroundColor: AppColors.backgroundLight,

    cardTheme: CardThemeData(
      color: AppColors.cardLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
        side: const BorderSide(color: AppColors.borderLight),
      ),
      margin: EdgeInsets.zero,
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.borderLight,
      thickness: 1,
      space: 1,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      hintStyle: const TextStyle(color: AppColors.mutedForegroundLight),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 16),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.foregroundLight,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.cardLight,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.mutedForegroundLight,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.mutedSurfaceLight,
      selectedColor: AppColors.primary.withAlpha(120),
      // Dynamic text color switching based on state
      labelStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white; // Dynamic text color when selected
          }
          return AppColors.foregroundLight; // Color when unselected
        }).resolve({}),
      ),
      checkmarkColor: AppColors.primary,
      side: const BorderSide(color: AppColors.borderLight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );

  // 🌙 DARK THEME
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,

      // Layers for stacking dark components smoothly
      surface: AppColors.surfaceDark, // Mapped for basic dark inputs/elements
      surfaceContainerLowest:
          AppColors.backgroundDark, // Base scaffold canvas layer
      surfaceContainer:
          AppColors.cardDark, // Deep parent card color (MedicineListCard)
      surfaceContainerHighest: AppColors
          .surfaceDark, // Elevated inner background color (MedicineInfoCard)

      onSurface: AppColors.foregroundDark,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      outline: AppColors.borderDark,
    ),

    scaffoldBackgroundColor: AppColors.backgroundDark,

    cardTheme: CardThemeData(
      color: AppColors.cardDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
        side: const BorderSide(color: AppColors.borderDark),
      ),
      margin: EdgeInsets.zero,
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.borderDark,
      thickness: 1,
      space: 1,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceDark,
      hintStyle: const TextStyle(color: AppColors.mutedForegroundDark),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 16),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.foregroundDark,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.mutedForegroundDark,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.mutedSurfaceDark,
      selectedColor: AppColors.primary.withAlpha(100),
      // Dynamic text color switching based on state
      labelStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white; // Dynamic text color when selected
          }
          return AppColors.foregroundDark; // Color when unselected
        }).resolve({}),
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );
}
