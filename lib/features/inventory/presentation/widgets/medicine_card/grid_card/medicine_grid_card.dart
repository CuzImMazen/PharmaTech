import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/utils/helpers/helper_functions.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/grid_card/medicine_grid_card_header.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_catgeory_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_name_column.dart';

class MedicineGridCard extends StatelessWidget {
  const MedicineGridCard({
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
            MedicineGridCardHeader(status: status),
            context.vSm,
            MedicineNameColumn(name: name, arName: arName),

            MedicineCategoryCard(categoryName: 'Cardiovascular'),
            context.vMd,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("240", style: context.text.titleSmall),
                    context.vXs,
                    Text(
                      "Box",
                      style: context.text.labelMedium?.copyWith(
                        color: context.muted,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("240 SP", style: context.text.titleSmall),
                    context.vXs,
                    Text(
                      "Price",
                      style: context.text.labelMedium?.copyWith(
                        color: context.muted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
