import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/helpers/helper_functions.dart';

/// A small pill-shaped status badge with a colored outline, positioned at the
/// trailing edge of the overview header. Color follows the stock status.
class DetailStatusBadge extends StatelessWidget {
  const DetailStatusBadge({super.key, required this.status});

  final MedicineStockStatus status;

  @override
  Widget build(BuildContext context) {
    final color = getMedicineStatusColor(status);
    final label = switch (status) {
      MedicineStockStatus.available => context.tr.stock_status_available,
      MedicineStockStatus.low => context.tr.stock_status_low,
      MedicineStockStatus.out => context.tr.stock_status_out,
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.sSm,
        vertical: context.sXs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.sHuge),
        color: color.withAlpha(25),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 8, color: color),
          SizedBox(width: context.sXs),
          Text(
            label,
            style: context.text.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
