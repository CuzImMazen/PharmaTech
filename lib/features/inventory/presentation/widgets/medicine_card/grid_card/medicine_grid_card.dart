import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/grid_card/medicine_grid_card_header.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_catgeory_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_name_column.dart';

class MedicineGridCard extends StatelessWidget {
  const MedicineGridCard({super.key, required this.product});

  final ProductCardModel product;

  @override
  Widget build(BuildContext context) {
    final int currentStock = product.quantity.toInt();
    final MedicineStockStatus status = product.status;
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
            MedicineNameColumn(name: product.name, arName: product.arName),

            MedicineCategoryCard(categoryName: product.category.name),
            context.vMd,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentStock.toString(),
                      style: context.text.titleSmall,
                    ),
                    context.vXs,
                    Text(
                      product.baseUnit?.name ?? context.tr.inventory_unit,
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
                    Text(
                      product.price.toString(),
                      style: context.text.titleSmall,
                    ),
                    context.vXs,
                    Text(
                      context.tr.inventory_price,
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
