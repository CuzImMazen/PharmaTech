import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/utils/helpers/helper_functions.dart';
import 'package:pharmacy_app/core/widgets/dot.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_status_card.dart';

class MedicineGridCardHeader extends StatelessWidget {
  const MedicineGridCardHeader({super.key, required this.status});
  final MedicineStockStatus status;

  @override
  Widget build(BuildContext context) {
    final statusColor = getMedicineStatusColor(status);
    return Row(
      children: [
        Dot(color: statusColor),
        const Spacer(),
        MedicineStatusCard(status: status),
      ],
    );
  }
}
