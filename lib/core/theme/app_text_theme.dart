import 'package:flutter/material.dart';

class AppTextTheme {
  static const TextTheme textTheme = TextTheme(
    // DISPLAY
    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
      height: 1.1,
    ),
    displayMedium: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3,
      height: 1.15,
    ),
    displaySmall: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
      height: 1.15,
    ),

    // HEADLINES
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      height: 1.2,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.25,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.25,
    ),

    // TITLES
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.3,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),

    // LABELS
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),

    // BODY
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.4,
    ),
  );
}
