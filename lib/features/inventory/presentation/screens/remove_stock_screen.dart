import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_dropdown_field.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/core/widgets/form_section_card.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_cubit.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/stock_batch_model.dart';

/// Full-screen Remove Stock form. Records a manual stock-out adjustment for a
/// chosen batch and, on submit, calls [ProductDetailCubit.removeStock] with a
/// snake_case payload.
///
/// It reads the parent [ProductDetailCubit] (re-provided at the route via
/// [BlocProvider.value]) so the updated batch shows up instantly in the
/// Batches tab and the parent screen's BlocListener shows the success/failure
/// snackbar.
///
/// Required backend fields for a `remove`: product_id, batch_id, quantity.
/// Optional: notes. The batch must belong to the product and have enough
/// on-hand quantity (the backend validates with a 422).
class RemoveStockScreen extends StatefulWidget {
  const RemoveStockScreen({super.key, required this.productId});

  final int productId;

  @override
  State<RemoveStockScreen> createState() => _RemoveStockScreenState();
}

class _RemoveStockScreenState extends State<RemoveStockScreen> {
  final _formKey = GlobalKey<FormState>();
  final _quantity = TextEditingController();
  final _notes = TextEditingController();
  StockBatchModel? _selectedBatch;

  @override
  void dispose() {
    _quantity.dispose();
    _notes.dispose();
    super.dispose();
  }

  String _batchLabel(StockBatchModel b) {
    final expiry = b.expiryDate ?? '—';
    return '#${b.batchNumber}  ·  ${b.quantityOnHand}  ·  $expiry';
  }

  void _submit(ProductDetailCubit cubit) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_selectedBatch == null) return;
    cubit.removeStock({
      'product_id': widget.productId,
      'batch_id': _selectedBatch!.id,
      'quantity': int.tryParse(_quantity.text.trim()) ?? 0,
      if (_notes.text.trim().isNotEmpty) 'notes': _notes.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return BlocListener<ProductDetailCubit, ProductDetailState>(
      listenWhen: (p, c) =>
          p.lastBatchAction != c.lastBatchAction ||
          p.batchFailure != c.batchFailure,
      listener: (context, state) {
        // Removed → pop back to the detail screen. The parent's BlocListener
        // shows the success snackbar and the updated batch is already in state.
        if (state.lastBatchAction == BatchActionResult.removed) {
          Navigator.of(context).pop();
          return;
        }
        // On failure the parent shows the snackbar; nothing to do here.
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(tr.remove_stock_title),
        ),
        body: SafeArea(
          child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              final isSaving = state.isRemovingBatch;
              final removableBatches = state.batches
                  .where(
                    (b) =>
                        b.quantityOnHand > 0 &&
                        b.status == StockBatchStatus.active,
                  )
                  .toList();

              // Keep the selection valid if the underlying list changes.
              if (_selectedBatch != null &&
                  !removableBatches.contains(_selectedBatch)) {
                _selectedBatch = null;
              }

              return AbsorbPointer(
                absorbing: isSaving,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: context.pScreen,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr.remove_stock_subtitle,
                              style: context.text.bodyMedium?.copyWith(
                                color: context.muted,
                              ),
                            ),
                            context.vLg,
                            FormSectionCard(
                              title: tr.remove_stock_section,
                              subtitle: tr.remove_stock_section_sub,
                              icon: Icons.remove_shopping_cart_outlined,
                              children: [
                                CustomDropdownField<StockBatchModel>(
                                  labelText: tr.remove_stock_batch,
                                  hintText: removableBatches.isEmpty
                                      ? tr.remove_stock_no_batches
                                      : tr.remove_stock_batch,
                                  items: removableBatches,
                                  itemLabel: _batchLabel,
                                  value: _selectedBatch,
                                  onChanged: (b) =>
                                      setState(() => _selectedBatch = b),
                                ),
                                context.vMd,
                                CustomTextField(
                                  controller: _quantity,
                                  labelText: tr.remove_stock_quantity,
                                  hintText: '0',
                                  prefixIcon: Icons.inventory_outlined,
                                  keyboardType: TextInputType.number,
                                  onlyDigits: true,
                                  enabled: _selectedBatch != null,
                                  validator: (v) {
                                    final raw = v?.trim() ?? '';
                                    final qty = int.tryParse(raw);
                                    if (raw.isEmpty || qty == null) {
                                      return tr.field_required;
                                    }
                                    if (qty < 1) {
                                      return tr.field_required;
                                    }
                                    if (_selectedBatch != null &&
                                        qty > _selectedBatch!.quantityOnHand) {
                                      return tr.remove_stock_too_much;
                                    }
                                    return null;
                                  },
                                ),
                                context.vMd,
                                CustomTextField(
                                  controller: _notes,
                                  labelText: tr.remove_stock_notes,
                                  hintText: tr.product_form_optional_hint,
                                  prefixIcon: Icons.notes_outlined,
                                  height: 100,
                                ),
                              ],
                            ),
                            // Bottom spacing so the sticky bar doesn't cover.
                            SizedBox(height: context.sXxl + context.btnLg),
                          ],
                        ),
                      ),
                    ),

                    // Sticky bottom save bar.
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _StickySaveBar(
                        isSaving: isSaving,
                        enabled: _selectedBatch != null,
                        onTap: () =>
                            _submit(context.read<ProductDetailCubit>()),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Full-width gradient save button pinned to the bottom of the form.
class _StickySaveBar extends StatelessWidget {
  const _StickySaveBar({
    required this.isSaving,
    required this.enabled,
    required this.onTap,
  });

  final bool isSaving;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        color: context.colors.surface,
        border: Border(
          top: BorderSide(
            color: context.colors.outline.withAlpha(120),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: CustomButton(
          onTap: (isSaving || !enabled) ? null : onTap,
          child: isSaving
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.remove_rounded, color: Colors.white),
                    SizedBox(width: context.sSm),
                    Text(context.tr.remove_stock),
                  ],
                ),
        ),
      ),
    );
  }
}
