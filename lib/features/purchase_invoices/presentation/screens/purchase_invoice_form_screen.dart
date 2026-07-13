import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_dropdown_field.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/core/widgets/form_section_card.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/purchase_invoices/cubit/purchase_invoice_form_cubit.dart';
import 'package:pharmacy_app/features/purchase_invoices/cubit/purchase_invoice_form_state.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/purchase_invoices/presentation/widgets/purchase_invoice_card.dart';
import 'package:pharmacy_app/features/shared/barcode/barcode_flow.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';

/// Full-screen "New Purchase Invoice" form. Supplier + date + payment method +
/// amount-paid + notes live in controllers; the dynamic line-items list lives
/// in the [PurchaseInvoiceFormCubit]. A live totals footer updates as items
/// change, and `amount_paid` is validated to not exceed the grand total.
class PurchaseInvoiceFormScreen extends StatefulWidget {
  const PurchaseInvoiceFormScreen({super.key, this.seedProduct});

  /// Optional product to pre-fill as the first line item (from a dashboard
  /// barcode scan choice). Seeded once via the cubit in didChangeDependencies.
  final ProductDetailModel? seedProduct;

  @override
  State<PurchaseInvoiceFormScreen> createState() =>
      _PurchaseInvoiceFormScreenState();
}

class _PurchaseInvoiceFormScreenState extends State<PurchaseInvoiceFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountPaid;
  late final TextEditingController _notes;
  late DateTime _invoiceDate;
  InvoicePaymentMethod _paymentMethod = InvoicePaymentMethod.cash;
  bool _optionsSeeded = false;

  @override
  void initState() {
    super.initState();
    _amountPaid = TextEditingController();
    _notes = TextEditingController();
    _invoiceDate = DateTime.now();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_optionsSeeded) {
      _optionsSeeded = true;
      final cubit = context.read<PurchaseInvoiceFormCubit>();
      cubit.loadOptions();
      final seed = widget.seedProduct;
      if (seed != null) cubit.seedProduct(seed);
    }
  }

  @override
  void dispose() {
    _amountPaid.dispose();
    _notes.dispose();
    super.dispose();
  }

  String get _invoiceDateStr =>
      "${_invoiceDate.year}-${_invoiceDate.month.toString().padLeft(2, '0')}-${_invoiceDate.day.toString().padLeft(2, '0')}";

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _invoiceDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _invoiceDate = picked);
  }

  void _submit(PurchaseInvoiceFormCubit cubit) {
    if (!(cubit.state.selectedSupplier != null)) {
      AppSnackbar.failure(message: context.tr.invoice_select_supplier);
      return;
    }
    if (cubit.state.items.isEmpty) {
      AppSnackbar.failure(message: context.tr.invoice_no_items_added);
      return;
    }
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final grandTotal = cubit.computedGrandTotal;
    final paid = double.tryParse(_amountPaid.text.trim()) ?? 0;
    if (paid < 0) {
      AppSnackbar.failure(message: context.tr.invoice_amount_paid_invalid);
      return;
    }
    if (paid > grandTotal) {
      AppSnackbar.failure(
        message: context.tr.invoice_amount_paid_exceeds_total,
      );
      return;
    }

    cubit.submit(
      invoiceDate: _invoiceDateStr,
      paymentMethod: _paymentMethod,
      amountPaid: _amountPaid.text.trim().isEmpty ? '0' : _amountPaid.text.trim(),
      notes: _notes.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<PurchaseInvoiceFormCubit>();

    return BlocListener<PurchaseInvoiceFormCubit, PurchaseInvoiceFormState>(
      listenWhen: (p, c) =>
          p.failure != c.failure || (!p.saved && c.saved),
      listener: (context, state) {
        if (state.saved) {
          AppSnackbar.success(message: tr.invoice_created);
          Navigator.of(context).pop(true);
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(
            message: state.failure!.localizedMessage(context),
          );
          cubit.clearFailure();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(tr.invoice_add_title),
        ),
        body: SafeArea(
          child: BlocBuilder<PurchaseInvoiceFormCubit, PurchaseInvoiceFormState>(
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state.isSaving,
                child: Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: ListView(
                        padding: context.pScreen,
                        children: [
                          // Invoice details section.
                          FormSectionCard(
                            title: tr.invoice_section_main,
                            subtitle: tr.invoice_section_main_sub,
                            icon: Icons.receipt_long_outlined,
                            children: [
                              CustomDropdownField<SupplierModel>(
                                labelText: tr.invoice_supplier,
                                hintText: tr.invoice_select_supplier,
                                items: state.suppliers,
                                itemLabel: (s) => s.name,
                                value: state.selectedSupplier,
                                onChanged: cubit.selectSupplier,
                                isLoading: state.isOptionsLoading,
                                hasError: state.hasOptionsError,
                                onRetry: cubit.reloadOptions,
                              ),
                              context.vMd,
                              // Invoice date picker.
                              _DateField(
                                label: tr.invoice_date,
                                value: _invoiceDateStr,
                                onTap: _pickDate,
                              ),
                              context.vMd,
                              // Payment method.
                              _PaymentMethodField(
                                value: _paymentMethod,
                                onChanged: (m) =>
                                    setState(() => _paymentMethod = m),
                              ),
                              context.vMd,
                              CustomTextField(
                                controller: _amountPaid,
                                labelText: tr.invoice_amount_paid,
                                hintText: tr.invoice_amount_paid_hint,
                                prefixIcon: Icons.payments_outlined,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                onlyDigits: false,
                              ),
                            ],
                          ),
                          context.vMd,
                          // Items section.
                          FormSectionCard(
                            title: tr.invoice_section_items,
                            subtitle: tr.invoice_section_items_sub,
                            icon: Icons.inventory_2_outlined,
                            children: [
                              for (var i = 0; i < state.items.length; i++)
                                _ItemRow(index: i),
                              if (state.items.isEmpty)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: context.sMd,
                                  ),
                                  child: Text(
                                    tr.invoice_no_items_added,
                                    style: context.text.bodyMedium
                                        ?.copyWith(color: context.muted),
                                  ),
                                ),
                              context.vSm,
                              _AddItemButton(onTap: cubit.addItem),
                            ],
                          ),
                          context.vMd,
                          // Totals summary.
                          _TotalsCard(cubit: cubit),
                          context.vMd,
                          CustomTextField(
                            controller: _notes,
                            labelText: tr.invoice_notes,
                            hintText: tr.product_form_optional_hint,
                            prefixIcon: Icons.notes_outlined,
                            height: 100,
                          ),
                          SizedBox(height: context.sXxl + context.btnLg),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _StickySaveBar(
                        isSaving: state.isSaving,
                        onTap: () => _submit(
                          context.read<PurchaseInvoiceFormCubit>(),
                        ),
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

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
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
              color: theme.colorScheme.surface,
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    color: context.muted, size: 22),
                const SizedBox(width: 12),
                Text(value, style: theme.textTheme.bodyLarge),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PaymentMethodField extends StatelessWidget {
  const _PaymentMethodField({required this.value, required this.onChanged});

  final InvoicePaymentMethod value;
  final ValueChanged<InvoicePaymentMethod> onChanged;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.invoice_payment_method,
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: context.sSm,
          children: [
            for (final m in InvoicePaymentMethod.values)
              ChoiceChip(
                label: Text(invoicePaymentMethodLabel(m, tr)),
                selected: value == m,
                onSelected: (_) => onChanged(m),
              ),
          ],
        ),
      ],
    );
  }
}

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.index});

  final int index;

  Future<void> _scanToAdd(
    BuildContext context,
    PurchaseInvoiceFormCubit cubit,
  ) async {
    final code = await BarcodeFlow.scanOnly(context);
    if (code == null || code.isEmpty) return;
    final result = await cubit.addScannedItem(code, targetIndex: index);
    if (!context.mounted) return;
    switch (result) {
      case ScannedAdded(:final product):
        AppSnackbar.success(message: context.tr.scan_added_to_form(product.name));
      case ScannedNotFound():
        AppSnackbar.failure(message: context.tr.scan_not_found);
      case ScannedError(:final failure):
        AppSnackbar.failure(message: failure.localizedMessage(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PurchaseInvoiceFormCubit>();
    return BlocBuilder<PurchaseInvoiceFormCubit, PurchaseInvoiceFormState>(
      buildWhen: (p, c) {
        if (index >= p.items.length || index >= c.items.length) return true;
        if (p.isScanning != c.isScanning) return true;
        // Rebuild when the products list loads/changes so a seeded/scanned
        // product (set before options finished loading) becomes matchable in
        // the dropdown — otherwise the row keeps showing the placeholder.
        if (p.products != c.products) return true;
        return p.items[index] != c.items[index];
      },
      builder: (context, state) {
        if (index >= state.items.length) return const SizedBox.shrink();
        final item = state.items[index];
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
              // Header: product + scan + remove.
              Row(
                children: [
                  Expanded(
                    child: CustomDropdownField<ProductCardModel>(
                      labelText: context.tr.invoice_item_product,
                      hintText: context.tr.invoice_item_product,
                      items: state.products,
                      itemLabel: (p) => p.name,
                      value: item.product,
                      onChanged: (p) => cubit.setItemProduct(index, p),
                      isLoading: state.isOptionsLoading,
                      hasError: state.hasOptionsError,
                      onRetry: cubit.reloadOptions,
                    ),
                  ),
                  context.hSm,
                  _ItemScanButton(
                    isScanning: state.isScanning,
                    onScan: () => _scanToAdd(context, cubit),
                  ),
                  context.hSm,
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: context.colors.error,
                    ),
                    onPressed: () => cubit.removeItem(index),
                  ),
                ],
              ),
              context.vSm,
              // Qty + wholesale price.
              Row(
                children: [
                  Expanded(
                    child: _ItemNumberField(
                      label: context.tr.invoice_item_quantity,
                      initial: item.quantity,
                      onChanged: (v) =>
                          cubit.updateItem(index, item.copyWith(quantity: v)),
                    ),
                  ),
                  context.hSm,
                  Expanded(
                    child: _ItemNumberField(
                      label: context.tr.invoice_item_wholesale_price,
                      initial: item.wholesalePrice,
                      onChanged: (v) => cubit.updateItem(
                        index,
                        item.copyWith(wholesalePrice: v),
                      ),
                    ),
                  ),
                ],
              ),
              context.vSm,
              // Tax + discount.
              Row(
                children: [
                  Expanded(
                    child: _ItemNumberField(
                      label: '${context.tr.invoice_item_tax} (${context.tr.invoice_item_optional})',
                      initial: item.tax,
                      onChanged: (v) =>
                          cubit.updateItem(index, item.copyWith(tax: v)),
                    ),
                  ),
                  context.hSm,
                  Expanded(
                    child: _ItemNumberField(
                      label: '${context.tr.invoice_item_discount} (${context.tr.invoice_item_optional})',
                      initial: item.discount,
                      onChanged: (v) => cubit.updateItem(
                        index,
                        item.copyWith(discount: v),
                      ),
                    ),
                  ),
                ],
              ),
              context.vSm,
              // Expandable batch details.
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
                      context.tr.invoice_item_batch_number,
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
                _ItemNumberField(
                  label: '${context.tr.invoice_item_batch_number} (${context.tr.invoice_item_optional})',
                  initial: item.batchNumber,
                  onChanged: (v) => cubit.updateItem(
                    index,
                    item.copyWith(batchNumber: v),
                  ),
                ),
                context.vSm,
                Row(
                  children: [
                    Expanded(
                      child: _ItemDateField(
                        label: context.tr.invoice_item_expiry_date,
                        value: item.expiryDate,
                        onChanged: (v) => cubit.updateItem(
                          index,
                          item.copyWith(expiryDate: v),
                        ),
                      ),
                    ),
                    context.hSm,
                    Expanded(
                      child: _ItemNumberField(
                        label: '${context.tr.invoice_item_selling_price} (${context.tr.invoice_item_optional})',
                        initial: item.sellingPrice,
                        onChanged: (v) => cubit.updateItem(
                          index,
                          item.copyWith(sellingPrice: v),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _ItemNumberField extends StatefulWidget {
  const _ItemNumberField({
    required this.label,
    required this.initial,
    required this.onChanged,
  });

  final String label;
  final String initial;
  final ValueChanged<String> onChanged;

  @override
  State<_ItemNumberField> createState() => _ItemNumberFieldState();
}

class _ItemNumberFieldState extends State<_ItemNumberField> {
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
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onlyDigits: false,
    );
  }
}

class _ItemDateField extends StatelessWidget {
  const _ItemDateField({
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
        const SizedBox(height: 8),
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
                "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}",
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

class _AddItemButton extends StatelessWidget {
  const _AddItemButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(Icons.add_rounded, size: context.iSm),
      label: Text(context.tr.invoice_item_add),
    );
  }
}

class _TotalsCard extends StatelessWidget {
  const _TotalsCard({required this.cubit});

  final PurchaseInvoiceFormCubit cubit;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return BlocBuilder<PurchaseInvoiceFormCubit, PurchaseInvoiceFormState>(
      buildWhen: (p, c) => p.items != c.items,
      builder: (context, state) {
        return Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr.invoice_totals_summary,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              context.vSm,
              _TotalRow(
                label: tr.invoice_subtotal,
                value: cubit.computedSubtotal,
              ),
              _TotalRow(
                label: tr.invoice_tax_total,
                value: cubit.computedTaxTotal,
              ),
              _TotalRow(
                label: tr.invoice_discount_total,
                value: -cubit.computedDiscountTotal,
              ),
              Divider(color: context.colors.outline.withAlpha(120)),
              _TotalRow(
                label: tr.invoice_grand_total,
                value: cubit.computedGrandTotal,
                prominent: true,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({
    required this.label,
    required this.value,
    this.prominent = false,
  });

  final String label;
  final double value;
  final bool prominent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sXs),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: (prominent
                      ? context.text.titleSmall
                      : context.text.bodyMedium)
                  ?.copyWith(fontWeight: prominent ? FontWeight.bold : null),
            ),
          ),
          Text(
            _money(value, context.tr.sp),
            style: (prominent
                    ? context.text.titleMedium
                    : context.text.titleSmall)
                ?.copyWith(
              fontWeight: FontWeight.bold,
              color: prominent ? context.primary : null,
            ),
          ),
        ],
      ),
    );
  }

  String _money(double amount, String currency) {
    final sign = amount.isNegative ? '-' : '';
    return '$sign${amount.abs().toStringAsFixed(2)} $currency';
  }
}

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
                    Text(context.tr.invoice_add_title),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Scanner icon shown next to a line item's product dropdown. Scans a barcode
/// and, on a match, appends the product as a new line. Shows a spinner while
/// the lookup is in flight and is disabled for the duration.
class _ItemScanButton extends StatelessWidget {
  const _ItemScanButton({required this.isScanning, required this.onScan});

  final bool isScanning;
  final VoidCallback onScan;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: context.tr.scan_barcode,
      icon: isScanning
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.primary,
              ),
            )
          : Icon(Icons.qr_code_scanner_rounded, color: context.primary),
      onPressed: isScanning ? null : onScan,
    );
  }
}
