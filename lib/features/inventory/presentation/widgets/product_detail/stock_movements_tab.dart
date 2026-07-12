import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/core/utils/helpers/movement_label.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_movement_model.dart';

/// Tab 4 — Stock Movements: a timeline of every stock-in / stock-out event
/// for this product (newest first). Each tile shows a direction-colored icon,
/// the movement type, the batch number + date, and the signed quantity change.
class StockMovementsTab extends StatelessWidget {
  const StockMovementsTab({
    super.key,
    required this.movements,
    this.isLoading = false,
    this.onRetry,
  });

  final List<StockMovementModel> movements;
  final bool isLoading;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    if (isLoading && movements.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (movements.isEmpty) {
      return const _MovementsEmpty();
    }

    return ListView.separated(
      padding: context.pScreen,
      itemCount: movements.length,
      separatorBuilder: (_, _) => SizedBox(height: context.sSm),
      itemBuilder: (context, index) {
        final movement = movements[index];
        return _MovementTile(movement: movement);
      },
    );
  }
}

class _MovementTile extends StatelessWidget {
  const _MovementTile({required this.movement});

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
              isIn
                  ? Icons.south_west_rounded
                  : Icons.north_east_rounded,
              size: context.iSm,
              color: color,
            ),
          ),
          context.hSm,
          // Type + batch/date.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  movementLabel(tr, movement.movementType),
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
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
}

class _MovementsEmpty extends StatelessWidget {
  const _MovementsEmpty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sXxl),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.swap_vert_rounded,
              size: context.iXl,
              color: context.muted,
            ),
            context.vMd,
            Text(
              context.tr.detail_no_movements,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
            ),
          ],
        ),
      ),
    );
  }
}
