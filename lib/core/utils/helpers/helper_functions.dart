import 'dart:ui';

import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

String capitalize(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}

MedicineStockStatus getMedicineStatus(int min, int current) {
  if (current <= 0) {
    return MedicineStockStatus.out;
  }
  if (min > 0 && current <= min) {
    return MedicineStockStatus.low;
  }
  return MedicineStockStatus.available;
}

Color getMedicineStatusColor(MedicineStockStatus status) {
  switch (status) {
    case MedicineStockStatus.available:
      return AppColors.cozyEmerald; // Green
    case MedicineStockStatus.low:
      return AppColors.cozyAmber; // Amber
    case MedicineStockStatus.out:
      return AppColors.cozyRed; // Red
  }
}
