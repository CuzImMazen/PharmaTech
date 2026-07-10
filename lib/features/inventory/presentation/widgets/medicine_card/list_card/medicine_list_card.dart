import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_catgeory_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/list_card/medicine_info_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_name_column.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_status_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/stock_progress_bar.dart';

class MedicineListCard extends StatelessWidget {
  const MedicineListCard({super.key, required this.product, this.onTap});

  final ProductCardModel product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final int minStock = product.minStock.toInt();
    final int currentStock = product.quantity.toInt();
    final MedicineStockStatus status = product.status;
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                MedicineNameColumn(name: product.name, arName: product.arName),
                Spacer(),
                MedicineStatusCard(status: status),
              ],
            ),
            MedicineCategoryCard(categoryName: product.category.name),
            context.vMd,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MedicineInfoCard(
                  label: product.baseUnit?.name ?? context.tr.inventory_unit,
                  value: currentStock.toString(),
                ),
                MedicineInfoCard(
                  label: context.tr.inventory_price,
                  value: product.price.toString(),
                ),
                MedicineInfoCard(
                  label: context.tr.inventory_expiry,
                  value: product.nearestExpiration ?? '--',
                ),
              ],
            ),
            context.vMd,
            Row(
              children: [
                Text(
                  context.tr.inventory_stock_level,
                  style: context.text.bodySmall!.copyWith(color: context.muted),
                ),
                const Spacer(),
                // The value is numeric (inherently LTR); force LTR so the
                // "60/5" reads in the right order and the "(min)" suffix stays
                // next to the 5 in both LTR and RTL locales.
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    '$currentStock/$minStock${context.tr.inventory_stock_min_suffix}',
                    style:
                        context.text.bodySmall!.copyWith(color: context.muted),
                  ),
                ),
              ],
            ),
            context.vMd,
            StockProgressBar(
              currentStock: currentStock,
              minStock: product.minStock.toInt(),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
