import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/batch_card.dart';

/// Tab 2 — Stock (Batches): a header row (count trailing, "Add batch" button
/// leading) followed by a list of [BatchCard]s. Shows an empty placeholder
/// when there are no batches.
class BatchesTab extends StatelessWidget {
  const BatchesTab({
    super.key,
    required this.batches,
    this.mutatingBatchId,
    this.onAddBatch,
    this.onMarkExpired,
  });

  final List<StockBatchModel> batches;

  /// The id of the batch currently being mutated, so its card shows a spinner.
  final int? mutatingBatchId;

  final VoidCallback? onAddBatch;

  /// Called with a batch id when the user marks a batch expired.
  final ValueChanged<int>? onMarkExpired;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return ListView(
      padding: context.pScreen,
      children: [
        // Header row: add button (start) + count (end).
        Row(
          children: [
            _AddBatchButton(onTap: onAddBatch),
            const Spacer(),
            Text(
              tr.detail_batches_count(batches.length),
              style: context.text.labelMedium?.copyWith(color: context.muted),
            ),
          ],
        ),
        context.vMd,
        if (batches.isEmpty)
          _BatchesEmpty()
        else
          ...batches.map(
            (batch) => Padding(
              padding: EdgeInsets.only(bottom: context.sMd),
              child: BatchCard(
                batch: batch,
                onMarkExpired:
                    onMarkExpired == null ? null : () => onMarkExpired!(batch.id),
                isMutating: mutatingBatchId == batch.id,
              ),
            ),
          ),
      ],
    );
  }
}

class _AddBatchButton extends StatelessWidget {
  const _AddBatchButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: context.rLg,
        side: BorderSide(color: context.primary, width: 1.5),
      ),
      child: InkWell(
        borderRadius: context.rLg,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sMd,
            vertical: context.sSm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, size: context.iSm, color: context.primary),
              SizedBox(width: context.sXs),
              Text(
                tr.detail_add_batch,
                style: context.text.labelLarge?.copyWith(
                  color: context.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BatchesEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sXxl),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: context.iXl,
              color: context.muted,
            ),
            context.vMd,
            Text(
              context.tr.detail_no_batches,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
            ),
          ],
        ),
      ),
    );
  }
}
