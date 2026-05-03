import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';

extension SpaceExtension on BuildContext {
  // ===== VALUES =====
  double get xs => AppScale.size(this, 4);
  double get sm => AppScale.size(this, 8);
  double get md => AppScale.size(this, 16);
  double get lg => AppScale.size(this, 24);
  double get xl => AppScale.size(this, 32);
  double get xxl => AppScale.size(this, 48);
  double get huge => AppScale.size(this, 64);

  // ===== SIZEDBOX HELPERS =====
  SizedBox get vXs => SizedBox(height: xs);
  SizedBox get vSm => SizedBox(height: sm);
  SizedBox get vMd => SizedBox(height: md);
  SizedBox get vLg => SizedBox(height: lg);
  SizedBox get vXl => SizedBox(height: xl);
  SizedBox get vXxl => SizedBox(height: xxl);

  SizedBox get hXs => SizedBox(width: xs);
  SizedBox get hSm => SizedBox(width: sm);
  SizedBox get hMd => SizedBox(width: md);
  SizedBox get hLg => SizedBox(width: lg);
  SizedBox get hXl => SizedBox(width: xl);

  SizedBox get empty => const SizedBox.shrink();
}
