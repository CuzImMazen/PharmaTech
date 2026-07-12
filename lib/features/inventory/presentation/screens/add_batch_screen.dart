import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/core/widgets/form_section_card.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_cubit.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_state.dart';

/// Full-screen Add Batch form. Collects the fields for a manual stock-in
/// adjustment (a new batch) and, on submit, calls
/// [ProductDetailCubit.addBatch] with a snake_case payload.
///
/// It reads the parent [ProductDetailCubit] (re-provided at the route via
/// [BlocProvider.value]) so the added batch shows up instantly in the Batches
/// tab and the parent screen's BlocListener shows the success/failure snackbar.
///
/// Required backend fields for an `add`: product_id, quantity,
/// purchase_price, selling_price. Optional: batch_number, expiry_date, notes.
/// `expiry_date` is picked as `YYYY-MM-DD`.
class AddBatchScreen extends StatefulWidget {
  const AddBatchScreen({super.key, required this.productId});

  final int productId;

  @override
  State<AddBatchScreen> createState() => _AddBatchScreenState();
}

class _AddBatchScreenState extends State<AddBatchScreen> {
  final _formKey = GlobalKey<FormState>();
  final _quantity = TextEditingController();
  final _purchasePrice = TextEditingController();
  final _sellingPrice = TextEditingController();
  final _batchNumber = TextEditingController();
  final _notes = TextEditingController();
  final _expiry = TextEditingController();
  DateTime? _expiryDate;

  @override
  void dispose() {
    _quantity.dispose();
    _purchasePrice.dispose();
    _sellingPrice.dispose();
    _batchNumber.dispose();
    _notes.dispose();
    _expiry.dispose();
    super.dispose();
  }

  Future<void> _pickExpiryDate() async {
    final today = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: today.add(const Duration(days: 365)),
      firstDate: today,
      lastDate: today.add(const Duration(days: 365 * 10)),
    );
    if (picked != null) {
      setState(() {
        _expiryDate = picked;
        _expiry.text = _formatDate(picked);
      });
    }
  }

  String _formatDate(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  void _submit(ProductDetailCubit cubit) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    cubit.addBatch({
      'product_id': widget.productId,
      'quantity': int.tryParse(_quantity.text.trim()) ?? 0,
      'purchase_price': num.tryParse(_purchasePrice.text.trim()) ?? 0,
      'selling_price': num.tryParse(_sellingPrice.text.trim()) ?? 0,
      if (_batchNumber.text.trim().isNotEmpty)
        'batch_number': _batchNumber.text.trim(),
      if (_expiryDate != null) 'expiry_date': _formatDate(_expiryDate!),
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
        // Added → pop back to the detail screen. The parent's BlocListener
        // shows the success snackbar and the new batch is already in state.
        if (state.lastBatchAction == BatchActionResult.added) {
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
          title: Text(tr.detail_add_batch_title),
        ),
        body: SafeArea(
          child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              final isSaving = state.isAddingBatch;
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
                              tr.detail_add_batch_subtitle,
                              style: context.text.bodyMedium?.copyWith(
                                color: context.muted,
                              ),
                            ),
                            context.vLg,
                            FormSectionCard(
                              title: tr.detail_add_batch_section,
                              subtitle: tr.detail_add_batch_section_sub,
                              icon: Icons.inventory_2_outlined,
                              children: [
                                CustomTextField(
                                  controller: _quantity,
                                  labelText: tr.detail_quantity_on_hand,
                                  hintText: '0',
                                  prefixIcon: Icons.inventory_outlined,
                                  keyboardType: TextInputType.number,
                                  onlyDigits: true,
                                  validator: (v) =>
                                      (v == null || v.trim().isEmpty)
                                      ? tr.field_required
                                      : null,
                                ),
                                context.vMd,
                                CustomTextField(
                                  controller: _purchasePrice,
                                  labelText: tr.detail_purchase_price,
                                  hintText: '0',
                                  prefixIcon: Icons.payments_outlined,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                  onlyDigits: false,
                                  validator: (v) =>
                                      (v == null || v.trim().isEmpty)
                                      ? tr.field_required
                                      : null,
                                ),
                                context.vMd,
                                CustomTextField(
                                  controller: _sellingPrice,
                                  labelText: tr.detail_batch_selling_price,
                                  hintText: '0',
                                  prefixIcon: Icons.local_offer_outlined,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                  onlyDigits: false,
                                  validator: (v) =>
                                      (v == null || v.trim().isEmpty)
                                      ? tr.field_required
                                      : null,
                                ),
                                context.vMd,
                                CustomTextField(
                                  controller: _batchNumber,
                                  labelText: tr.detail_batch_id,
                                  hintText: tr.product_form_optional_hint,
                                  prefixIcon: Icons.tag_outlined,
                                ),
                                context.vMd,
                                // Expiry date picker (read-only field).
                                CustomTextField(
                                  controller: _expiry,
                                  labelText: tr.detail_expiry,
                                  hintText: tr.product_form_optional_hint,
                                  prefixIcon: Icons.event_outlined,
                                  readOnly: true,
                                  onTap: _pickExpiryDate,
                                ),
                                context.vMd,
                                CustomTextField(
                                  controller: _notes,
                                  labelText: tr.detail_add_batch_notes,
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
  const _StickySaveBar({required this.isSaving, required this.onTap});

  final bool isSaving;
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
          onTap: isSaving ? null : onTap,
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
                    const Icon(Icons.check_rounded, color: Colors.white),
                    SizedBox(width: context.sSm),
                    Text(context.tr.detail_add_batch),
                  ],
                ),
        ),
      ),
    );
  }
}
