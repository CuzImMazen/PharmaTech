import 'package:flutter/material.dart';

class AppTextTheme {
  static const TextTheme textTheme = TextTheme(
    // =========================
    // DISPLAY (optional hero use)
    // =========================
    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
    ),

    displayMedium: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3,
    ),

    displaySmall: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
    ),

    // =========================
    // HEADLINES (screens / onboarding)
    // =========================
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.3,
    ),

    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
    ),

    headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),

    // =========================
    // TITLES (UI structure)
    // =========================
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),

    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),

    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),

    // =========================
    // LABELS (buttons / actions)
    // =========================
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),

    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),

    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),

    // =========================
    // BODY (content / forms)
    // =========================
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.4,
    ),

    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.4,
    ),
  );
}
