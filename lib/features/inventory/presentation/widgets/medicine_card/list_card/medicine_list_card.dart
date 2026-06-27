import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/utils/helpers/helper_functions.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_catgeory_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/list_card/medicine_info_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_name_column.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_status_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/stock_progress_bar.dart';

class MedicineListCard extends StatelessWidget {
  const MedicineListCard({
    super.key,
    required this.name,
    required this.arName,
    required this.minStock,
    required this.currentStock,
  });

  final String name;
  final String arName;
  final int minStock;
  final int currentStock;

  @override
  Widget build(BuildContext context) {
    MedicineStatus status = getMedicineStatus(minStock, currentStock);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          width: 1.5,
          color: Theme.of(context).colorScheme.outline.withAlpha(170),
        ),
        color: context.colors.surfaceContainer,
      ),
      child: Padding(
        padding: context.pAllMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MedicineNameColumn(name: name, arName: arName),
                Spacer(),
                MedicineStatusCard(status: status),
              ],
            ),
            MedicineCategoryCard(categoryName: 'Cardiovascular'),
            context.vMd,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MedicineInfoCard(label: "Box", value: "89"),
                MedicineInfoCard(label: "SP", value: "250"),
                MedicineInfoCard(label: "Patches", value: "15"),
              ],
            ),
            context.vMd,
            Row(
              children: [
                Text(
                  "Stock Level :",
                  style: context.text.bodySmall!.copyWith(color: context.muted),
                ),
                Spacer(),
                Text(
                  "$currentStock/$minStock (Min)",
                  style: context.text.bodySmall!.copyWith(color: context.muted),
                ),
              ],
            ),
            context.vMd,
            StockProgressBar(currentStock: currentStock, minStock: minStock),
          ],
        ),
      ),
    );
  }
}
