import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

class StockProgressBar extends StatelessWidget {
  final int currentStock;
  final int minStock;

  const StockProgressBar({
    super.key,
    required this.currentStock,
    required this.minStock,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (currentStock / minStock).clamp(0.0, 1.0);
    MedicineStatus status = currentStock >= minStock
        ? MedicineStatus.available
        : (currentStock > 0 && currentStock < minStock)
        ? MedicineStatus.low
        : MedicineStatus.out;
    statusColor(MedicineStatus status) {
      switch (status) {
        case MedicineStatus.available:
          return AppColors.cozyEmerald;
        case MedicineStatus.low:
          return AppColors.cozyAmber;
        case MedicineStatus.out:
          return AppColors.cozyRed;
      }
    }

    return SizedBox(
      height: 10,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: context.colors.surface,
          valueColor: AlwaysStoppedAnimation<Color>(statusColor(status)),
        ),
      ),
    );
  }
}
