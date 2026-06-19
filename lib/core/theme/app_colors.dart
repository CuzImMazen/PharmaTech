import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF10B981); // emerald green
  static const primaryVariant = Color(0xFF059669);
  static const secondary = Color(0xFF60A5FA); // blue accent

  // ☀️ LIGHT MODE (Progressive depths using Tailwind Slate steps)
  static const backgroundLight = Color(
    0xFFF8FAFC,
  ); // Slate 50 (App canvas base)
  static const cardLight = Color(
    0xFFFFFFFF,
  ); // Pure White (Pops off the canvas)
  static const surfaceLight = Color(
    0xFFF1F5F9,
  ); // Slate 100 (Inputs, inner badges)
  static const mutedSurfaceLight = Color(
    0xFFE2E8F0,
  ); // Slate 200 (Deepest nested chips/tracks)

  static const foregroundLight = Color(0xFF0F172A); // Slate 900
  static const mutedLight = Color(0xFF94A3B8); // 🟢 Restored original Slate 400
  static const mutedForegroundLight = Color(0xFF64748B); // Slate 500
  static const borderLight = Color(0xFFE2E8F0); // Slate 200

  // 🌙 DARK MODE (Progressive deep teal-navy steps)
  static const backgroundDark = Color(0xFF0B131E); // Ultra deep navy base
  static const cardDark = Color(0xFF111C2A); // Main parent card
  static const surfaceDark = Color(0xFF1B2A3C); // Inner cards/Badges (Lighter)
  static const mutedSurfaceDark = Color(
    0xFF24374E,
  ); // Active inputs / chip state background

  static const foregroundDark = Color(0xFFF8FAFC); // Slate 50
  static const mutedDark = Color(0xFF94A3B8); // 🟢 Restored original Slate 400
  static const mutedForegroundDark = Color(0xFF94A3B8); // Slate 400
  static const borderDark = Color(0xFF1E2F45);

  // Gradients
  static const splashGradient = [
    Color(0xFF059669),
    Color(0xFF10B981),
    Color(0xFF34D399),
  ];

  static const dashBoardHeaderGradient = [
    Color(0xFF065f46),
    Color(0xFF059669),
    Color(0xFF34d399),
  ];

  // Semantic / accent
  static const destructive = Color(0xFFEF4444);
  static const cozyBlue = Color(0xFF60A5FA);
  static const cozyPurple = Color(0xFF8B5CF6);
  static const cozyAmber = Color(0xFFFBBF24);
  static const cozyEmerald = Color(0xFF34D399);
  static const cozyCyan = Color(0xFF22D3EE);
  static const cozyPink = Color(0xFFF472B6);
  static const cozyRed = Color(0xFFEF4444);
  static const cozyRose = Color(0xFFFB7185);
  static const cozyFuchsia = Color(0xFFE879F9);
  static const cozyIndigo = Color(0xFF818CF8);
  static const cozySky = Color(0xFF38BDF8);
  static const cozyTeal = Color(0xFF2DD4BF);
  static const cozyLime = Color(0xFFA3E635);
  static const cozyOrange = Color(0xFFFB923C);
  static const cozyViolet = Color(0xFFA78BFA);
}
