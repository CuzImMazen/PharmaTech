import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';

class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
}

extension RadiusExtension on BuildContext {
  BorderRadius get rSm =>
      BorderRadius.circular(AppScale.size(this, AppRadius.sm));

  BorderRadius get rMd =>
      BorderRadius.circular(AppScale.size(this, AppRadius.md));

  BorderRadius get rLg =>
      BorderRadius.circular(AppScale.size(this, AppRadius.lg));

  BorderRadius get rXl =>
      BorderRadius.circular(AppScale.size(this, AppRadius.xl));

  // semantic naming (good for large apps)
  BorderRadius get card => rMd;
  BorderRadius get button => rLg;
  BorderRadius get dialog => rXl;
}
