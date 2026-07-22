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
import 'package:pharmacy_app/features/customer_return_invoices/cubit/customer_return_invoice_form_cubit.dart';
import 'package:pharmacy_app/features/customer_return_invoices/cubit/customer_return_invoice_form_state.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoice_model.dart';
import 'package:pharmacy_app/features/customer_return_invoices/presentation/widgets/customer_return_invoice_card.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';
import 'package:pharmacy_app/features/shared/barcode/barcode_flow.dart';

/// Full-screen "New Customer Return" form. Customer (optional) + date + refund
/// method + reason + notes live in controllers; the dynamic line-items list
/// lives in the [CustomerReturnInvoiceFormCubit]. A live totals footer updates
/// as items change, and a sticky Save bar submits the return.
///
/// Reached either standalone or from a sales-invoice detail "Return" action,
/// which pre-seeds the customer + original invoice id + one line per sale item.
class CustomerReturnInvoiceFormScreen extends StatefulWidget {
  const CustomerReturnInvoiceFormScreen({
    super.key,
    this.seedSalesInvoice,
    this.seedCustomerId,
  });

  /// Optional sales invoice to pre-seed the return from (the "Return" action
  /// on a sales-invoice detail). Seeded once via the cubit in
  /// didChangeDependencies.
  final SalesInvoiceModel? seedSalesInvoice;

  /// Optional customer id hint (e.g. opened from a customer context). The
  /// cubit selects the matching customer after options load.
  final int? seedCustomerId;

  @override
  State<CustomerReturnInvoiceFormScreen> createState() =>
      _CustomerReturnInvoiceFormScreenState();
}

class _CustomerReturnInvoiceFormScreenState
    extends State<CustomerReturnInvoiceFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _reason;
  late final TextEditingController _notes;
  late DateTime _invoiceDate;
  ReturnRefundMethod _refundMethod = ReturnRefundMethod.cash;
  bool _optionsSeeded = false;

  @override
  void initState() {
    super.initState();
    _reason = TextEditingController();
    _notes = TextEditingController();
    _invoiceDate = DateTime.now();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_optionsSeeded) {
      _optionsSeeded = true;
      final cubit = context.read<CustomerReturnInvoiceFormCubit>();
      cubit.loadOptions();
      final seed = widget.seedSalesInvoice;
      if (seed != null) cubit.seedFromSalesInvoice(seed);
      // Pre-select the seed customer when only an id was passed (no full
      // sales invoice). The match runs after options load — handled below in
      // the builder via a one-shot guard on the customers list.
      if (widget.seedCustomerId != null && seed == null) {
        _selectSeedCustomer(cubit);
      }
    }
  }

  void _selectSeedCustomer(CustomerReturnInvoiceFormCubit cubit) {
    final id = widget.seedCustomerId;
    if (id == null) return;
    final match = cubit.state.customers
        .where((c) => c.id == id)
        .firstOrNull;
    if (match != null) cubit.selectCustomer(match);
  }

  @override
  void dispose() {
    _reason.dispose();
    _notes.dispose();
    super.dispose();
  }

  String get _invoiceDateStr =>
      "${_invoiceDate.year}-${_invoiceDate.month.toString().padLeft(2, '0')}-${_invoiceDate.day.toString().padLeft(2, '0')}";

  Future<void> _pickInvoiceDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _invoiceDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _invoiceDate = picked);
  }

  void _submit(CustomerReturnInvoiceFormCubit cubit) {
    if (cubit.state.items.isEmpty) {
      AppSnackbar.failure(message: context.tr.return_invoice_no_items);
      return;
    }
    // Each item must have a product + qty>=1 + unit price > 0.
    for (final i in cubit.state.items) {
      if (i.product == null) {
        AppSnackbar.failure(message: context.tr.invoice_item_product_required);
        return;
      }
      final qty = int.tryParse(i.quantity.trim()) ?? 0;
      if (qty < 1) {
        AppSnackbar.failure(message: context.tr.return_invoice_item_qty_required);
        return;
      }
      if (_num(i.unitPrice) <= 0) {
        AppSnackbar.failure(
          message: context.tr.return_invoice_item_price_required,
        );
        return;
      }
      final originalQty = cubit.state.originalInvoiceQuantities[i.product!.id];
      if (cubit.state.originalSalesInvoiceId != null &&
          originalQty != null &&
          qty > originalQty) {
        AppSnackbar.failure(
          message: context.tr.return_invoice_qty_exceeds_original,
        );
        return;
      }
    }

    cubit.submit(
      invoiceDate: _invoiceDateStr,
      refundMethod: _refundMethod,
      reason: _reason.text,
      notes: _notes.text,
    );
  }

  double _num(String s) => double.tryParse(s.trim()) ?? 0;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<CustomerReturnInvoiceFormCubit>();

    return BlocListener<CustomerReturnInvoiceFormCubit,
        CustomerReturnInvoiceFormState>(
      listenWhen: (p, c) =>
          p.failure != c.failure ||
          p.optionsFailure != c.optionsFailure ||
          (!p.saved && c.saved),
      listener: (context, state) {
        if (state.saved) {
          AppSnackbar.success(message: tr.return_invoice_created);
          Navigator.of(context).pop(true);
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(
            message: state.failure!.localizedMessage(context),
          );
          cubit.clearFailure();
          return;
        }
        if (state.optionsFailure != null) {
          AppSnackbar.failure(
            message: state.optionsFailure!.localizedMessage(context),
          );
          cubit.clearOptionsFailure();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(tr.return_customer_add_title),
        ),
        body: SafeArea(
          child: BlocBuilder<CustomerReturnInvoiceFormCubit,
              CustomerReturnInvoiceFormState>(
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
                          // Return details section.
                          FormSectionCard(
                            title: tr.return_customer_add_title,
                            subtitle: tr.invoice_section_items_sub,
                            icon: Icons.replay_rounded,
                            children: [
                              CustomDropdownField<CustomerModel>(
                                labelText: tr.sales_invoice_customer,
                                hintText: tr.sales_invoice_select_customer,
                                items: state.customers,
                                itemLabel: (c) => c.fullName,
                                value: state.selectedCustomer,
                                onChanged: cubit.selectCustomer,
                                isLoading: state.isOptionsLoading,
                                hasError: state.hasOptionsError,
                                onRetry: cubit.reloadOptions,
                              ),
                              context.vMd,
                              // Return date picker.
                              _DateField(
                                label: tr.invoice_date,
                                value: _invoiceDateStr,
                                onTap: _pickInvoiceDate,
                              ),
                              context.vMd,
                              // Refund method chips.
                              _RefundMethodField(
                                value: _refundMethod,
                                onChanged: (m) =>
                                    setState(() => _refundMethod = m),
                              ),
                              context.vMd,
                              CustomTextField(
                                controller: _reason,
                                labelText: tr.return_invoice_reason,
                                hintText: tr.return_invoice_reason_hint,
                                prefixIcon: Icons.help_outline_rounded,
                              ),
                            ],
                          ),
                          context.vMd,
                          // Items section.
                          FormSectionCard(
                            title: tr.return_invoice_items,
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
                                    tr.return_invoice_no_items,
                                    style: context.text.bodyMedium
                                        ?.copyWith(color: context.muted),
                                  ),
                                ),
                              context.vSm,
                              _AddItemButton(
                                onTap: cubit.addItem,
                                disabled: cubit.allAllowedProductsUsed,
                              ),
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
                          context.read<CustomerReturnInvoiceFormCubit>(),
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
                Expanded(
                  child: Text(
                    value.isEmpty ? '—' : value,
                    style: theme.textTheme.bodyLarge,
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

class _RefundMethodField extends StatelessWidget {
  const _RefundMethodField({required this.value, required this.onChanged});

  final ReturnRefundMethod value;
  final ValueChanged<ReturnRefundMethod> onChanged;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.return_invoice_refund_method,
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: context.sSm,
          children: [
            for (final m in ReturnRefundMethod.values)
              ChoiceChip(
                label: Text(returnRefundMethodLabel(m, tr)),
                selected: value == m,
                onSelected: (_) => onChanged(m),
              ),
          ],
        ),
      ],
    );
  }
}

List<ProductCardModel> _availableProducts(
  CustomerReturnInvoiceFormState state,
) {
  final allowed = state.allowedProductIds;
  if (allowed.isEmpty) return state.products;
  return state.products.where((p) => allowed.contains(p.id)).toList();
}

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.index});

  final int index;

  Future<void> _scanToAdd(
    BuildContext context,
    CustomerReturnInvoiceFormCubit cubit,
  ) async {
    final code = await BarcodeFlow.scanOnly(context);
    if (code == null || code.isEmpty) return;
    final result = await cubit.addScannedItem(code, targetIndex: index);
    if (!context.mounted) return;
    switch (result) {
      case ScannedReturnAdded(:final product):
        AppSnackbar.success(message: context.tr.scan_added_to_form(product.name));
      case ScannedReturnNotFound():
        AppSnackbar.failure(message: context.tr.scan_not_found);
      case ScannedReturnNotAllowed():
        AppSnackbar.failure(
          message: context.tr.return_invoice_product_not_allowed,
        );
      case ScannedReturnError(:final failure):
        AppSnackbar.failure(message: failure.localizedMessage(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomerReturnInvoiceFormCubit>();
    return BlocBuilder<CustomerReturnInvoiceFormCubit,
        CustomerReturnInvoiceFormState>(
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
                      items: _availableProducts(state),
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
              // Qty + unit price.
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
                      label: context.tr.return_invoice_item_unit_price,
                      initial: item.unitPrice,
                      onChanged: (v) => cubit.updateItem(
                        index,
                        item.copyWith(unitPrice: v),
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
                      label:
                          '${context.tr.invoice_item_tax} (${context.tr.product_form_optional_hint})',
                      initial: item.tax,
                      onChanged: (v) =>
                          cubit.updateItem(index, item.copyWith(tax: v)),
                    ),
                  ),
                  context.hSm,
                  Expanded(
                    child: _ItemNumberField(
                      label:
                          '${context.tr.invoice_item_discount} (${context.tr.product_form_optional_hint})',
                      initial: item.discount,
                      onChanged: (v) => cubit.updateItem(
                        index,
                        item.copyWith(discount: v),
                      ),
                    ),
                  ),
                ],
              ),
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

class _AddItemButton extends StatelessWidget {
  const _AddItemButton({required this.onTap, this.disabled = false});

  final VoidCallback onTap;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: disabled ? null : onTap,
      icon: Icon(Icons.add_rounded, size: context.iSm),
      label: Text(context.tr.invoice_item_add),
    );
  }
}

class _TotalsCard extends StatelessWidget {
  const _TotalsCard({required this.cubit});

  final CustomerReturnInvoiceFormCubit cubit;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return BlocBuilder<CustomerReturnInvoiceFormCubit,
        CustomerReturnInvoiceFormState>(
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
                label: tr.return_invoice_subtotal,
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
                label: tr.return_invoice_refund_total,
                value: cubit.computedRefundTotal,
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
                    Text(context.tr.detail_save),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Scanner icon shown next to a line item's product dropdown. Scans a barcode
/// and, on a match, fills/overwrites the tapped row. Shows a spinner while the
/// lookup is in flight and is disabled for the duration.
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
