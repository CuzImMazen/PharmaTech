import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';

extension PaddingExtension on BuildContext {
  double get xs => AppScale.size(this, 4);
  double get sm => AppScale.size(this, 8);
  double get md => AppScale.size(this, 16);
  double get lg => AppScale.size(this, 24);

  // ===== PRESETS =====
  EdgeInsets get pAllSm => EdgeInsets.all(sm);
  EdgeInsets get pAllMd => EdgeInsets.all(md);
  EdgeInsets get pAllLg => EdgeInsets.all(lg);

  EdgeInsets get pHorizontal => EdgeInsets.symmetric(horizontal: md);

  EdgeInsets get pVertical => EdgeInsets.symmetric(vertical: sm);

  EdgeInsets get pScreen => EdgeInsets.symmetric(horizontal: md, vertical: sm);
}
