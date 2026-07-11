import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/core/widgets/form_section_card.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_cubit.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_state.dart';

/// A modal bottom sheet that collects the fields for a manual stock-in
/// adjustment (a new batch). On submit it calls [onSubmit] with a snake_case
/// payload (without `adjustment_type`, which the cubit adds).
///
/// Required backend fields for an `add`: product_id, quantity,
/// purchase_price, selling_price. Optional: batch_number, expiry_date,
/// notes. `expiry_date` is picked as `YYYY-MM-DD`.
///
/// [cubit] is re-provided to the sheet via [BlocProvider.value] so the
/// sheet's BlocListener can observe batch-mutation outcomes — the modal
/// overlay route is otherwise outside the detail screen's provider scope.
void showAddBatchBottomSheet(
  BuildContext context, {
  required int productId,
  required ProductDetailCubit cubit,
  required void Function(Map<String, dynamic> body) onSubmit,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.colors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(context.sXl)),
    ),
    builder: (sheetContext) => BlocProvider<ProductDetailCubit>.value(
      value: cubit,
      child: _AddBatchSheet(
        productId: productId,
        onSubmit: onSubmit,
      ),
    ),
  );
}

class _AddBatchSheet extends StatefulWidget {
  const _AddBatchSheet({
    required this.productId,
    required this.onSubmit,
  });

  final int productId;
  final void Function(Map<String, dynamic> body) onSubmit;

  @override
  State<_AddBatchSheet> createState() => _AddBatchSheetState();
}

class _AddBatchSheetState extends State<_AddBatchSheet> {
  final _formKey = GlobalKey<FormState>();
  final _quantity = TextEditingController();
  final _purchasePrice = TextEditingController();
  final _sellingPrice = TextEditingController();
  final _batchNumber = TextEditingController();
  final _notes = TextEditingController();
  final _expiry = TextEditingController();
  DateTime? _expiryDate;
  bool _isSaving = false;

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

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSaving = true);
    widget.onSubmit({
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
    // Keep the sheet above the keyboard.
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<ProductDetailCubit, ProductDetailState>(
      listenWhen: (p, c) =>
          p.lastBatchAction != c.lastBatchAction ||
          p.batchFailure != c.batchFailure,
      listener: (context, state) {
        if (state.lastBatchAction == BatchActionResult.added) {
          Navigator.of(context).pop();
          return;
        }
        if (state.batchFailure != null) {
          // Reset the local spinner so the user can retry; the failure snackbar
          // is shown by the parent screen's BlocListener.
          setState(() => _isSaving = false);
        }
      },
      child: Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: context.pAllLg,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle.
              Center(
                child: Container(
                  width: context.iLg,
                  height: context.sXs,
                  margin: EdgeInsets.only(bottom: context.sMd),
                  decoration: BoxDecoration(
                    color: context.muted.withAlpha(120),
                    borderRadius: BorderRadius.circular(context.sHuge),
                  ),
                ),
              ),
              Text(
                tr.detail_add_batch_title,
                style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              context.vSm,
              Text(
                tr.detail_add_batch_subtitle,
                style: context.text.bodyMedium?.copyWith(color: context.muted),
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
                    validator: (v) => (v == null || v.trim().isEmpty)
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
                        const TextInputType.numberWithOptions(decimal: true),
                    onlyDigits: false,
                    validator: (v) => (v == null || v.trim().isEmpty)
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
                        const TextInputType.numberWithOptions(decimal: true),
                    onlyDigits: false,
                    validator: (v) => (v == null || v.trim().isEmpty)
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
              context.vLg,
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onTap: _isSaving ? null : _submit,
                  child: _isSaving
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
                            Text(tr.detail_add_batch),
                          ],
                        ),
                ),
              ),
              SizedBox(height: context.sMd),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
