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
    final double progress = minStock <= 0
        ? (currentStock > 0 ? 1.0 : 0.0)
        : (currentStock / minStock).clamp(0.0, 1.0);
    final MedicineStockStatus status = currentStock <= 0
        ? MedicineStockStatus.out
        : (minStock > 0 && currentStock < minStock)
        ? MedicineStockStatus.low
        : MedicineStockStatus.available;
    statusColor(MedicineStockStatus status) {
      switch (status) {
        case MedicineStockStatus.available:
          return AppColors.cozyEmerald;
        case MedicineStockStatus.low:
          return AppColors.cozyAmber;
        case MedicineStockStatus.out:
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
