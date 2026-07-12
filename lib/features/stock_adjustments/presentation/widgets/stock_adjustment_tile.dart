import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/core/utils/helpers/movement_label.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_movement_model.dart';

/// A single row in the Stock Adjustments log. Derived from the per-product
/// `_MovementTile` (stock_movements_tab) but adds a **product name** line,
/// since the log spans all products. Direction-colored icon, the localized
/// adjustment-type label, the batch number + date, an optional note, and the
/// signed quantity change (green + / red −).
class StockAdjustmentTile extends StatelessWidget {
  const StockAdjustmentTile({super.key, required this.movement});

  final StockMovementModel movement;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final isIn = movement.movementType.direction == StockMovementDirection.in_;
    final color = isIn ? AppColors.cozyEmerald : AppColors.cozyRed;
    final sign = isIn ? '+' : '';
    final signed = '$sign${movement.quantityChange}';

    return Container(
      padding: context.pAllSm,
      decoration: BoxDecoration(
        borderRadius: context.rLg,
        border: Border.all(color: context.colors.outline.withAlpha(120)),
        color: context.colors.surfaceContainer,
      ),
      child: Row(
        children: [
          // Direction-colored circular icon.
          Container(
            width: context.iLg,
            height: context.iLg,
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isIn ? Icons.south_west_rounded : Icons.north_east_rounded,
              size: context.iSm,
              color: color,
            ),
          ),
          context.hSm,
          // Product name + type + batch/date + notes.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_productName(context).isNotEmpty) ...[
                  Text(
                    _productName(context),
                    style: context.text.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: context.sXs),
                ],
                Text(
                  movementLabel(tr, movement.movementType),
                  style: context.text.bodyMedium?.copyWith(
                    color: context.muted,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: context.sXs),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    [
                      movement.batchNumber != null
                          ? '#${movement.batchNumber}'
                          : null,
                      DateFormatter.toDateOnly(movement.createdAt) ??
                          movement.createdAt,
                    ].whereType<String>().join(' · '),
                    style: context.text.labelSmall?.copyWith(
                      color: context.muted,
                    ),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (movement.notes != null && movement.notes!.isNotEmpty) ...[
                  SizedBox(height: context.sXs),
                  Text(
                    movement.notes!,
                    style: context.text.labelSmall?.copyWith(
                      color: context.muted,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          context.hSm,
          // Signed quantity change.
          Directionality(
            textDirection: TextDirection.ltr,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                signed,
                style: context.text.titleMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Picks the product name for the current locale. Falls back to whichever
  /// name is present if only one is set.
  String _productName(BuildContext context) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final ar = movement.productArName;
    final en = movement.productName;
    if (isAr) return (ar != null && ar.isNotEmpty) ? ar : (en ?? '');
    return (en != null && en.isNotEmpty) ? en : (ar ?? '');
  }
}
