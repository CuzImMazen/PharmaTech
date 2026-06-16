import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF10B981); // emerald green — matches React
  static const primaryVariant = Color(0xFF059669); // darker shade
  static const secondary = Color(0xFF60A5FA); // blue accent

  // ☀️ LIGHT
  static const backgroundLight = Color(0xFFFFFFFF);
  static const surfaceLight = Color(0xFFF8FAFC); // input backgrounds
  static const cardLight = Color(0xFFFFFFFF);
  static const foregroundLight = Color(0xFF1A202C);
  static const mutedLight = Color(0xFF94A3B8); // Slate 400
  static const mutedForegroundLight = Color(0xFF718096);
  static const borderLight = Color(0xFFE2E8F0);

  // 🌙 DARK — deep teal-navy (matches React dark theme)
  static const backgroundDark = Color(0xFF0D1B2A); // deep navy base
  static const surfaceDark = Color(0xFF162637); // card / input surface
  static const mutedSurfaceDark = Color(0xFF1E3550); // muted containers
  static const foregroundDark = Color(0xFFE2E8F0);
  static const mutedForegroundDark = Color(0xFF94A3B8);
  static const borderDark = Color(0xFF2D4A66);
  static const mutedDark = Color(0xFF94A3B8);

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
}
