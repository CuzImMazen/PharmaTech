import 'package:flutter/material.dart';

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

class AppScale {
  static const double _baseWidth = 375;

  static double factor(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final scale = width / _baseWidth;

    // Prevent extreme scaling
    return scale.clamp(0.85, 1.3);
  }

  static double size(BuildContext context, double value) {
    return value * factor(context);
  }
}
