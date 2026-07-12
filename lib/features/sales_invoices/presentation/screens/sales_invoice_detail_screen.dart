import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';
import 'package:pharmacy_app/features/sales_invoices/cubit/sales_invoice_detail_cubit.dart';
import 'package:pharmacy_app/features/sales_invoices/cubit/sales_invoice_detail_state.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/data/repo/sales_invoice_repository.dart';
import 'package:pharmacy_app/features/sales_invoices/presentation/widgets/sales_invoice_card.dart';
import 'package:pharmacy_app/features/shared/widgets/status_pill.dart';
import 'package:pharmacy_app/features/supplier_debts/presentation/widgets/supplier_debt_card.dart';

/// Read-only detail for a sales invoice: header (number, date, customer,
/// totals, pills), the line items, the linked customer debt (if any), and a
/// Cancel action (with confirm dialog). Notes can be edited via a dialog
/// (PUT notes-only).
class SalesInvoiceDetailScreen extends StatefulWidget {
  const SalesInvoiceDetailScreen({super.key, required this.invoiceId});

  final int invoiceId;

  @override
  State<SalesInvoiceDetailScreen> createState() =>
      _SalesInvoiceDetailScreenState();
}

class _SalesInvoiceDetailScreenState extends State<SalesInvoiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SalesInvoiceDetailCubit(
        repository: sl<SalesInvoiceRepository>(),
      )..loadSalesInvoice(widget.invoiceId),
      child: _Body(invoiceId: widget.invoiceId),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.invoiceId});

  final int invoiceId;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<SalesInvoiceDetailCubit>();

    return BlocListener<SalesInvoiceDetailCubit, SalesInvoiceDetailState>(
      listenWhen: (p, c) =>
          p.lastAction != c.lastAction || p.failure != c.failure,
      listener: (context, state) {
        if (state.lastAction == SalesInvoiceDetailAction.cancelled) {
          AppSnackbar.success(message: tr.sales_invoice_cancelled);
          cubit.clearAction();
          return;
        }
        if (state.lastAction == SalesInvoiceDetailAction.notesUpdated) {
          AppSnackbar.success(message: tr.detail_save);
          cubit.clearAction();
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(message: state.failure!.localizedMessage(context));
          cubit.clearAction();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(tr.invoice_invoice_number)),
        body: SafeArea(
          child: BlocBuilder<SalesInvoiceDetailCubit,
              SalesInvoiceDetailState>(
            builder: (context, state) {
              if (state.isLoading && state.invoice == null) {
                return _Loading();
              }
              if (state.failure != null && state.invoice == null) {
                return _Error(
                  message: state.failure!.localizedMessage(context),
                  onRetry: () => cubit.loadSalesInvoice(invoiceId),
                );
              }
              final invoice = state.invoice!;
              return RefreshIndicator(
                onRefresh: () => cubit.refresh(invoiceId),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: context.pHorizontal,
                  children: [
                    context.vSm,
                    _HeaderCard(invoice: invoice),
                    context.vMd,
                    _TotalsCard(invoice: invoice),
                    context.vMd,
                    _ItemsCard(invoice: invoice),
                    if (invoice.customerDebt != null) ...[
                      context.vMd,
                      _DebtSection(invoice: invoice),
                    ],
                    context.vMd,
                    _NotesCard(
                      invoice: invoice,
                      onEdit: () => _editNotes(context, invoice),
                    ),
                    context.vMd,
                    _CancelAction(
                      invoice: invoice,
                      isCancelling: state.isCancelling,
                      onCancel: () => _confirmCancel(context, invoice.id),
                    ),
                    context.vLg,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _editNotes(
    BuildContext context,
    SalesInvoiceModel invoice,
  ) async {
    final cubit = context.read<SalesInvoiceDetailCubit>();
    final controller = TextEditingController(text: invoice.notes ?? '');
    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.tr.invoice_notes),
        content: TextField(
          controller: controller,
          maxLines: 4,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: context.tr.invoice_notes,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(context.tr.detail_cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop('save'),
            child: Text(context.tr.detail_save),
          ),
        ],
      ),
    );
    if (result == 'save') {
      await cubit.updateNotes(invoice.id, controller.text);
    }
    controller.dispose();
  }

  Future<void> _confirmCancel(BuildContext context, int id) async {
    final cubit = context.read<SalesInvoiceDetailCubit>();
    final tr = context.tr;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.sales_invoice_cancel_title),
        content: Text(tr.sales_invoice_cancel_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(tr.detail_cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(tr.sales_invoice_cancel),
          ),
        ],
      ),
    );
    if (confirmed == true) cubit.cancelSalesInvoice(id);
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.invoice});

  final SalesInvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Container(
      padding: context.pAllMd,
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  invoice.invoiceNumber,
                  style: context.text.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              StatusPill(
                label: invoiceStatusLabel(invoice.status, tr),
                tone: invoiceStatusTone(invoice.status),
              ),
            ],
          ),
          context.vSm,
          _MetaRow(
            icon: Icons.calendar_today_outlined,
            text: '${tr.invoice_date}: ${invoice.invoiceDate}',
          ),
          if (invoice.customer != null) ...[
            context.vXs,
            _MetaRow(
              icon: Icons.person_outline_rounded,
              text: '${tr.sales_invoice_customer}: ${invoice.customer!.fullName}',
            ),
          ],
          context.vXs,
          _MetaRow(
            icon: Icons.payments_outlined,
            text:
                '${tr.invoice_payment_method}: ${invoicePaymentMethodLabel(invoice.paymentMethod, tr)}',
          ),
          context.vSm,
          Row(
            children: [
              StatusPill(
                label: invoicePaymentStatusLabel(invoice.paymentStatus, tr),
                tone: paymentStatusTone(invoice.paymentStatus),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TotalsCard extends StatelessWidget {
  const _TotalsCard({required this.invoice});

  final SalesInvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Container(
      padding: context.pAllMd,
      decoration: _cardDecoration(context),
      child: Column(
        children: [
          _Row(label: tr.invoice_subtotal, value: _money(invoice.subtotal, tr.sp)),
          _Row(label: tr.invoice_tax_total, value: _money(invoice.taxTotal, tr.sp)),
          _Row(
            label: tr.invoice_discount_total,
            value: _money(invoice.discountTotal, tr.sp),
          ),
          const Divider(),
          _Row(
            label: tr.invoice_grand_total,
            value: _money(invoice.grandTotal, tr.sp),
            prominent: true,
          ),
          _Row(
            label: tr.invoice_amount_paid,
            value: _money(invoice.amountPaid, tr.sp),
            color: AppColors.cozyEmerald,
          ),
          _Row(
            label: tr.invoice_amount_due,
            value: _money(invoice.amountDue, tr.sp),
            color: invoice.amountDue > 0 ? context.colors.error : null,
            prominent: invoice.amountDue > 0,
          ),
        ],
      ),
    );
  }
}

class _ItemsCard extends StatelessWidget {
  const _ItemsCard({required this.invoice});

  final SalesInvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final items = invoice.items ?? [];
    return Container(
      padding: context.pAllMd,
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr.invoice_items,
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          context.vMd,
          if (items.isEmpty)
            Text(
              tr.invoice_no_items,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: context.colors.outline.withAlpha(80),
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                final name = item.product?.brandName ?? '#${item.productId}';
                final lineTotal =
                    (item.sellingPrice * item.quantity) + item.tax - item.discount;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    name,
                    style: context.text.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${item.quantity} × ${_money(item.sellingPrice, tr.sp)}'
                    '${item.tax != 0 ? ' + ${_money(item.tax, tr.sp)}' : ''}'
                    '${item.discount != 0 ? ' − ${_money(item.discount, tr.sp)}' : ''}',
                    style: context.text.labelSmall?.copyWith(color: context.muted),
                  ),
                  trailing: Text(
                    _money(lineTotal, tr.sp),
                    style: context.text.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _DebtSection extends StatelessWidget {
  const _DebtSection({required this.invoice});

  final SalesInvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final debt = invoice.customerDebt!;
    return Container(
      padding: context.pAllMd,
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.account_balance_outlined,
                  size: context.iSm, color: context.primary),
              SizedBox(width: context.sXs),
              Text(
                tr.sales_invoice_customer_debt,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              StatusPill(
                label: debtStatusLabel(debt.status, tr),
                tone: debtStatusTone(debt.status),
              ),
            ],
          ),
          context.vMd,
          _Row(label: tr.debt_total_amount, value: _money(debt.totalAmount, tr.sp)),
          _Row(label: tr.debt_paid_amount, value: _money(debt.paidAmount, tr.sp)),
          _Row(
            label: tr.debt_remaining_amount,
            value: _money(debt.remainingAmount, tr.sp),
            color: context.colors.error,
            prominent: true,
          ),
          if (debt.dueDate != null) ...[
            context.vSm,
            _MetaRow(
              icon: Icons.event_rounded,
              text: '${tr.debt_due_date}: ${debt.dueDate}',
            ),
          ],
        ],
      ),
    );
  }
}

class _NotesCard extends StatelessWidget {
  const _NotesCard({required this.invoice, required this.onEdit});

  final SalesInvoiceModel invoice;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Container(
      padding: context.pAllMd,
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  tr.invoice_notes,
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (!invoice.isCancelled)
                IconButton(
                  icon: Icon(Icons.edit_outlined, size: context.iSm),
                  onPressed: onEdit,
                ),
            ],
          ),
          context.vSm,
          Text(
            invoice.notes?.isNotEmpty == true
                ? invoice.notes!
                : '—',
            style: context.text.bodyMedium?.copyWith(
              color: invoice.notes?.isNotEmpty == true
                  ? null
                  : context.muted,
            ),
          ),
        ],
      ),
    );
  }
}

class _CancelAction extends StatelessWidget {
  const _CancelAction({
    required this.invoice,
    required this.isCancelling,
    required this.onCancel,
  });

  final SalesInvoiceModel invoice;
  final bool isCancelling;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    if (invoice.isCancelled) {
      return Center(
        child: Text(
          tr.sales_invoice_already_cancelled,
          style: context.text.bodyMedium?.copyWith(color: context.muted),
        ),
      );
    }
    return CustomButton(
      onTap: isCancelling ? null : onCancel,
      child: isCancelling
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
                const Icon(Icons.cancel_outlined, color: Colors.white),
                SizedBox(width: context.sSm),
                Text(tr.sales_invoice_cancel),
              ],
            ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    this.color,
    this.prominent = false,
  });

  final String label;
  final String value;
  final Color? color;
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
            value,
            style: (prominent
                    ? context.text.titleMedium
                    : context.text.titleSmall)
                ?.copyWith(fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: context.iXs, color: context.muted),
        SizedBox(width: context.sXs),
        Flexible(
          child: Text(
            text,
            style: context.text.labelSmall?.copyWith(color: context.muted),
          ),
        ),
      ],
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView(
        padding: context.pHorizontal,
        children: [
          context.vSm,
          ShimmerFill(width: double.infinity, height: context.sXxl, radius: 16),
          context.vMd,
          ShimmerFill(width: double.infinity, height: context.sXxl, radius: 16),
          context.vMd,
          ShimmerFill(width: double.infinity, height: context.sMassive, radius: 16),
        ],
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.pHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            context.vMd,
            FilledButton(
              onPressed: onRetry,
              child: Text(context.tr.inventory_retry),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        width: 1.5,
        color: context.colors.outline.withAlpha(170),
      ),
      color: context.colors.surfaceContainer,
    );

String _money(double amount, String currency) {
  final sign = amount.isNegative ? '-' : '';
  return '$sign${amount.abs().toStringAsFixed(2)} $currency';
}
