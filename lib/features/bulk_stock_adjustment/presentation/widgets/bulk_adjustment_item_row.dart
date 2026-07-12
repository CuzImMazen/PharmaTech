import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_dropdown_field.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/bulk_stock_adjustment/cubit/bulk_stock_adjustment_cubit.dart';
import 'package:pharmacy_app/features/bulk_stock_adjustment/cubit/bulk_stock_adjustment_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';

/// One editable line in the Bulk Stock Adjustment form. Each row can be an
/// `add` (new batch) or `remove` (draw down an existing batch); the add/remove
/// toggle swaps which fields are shown. The product dropdown is shared; for
/// `remove` rows, selecting a product loads its active, in-stock batches into
/// a batch dropdown. A delete button removes the row.
class BulkAdjustmentItemRow extends StatelessWidget {
  const BulkAdjustmentItemRow({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BulkStockAdjustmentCubit>();
    return BlocBuilder<BulkStockAdjustmentCubit, BulkStockAdjustmentState>(
      buildWhen: (p, c) {
        if (index >= p.items.length || index >= c.items.length) return true;
        if (p.items[index] != c.items[index]) return true;
        if (p.rowErrors[index] != c.rowErrors[index]) return true;
        if (p.products != c.products || p.isProductsLoading != c.isProductsLoading) return true;
        return false;
      },
      builder: (context, state) {
        if (index >= state.items.length) return const SizedBox.shrink();
        final item = state.items[index];
        final errorKey = state.rowErrors[index];
        return Container(
          margin: EdgeInsets.only(bottom: context.sMd),
          padding: context.pAllMd,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: context.colors.outline.withAlpha(120)),
            color: context.colors.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: add/remove toggle + delete.
              Row(
                children: [
                  Expanded(child: _TypeToggle(index: index, type: item.type)),
                  context.hSm,
                  IconButton(
                    icon: Icon(Icons.delete_outline, color: context.colors.error),
                    onPressed: () => cubit.removeItem(index),
                  ),
                ],
              ),
              context.vSm,
              // Product picker (shared by both directions).
              CustomDropdownField<ProductCardModel>(
                labelText: context.tr.bulk_item_product,
                hintText: context.tr.bulk_item_product_hint,
                items: state.products,
                itemLabel: (p) => p.name,
                value: item.product,
                onChanged: (p) => cubit.setItemProduct(index, p),
                isLoading: state.isProductsLoading,
                hasError: state.hasProductsError,
                onRetry: cubit.reloadOptions,
              ),
              if (errorKey == BulkRowError.productRequired.name) ...[
                context.vXs,
                _ErrorText(text: context.tr.bulk_item_product_required),
              ],
              context.vSm,
              // Direction-specific fields.
              if (item.type == BulkAdjustmentType.add)
                _AddFields(index: index, item: item, errorKey: errorKey)
              else
                _RemoveFields(index: index, item: item, errorKey: errorKey),
            ],
          ),
        );
      },
    );
  }
}

class _TypeToggle extends StatelessWidget {
  const _TypeToggle({required this.index, required this.type});

  final int index;
  final BulkAdjustmentType type;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BulkStockAdjustmentCubit>();
    final tr = context.tr;
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(context.sMd),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: _ToggleChip(
              label: tr.bulk_add,
              selected: type == BulkAdjustmentType.add,
              onTap: () => cubit.setAdjustmentType(index, BulkAdjustmentType.add),
            ),
          ),
          Expanded(
            child: _ToggleChip(
              label: tr.bulk_remove,
              selected: type == BulkAdjustmentType.remove,
              onTap: () =>
                  cubit.setAdjustmentType(index, BulkAdjustmentType.remove),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleChip extends StatelessWidget {
  const _ToggleChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? context.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(context.sSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(context.sSm),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.sSm),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: context.text.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : context.muted,
            ),
          ),
        ),
      ),
    );
  }
}

/// Fields for an `add` row: quantity, purchase price, selling price, plus an
/// expandable batch-details section (batch number, expiry).
class _AddFields extends StatelessWidget {
  const _AddFields({required this.index, required this.item, this.errorKey});

  final int index;
  final BulkAdjustmentItemInput item;
  final String? errorKey;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BulkStockAdjustmentCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _RowField(
                label: context.tr.bulk_item_quantity,
                initial: item.quantity,
                onChanged: (v) =>
                    cubit.updateItem(index, item.copyWith(quantity: v)),
                digitsOnly: true,
              ),
            ),
            context.hSm,
            Expanded(
              child: _RowField(
                label: context.tr.bulk_item_purchase_price,
                initial: item.purchasePrice,
                onChanged: (v) => cubit.updateItem(
                  index,
                  item.copyWith(purchasePrice: v),
                ),
              ),
            ),
          ],
        ),
        context.vSm,
        _RowField(
          label: context.tr.bulk_item_selling_price,
          initial: item.sellingPrice,
          onChanged: (v) =>
              cubit.updateItem(index, item.copyWith(sellingPrice: v)),
        ),
        if (errorKey == BulkRowError.priceRequired.name) ...[
          context.vXs,
          _ErrorText(text: context.tr.bulk_item_price_required),
        ] else if (errorKey == BulkRowError.qtyRequired.name) ...[
          context.vXs,
          _ErrorText(text: context.tr.bulk_item_qty_required),
        ],
        context.vSm,
        // Expandable optional batch details.
        InkWell(
          onTap: () => cubit.toggleItemExpanded(index),
          child: Row(
            children: [
              Icon(
                item.expanded
                    ? Icons.expand_less_rounded
                    : Icons.expand_more_rounded,
                size: context.iSm,
                color: context.muted,
              ),
              SizedBox(width: context.sXs),
              Text(
                context.tr.bulk_item_batch_details,
                style: context.text.bodyMedium?.copyWith(
                  color: context.muted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (item.expanded) ...[
          context.vSm,
          _RowField(
            label:
                '${context.tr.bulk_item_batch_number} (${context.tr.bulk_item_optional})',
            initial: item.batchNumber,
            onChanged: (v) =>
                cubit.updateItem(index, item.copyWith(batchNumber: v)),
          ),
          context.vSm,
          _DateField(
            label: context.tr.bulk_item_expiry_date,
            value: item.expiryDate,
            onChanged: (v) =>
                cubit.updateItem(index, item.copyWith(expiryDate: v)),
          ),
        ],
        context.vSm,
        _RowField(
          label:
              '${context.tr.bulk_item_notes} (${context.tr.bulk_item_optional})',
          initial: item.notes,
          onChanged: (v) => cubit.updateItem(index, item.copyWith(notes: v)),
          maxLines: 2,
        ),
      ],
    );
  }
}

/// Fields for a `remove` row: batch picker (loaded for the product) + quantity.
class _RemoveFields extends StatelessWidget {
  const _RemoveFields({required this.index, required this.item, this.errorKey});

  final int index;
  final BulkAdjustmentItemInput item;
  final String? errorKey;

  String _batchLabel(StockBatchModel b) {
    final expiry = b.expiryDate ?? '—';
    return '#${b.batchNumber}  ·  ${b.quantityOnHand}  ·  $expiry';
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BulkStockAdjustmentCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdownField<StockBatchModel>(
          labelText: context.tr.bulk_item_batch,
          hintText: item.batches.isEmpty
              ? context.tr.bulk_item_no_batches
              : context.tr.bulk_item_batch,
          items: item.batches,
          itemLabel: _batchLabel,
          value: item.selectedBatch,
          onChanged: (b) => cubit.setItemBatch(index, b),
          isLoading: item.isBatchesLoading,
        ),
        if (errorKey == BulkRowError.batchRequired.name) ...[
          context.vXs,
          _ErrorText(text: context.tr.bulk_item_batch_required),
        ],
        context.vSm,
        _RowField(
          label: context.tr.bulk_item_quantity,
          initial: item.quantity,
          onChanged: (v) =>
              cubit.updateItem(index, item.copyWith(quantity: v)),
          digitsOnly: true,
          enabled: item.selectedBatch != null,
        ),
        if (errorKey == BulkRowError.qtyRequired.name) ...[
          context.vXs,
          _ErrorText(text: context.tr.bulk_item_qty_required),
        ] else if (errorKey == BulkRowError.tooMuch.name) ...[
          context.vXs,
          _ErrorText(text: context.tr.remove_stock_too_much),
        ],
        context.vSm,
        _RowField(
          label:
              '${context.tr.bulk_item_notes} (${context.tr.bulk_item_optional})',
          initial: item.notes,
          onChanged: (v) => cubit.updateItem(index, item.copyWith(notes: v)),
          maxLines: 2,
        ),
      ],
    );
  }
}

/// A labeled number/text field that owns its own controller and pushes changes
/// up. Mirrors the purchase-invoice form's `_ItemNumberField`.
class _RowField extends StatefulWidget {
  const _RowField({
    required this.label,
    required this.initial,
    required this.onChanged,
    this.digitsOnly = false,
    this.enabled = true,
    this.maxLines = 1,
  });

  final String label;
  final String initial;
  final ValueChanged<String> onChanged;
  final bool digitsOnly;
  final bool enabled;
  final int maxLines;

  @override
  State<_RowField> createState() => _RowFieldState();
}

class _RowFieldState extends State<_RowField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initial);
    _controller.addListener(_handleChange);
  }

  void _handleChange() => widget.onChanged(_controller.text);

  @override
  void dispose() {
    _controller.removeListener(_handleChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _controller,
      labelText: widget.label,
      hintText: '0',
      keyboardType: widget.digitsOnly
          ? TextInputType.number
          : const TextInputType.numberWithOptions(decimal: true),
      onlyDigits: widget.digitsOnly,
      enabled: widget.enabled,
      height: widget.maxLines == 1 ? null : 80,
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: context.sSm),
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              onChanged(
                '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}',
              );
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: context.muted.withValues(alpha: 0.2),
                  width: 1.5,
                ),
              ),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Row(
              children: [
                Icon(Icons.event_outlined, color: context.muted, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    value.isEmpty ? '—' : value,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ErrorText extends StatelessWidget {
  const _ErrorText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.text.bodySmall?.copyWith(color: context.colors.error),
    );
  }
}
