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
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/cubit/sales_invoice_form_cubit.dart';
import 'package:pharmacy_app/features/sales_invoices/cubit/sales_invoice_form_state.dart';
import 'package:pharmacy_app/features/sales_invoices/presentation/widgets/sales_invoice_card.dart';

/// Full-screen "New Sale" form. Customer (optional) + date + payment method +
/// amount-paid + due-date + notes live in controllers; the dynamic line-items
/// list lives in the [SalesInvoiceFormCubit]. A live totals footer updates as
/// items change, and `amount_paid` is validated to not exceed the grand total.
///
/// A customer is required by the backend when the sale isn't fully paid (a
/// debt is created in that case); the server enforces this and returns a 422.
class SalesInvoiceFormScreen extends StatefulWidget {
  const SalesInvoiceFormScreen({super.key});

  @override
  State<SalesInvoiceFormScreen> createState() => _SalesInvoiceFormScreenState();
}

class _SalesInvoiceFormScreenState extends State<SalesInvoiceFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountPaid;
  late final TextEditingController _notes;
  late DateTime _invoiceDate;
  DateTime? _dueDate;
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
      context.read<SalesInvoiceFormCubit>().loadOptions();
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

  String? get _dueDateStr {
    final d = _dueDate;
    if (d == null) return null;
    return "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";
  }

  Future<void> _pickInvoiceDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _invoiceDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _invoiceDate = picked);
  }

  Future<void> _pickDueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? _invoiceDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  void _submit(SalesInvoiceFormCubit cubit) {
    if (cubit.state.items.isEmpty) {
      AppSnackbar.failure(message: context.tr.sales_invoice_no_items_added);
      return;
    }
    // Each item must have a product + qty>=1 + selling price.
    for (final i in cubit.state.items) {
      if (i.product == null) {
        AppSnackbar.failure(message: context.tr.sales_invoice_item_product_required);
        return;
      }
      if ((int.tryParse(i.quantity.trim()) ?? 0) < 1) {
        AppSnackbar.failure(message: context.tr.sales_invoice_item_quantity_required);
        return;
      }
      if (_num(i.sellingPrice) <= 0) {
        AppSnackbar.failure(message: context.tr.sales_invoice_item_price_required);
        return;
      }
    }

    final grandTotal = cubit.computedGrandTotal;
    final paid = double.tryParse(_amountPaid.text.trim()) ?? 0;
    if (paid < 0) {
      AppSnackbar.failure(message: context.tr.sales_invoice_amount_paid_invalid);
      return;
    }
    if (paid > grandTotal) {
      AppSnackbar.failure(
        message: context.tr.sales_invoice_amount_paid_exceeds_total,
      );
      return;
    }
    // A customer is required when the sale isn't fully paid (a debt is
    // created); validate client-side too for a clearer message.
    if (paid < grandTotal && cubit.state.selectedCustomer == null) {
      AppSnackbar.failure(message: context.tr.sales_invoice_customer_required_unpaid);
      return;
    }

    cubit.submit(
      invoiceDate: _invoiceDateStr,
      paymentMethod: _paymentMethod,
      amountPaid: _amountPaid.text.trim().isEmpty ? '0' : _amountPaid.text.trim(),
      dueDate: _dueDateStr,
      notes: _notes.text,
    );
  }

  double _num(String s) => double.tryParse(s.trim()) ?? 0;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<SalesInvoiceFormCubit>();

    return BlocListener<SalesInvoiceFormCubit, SalesInvoiceFormState>(
      listenWhen: (p, c) =>
          p.failure != c.failure || (!p.saved && c.saved),
      listener: (context, state) {
        if (state.saved) {
          AppSnackbar.success(message: tr.sales_invoice_created);
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
          title: Text(tr.sales_invoice_add_title),
        ),
        body: SafeArea(
          child: BlocBuilder<SalesInvoiceFormCubit, SalesInvoiceFormState>(
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
                          // Sale details section.
                          FormSectionCard(
                            title: tr.sales_invoice_section_main,
                            subtitle: tr.sales_invoice_section_main_sub,
                            icon: Icons.point_of_sale,
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
                              // Invoice date picker.
                              _DateField(
                                label: tr.invoice_date,
                                value: _invoiceDateStr,
                                onTap: _pickInvoiceDate,
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
                              context.vMd,
                              // Due date (optional; relevant when not fully paid).
                              _DateField(
                                label:
                                    '${tr.sales_invoice_due_date} (${tr.sales_invoice_optional})',
                                value: _dueDateStr ?? '',
                                onTap: _pickDueDate,
                                allowClear: true,
                                onClear: () => setState(() => _dueDate = null),
                              ),
                            ],
                          ),
                          context.vMd,
                          // Items section.
                          FormSectionCard(
                            title: tr.invoice_section_items,
                            subtitle: tr.sales_invoice_section_items_sub,
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
                                    tr.sales_invoice_no_items_added,
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
                          context.read<SalesInvoiceFormCubit>(),
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
    this.allowClear = false,
    this.onClear,
  });

  final String label;
  final String value;
  final VoidCallback onTap;
  final bool allowClear;
  final VoidCallback? onClear;

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
                if (allowClear && value.isNotEmpty)
                  GestureDetector(
                    onTap: onClear,
                    child: Icon(Icons.close_rounded,
                        color: context.muted, size: 20),
                  ),
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

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SalesInvoiceFormCubit>();
    return BlocBuilder<SalesInvoiceFormCubit, SalesInvoiceFormState>(
      buildWhen: (p, c) {
        if (index >= p.items.length || index >= c.items.length) return true;
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
              // Header: product + remove.
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
              // Qty + selling price.
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
                      label: context.tr.sales_invoice_item_selling_price,
                      initial: item.sellingPrice,
                      onChanged: (v) => cubit.updateItem(
                        index,
                        item.copyWith(sellingPrice: v),
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
                      label: '${context.tr.invoice_item_tax} (${context.tr.sales_invoice_optional})',
                      initial: item.tax,
                      onChanged: (v) =>
                          cubit.updateItem(index, item.copyWith(tax: v)),
                    ),
                  ),
                  context.hSm,
                  Expanded(
                    child: _ItemNumberField(
                      label: '${context.tr.invoice_item_discount} (${context.tr.sales_invoice_optional})',
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

  final SalesInvoiceFormCubit cubit;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return BlocBuilder<SalesInvoiceFormCubit, SalesInvoiceFormState>(
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
                    Text(context.tr.sales_invoice_add_title),
                  ],
                ),
        ),
      ),
    );
  }
}
