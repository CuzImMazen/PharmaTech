import 'package:flutter/material.dart';

extension ThemeColors on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  Color get primary => colors.primary;
  Color get surface => colors.surface;
  Color get onSurface => colors.onSurface;
}
