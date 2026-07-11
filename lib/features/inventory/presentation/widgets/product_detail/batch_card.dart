import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';

/// A single batch card used in the Batches tab.
///
/// Top section: a status pill (leading) + batch id / received date stacked
/// (trailing). Bottom section: a 2×2 grid of label/value cells separated by a
/// horizontal and a vertical divider (forming a cross). An active batch shows a
/// "mark expired" action in the header.
class BatchCard extends StatelessWidget {
  const BatchCard({
    super.key,
    required this.batch,
    this.onMarkExpired,
    this.isMutating = false,
  });

  final StockBatchModel batch;
  final VoidCallback? onMarkExpired;
  final bool isMutating;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final canExpire =
        batch.status == StockBatchStatus.active && batch.quantityOnHand > 0;

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
          // Top section: status pill (start) + batch number/date (end).
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BatchStatusPill(status: batch.status),
              SizedBox(width: context.sSm),
              const Spacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Text(
                          batch.batchNumber,
                          style: context.text.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    SizedBox(height: context.sXs),
                    Text(
                      '#${batch.id} · ${DateFormatter.toDateOnly(batch.receivedAt) ?? batch.receivedAt}',
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
              if (canExpire || isMutating) ...[
                SizedBox(width: context.sMd),
                _MarkExpiredButton(
                  onTap: isMutating ? null : onMarkExpired,
                  isMutating: isMutating,
                ),
              ],
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
                    value: DateFormatter.toDateOnly(batch.expiryDate) ??
                        tr.detail_not_available,
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

class _MarkExpiredButton extends StatelessWidget {
  const _MarkExpiredButton({this.onTap, required this.isMutating});

  final VoidCallback? onTap;
  final bool isMutating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.iLg,
      height: context.iLg,
      child: Material(
        color: AppColors.cozyRed.withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: context.rMd,
          side: BorderSide(color: AppColors.cozyRed.withAlpha(90)),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: context.rMd,
          ),
          onTap: onTap,
          child: Center(
            child: isMutating
                ? SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.cozyRed,
                    ),
                  )
                : Icon(
                    Icons.event_busy_outlined,
                    size: context.iSm,
                    color: AppColors.cozyRed,
                  ),
          ),
        ),
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
    final valueText = FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(
        value,
        style: context.text.titleSmall?.copyWith(
          color: accent ? context.primary : context.colors.onSurface,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      ),
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
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
