import 'dart:ui';

import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

String capitalize(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}

MedicineStatus getMedicineStatus(int min, int current) {
  if (current <= 0) {
    return MedicineStatus.out;
  }
  if (current <= min) {
    return MedicineStatus.low;
  }
  return MedicineStatus.available;
}

Color getMedicineStatusColor(MedicineStatus status) {
  switch (status) {
    case MedicineStatus.available:
      return AppColors.cozyEmerald; // Green
    case MedicineStatus.low:
      return AppColors.cozyAmber; // Amber
    case MedicineStatus.out:
      return AppColors.cozyRed; // Red
  }
}
