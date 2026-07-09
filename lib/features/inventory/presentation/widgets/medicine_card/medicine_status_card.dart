import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/utils/helpers/helper_functions.dart';

class MedicineStatusCard extends StatelessWidget {
  const MedicineStatusCard({super.key, required this.status});
  final MedicineStockStatus status;

  @override
  Widget build(BuildContext context) {
    Color statusColor = getMedicineStatusColor(status);

    return Container(
      alignment: Alignment.center,

      decoration: BoxDecoration(
        borderRadius: context.rMd,
        color: statusColor.withAlpha(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
        child: Text(
          capitalize(status.name),
          style: context.text.labelSmall?.copyWith(
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
