import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

// ==========================================================================
// API: BuildContext Extension
// This handles all your layout, spacing, and responsive needs via 'context'
// ==========================================================================
extension AppDesignSystem on BuildContext {
  // Internal private scaler
  double _s(double value) => AppScale.size(this, value);

  // 1. SCREEN SIZE HELPERS (From your ScreenSize class)
  // ------------------------------------------------------------------------
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get shortestSide => MediaQuery.sizeOf(this).shortestSide;

  /// Returns height based on percentage of screen (0.1 = 10%)
  double hp(double percent) => screenHeight * percent;

  /// Returns width based on percentage of screen (0.1 = 10%)
  double wp(double percent) => screenWidth * percent;

  // check device mode
  bool get isLandScape => screenWidth > screenHeight;

  // 2. RAW SCALED VALUES (Doubles)
  // ------------------------------------------------------------------------
  double get sXs => _s(4);
  double get sSm => _s(8);
  double get sMd => _s(16);
  double get sLg => _s(24);
  double get sXl => _s(32);
  double get sXxl => _s(48);
  double get sHuge => _s(64);
  double get sMassive => _s(128);

  // 3. VERTICAL SPACING (SizedBox)
  // ------------------------------------------------------------------------
  SizedBox get vXs => SizedBox(height: sXs);
  SizedBox get vSm => SizedBox(height: sSm);
  SizedBox get vMd => SizedBox(height: sMd);
  SizedBox get vLg => SizedBox(height: sLg);
  SizedBox get vXl => SizedBox(height: sXl);
  SizedBox get vXxl => SizedBox(height: sXxl);
  SizedBox get vHuge => SizedBox(height: sHuge);

  // 4. HORIZONTAL SPACING (SizedBox)
  // ------------------------------------------------------------------------
  SizedBox get hXs => SizedBox(width: sXs);
  SizedBox get hSm => SizedBox(width: sSm);
  SizedBox get hMd => SizedBox(width: sMd);
  SizedBox get hLg => SizedBox(width: sLg);
  SizedBox get hXl => SizedBox(width: sXl);

  // 5. PADDING PRESETS
  // ------------------------------------------------------------------------
  EdgeInsets get pAllSm => EdgeInsets.all(sSm);
  EdgeInsets get pAllMd => EdgeInsets.all(sMd);
  EdgeInsets get pAllLg => EdgeInsets.all(sLg);
  EdgeInsets get pHorizontal => EdgeInsets.symmetric(horizontal: sMd);
  EdgeInsets get pVertical => EdgeInsets.symmetric(vertical: sSm);
  EdgeInsets get pScreen =>
      EdgeInsets.symmetric(horizontal: sMd, vertical: sSm);

  // 6. RADIUS PRESETS (BorderRadius)
  // ------------------------------------------------------------------------
  BorderRadius get rSm => BorderRadius.circular(_s(AppRadius.sm));
  BorderRadius get rMd => BorderRadius.circular(_s(AppRadius.md));
  BorderRadius get rLg => BorderRadius.circular(_s(AppRadius.lg));
  BorderRadius get rXl => BorderRadius.circular(_s(AppRadius.xl));

  // Semantic Radius
  BorderRadius get rButton => rLg;
  BorderRadius get rCard => rMd;
  BorderRadius get rDialog => rXl;

  // 7. ICON & COMPONENT SPECIFIC SIZES
  // ------------------------------------------------------------------------
  double get iXs => _s(AppIconSizes.xs);
  double get iSm => _s(AppIconSizes.sm);
  double get iMd => _s(AppIconSizes.md);
  double get iLg => _s(AppIconSizes.lg);
  double get iXl => _s(AppIconSizes.xl);
  double get iXxl => _s(AppIconSizes.xxl);
  double get iHuge => _s(AppIconSizes.huge);
  double get iMassive => _s(AppIconSizes.massive);

  double get btnSm => _s(AppButtonSizes.sm);
  double get btnMd => _s(AppButtonSizes.md);
  double get btnLg => _s(AppButtonSizes.lg);
  double get btnXl => _s(AppButtonSizes.xl);

  // Helpers
  SizedBox get shrink => const SizedBox.shrink();
}

// ==========================================================================
// API: Theme & Color Extensions
// This allows you to access colors and text styles via 'context' for cleaner code
// ==========================================================================

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

// ==========================================================================
// API: TextTheme Extension
// This allows you to access text styles via 'context.text' for cleaner code
// ==========================================================================

extension TextThemeExt on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
}

// ==========================================================================
// ENGINE: Constants & Scaling Logic
// ==========================================================================

class AppScale {
  static const double _baseWidth = 375;

  static double factor(BuildContext context) {
    // MediaQuery.sizeOf is faster and prevents unnecessary rebuilds
    final width = MediaQuery.sizeOf(context).width;
    final scale = width / _baseWidth;
    return scale.clamp(0.85, 1.3);
  }

  static double size(BuildContext context, double value) {
    return value * factor(context);
  }
}

class AppIconSizes {
  static const xs = 16.0;
  static const sm = 20.0;
  static const md = 24.0;
  static const lg = 32.0;
  static const xl = 48.0;
  static const xxl = 64.0;
  static const huge = 96.0;
  static const massive = 128.0;
}

class AppButtonSizes {
  static const sm = 40.0;
  static const md = 48.0;
  static const lg = 56.0;
  static const xl = 65.0;
}

class AppRadius {
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
}
