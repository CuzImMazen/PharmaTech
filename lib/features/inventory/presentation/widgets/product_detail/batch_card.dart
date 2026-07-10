import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';

/// A single batch card used in the Batches tab.
///
/// Top section: a status pill (leading) + batch id / received date stacked
/// (trailing). Bottom section: a 2×2 grid of label/value cells separated by a
/// horizontal and a vertical divider (forming a cross).
class BatchCard extends StatelessWidget {
  const BatchCard({super.key, required this.batch});

  final StockBatchModel batch;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Container(
      width: double.infinity,
      padding: context.pAllMd,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.5,
          color: context.colors.outline.withAlpha(170),
        ),
        color: context.colors.surfaceContainer,
      ),
      child: Column(
        children: [
          // Top section: status pill (start) + id/date (end).
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BatchStatusPill(status: batch.status),
              const Spacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        '#${batch.id} · ${batch.batchNumber}',
                        style: context.text.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(height: context.sXs),
                    Text(
                      batch.receivedAt,
                      style: context.text.labelSmall?.copyWith(
                        color: context.muted,
                      ),
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.sMd),
          Divider(
            height: 1,
            thickness: 1,
            color: context.colors.outline.withAlpha(120),
          ),
          SizedBox(height: context.sSm),
          // 2×2 grid with a cross divider.
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _GridCell(
                    label: tr.detail_quantity_on_hand,
                    value: '${batch.quantityOnHand}',
                    ltrValue: true,
                  ),
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: context.colors.outline.withAlpha(120),
                ),
                Expanded(
                  child: _GridCell(
                    label: tr.detail_expiry,
                    value: batch.expiryDate ?? tr.detail_not_available,
                    ltrValue: true,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: context.colors.outline.withAlpha(120),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _GridCell(
                    label: tr.detail_purchase_price,
                    value: '${batch.purchasePrice} ${tr.sp}',
                    ltrValue: true,
                  ),
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: context.colors.outline.withAlpha(120),
                ),
                Expanded(
                  child: _GridCell(
                    label: tr.detail_batch_selling_price,
                    value: '${batch.sellingPrice} ${tr.sp}',
                    accent: true,
                    ltrValue: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GridCell extends StatelessWidget {
  const _GridCell({
    required this.label,
    required this.value,
    this.accent = false,
    this.ltrValue = false,
  });

  final String label;
  final String value;
  final bool accent;
  final bool ltrValue;

  @override
  Widget build(BuildContext context) {
    final valueText = Text(
      value,
      style: context.text.titleSmall?.copyWith(
        color: accent ? context.primary : context.colors.onSurface,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.sSm,
        vertical: context.sSm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.text.labelSmall?.copyWith(color: context.muted),
          ),
          SizedBox(height: context.sXs),
          ltrValue
              ? Directionality(
                  textDirection: TextDirection.ltr,
                  child: valueText,
                )
              : valueText,
        ],
      ),
    );
  }
}

class _BatchStatusPill extends StatelessWidget {
  const _BatchStatusPill({required this.status});

  final StockBatchStatus status;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final (label, color) = switch (status) {
      StockBatchStatus.active => (tr.detail_batch_status_active, AppColors.cozyEmerald),
      StockBatchStatus.expired => (tr.detail_batch_status_expired, AppColors.cozyRed),
      StockBatchStatus.depleted => (tr.detail_batch_status_depleted, AppColors.cozyAmber),
      StockBatchStatus.inactive => (tr.detail_batch_status_inactive, context.muted),
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.sSm,
        vertical: context.sXs,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(context.sHuge),
      ),
      child: Text(
        label,
        style: context.text.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
