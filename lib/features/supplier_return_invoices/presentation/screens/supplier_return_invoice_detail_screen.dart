import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';
import 'package:pharmacy_app/core/widgets/status_pill.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/cubit/supplier_return_invoice_detail_cubit.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/cubit/supplier_return_invoice_detail_state.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/models/supplier_return_invoice_model.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/repo/supplier_return_invoice_repository.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/presentation/widgets/supplier_return_invoice_card.dart';

/// Read-only detail for a supplier return invoice: header (number, date,
/// supplier, refund method, status), totals, the line items, notes, and a
/// Cancel action (with confirm dialog).
class SupplierReturnInvoiceDetailScreen extends StatefulWidget {
  const SupplierReturnInvoiceDetailScreen({super.key, required this.invoiceId});

  final int invoiceId;

  @override
  State<SupplierReturnInvoiceDetailScreen> createState() =>
      _SupplierReturnInvoiceDetailScreenState();
}

class _SupplierReturnInvoiceDetailScreenState
    extends State<SupplierReturnInvoiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupplierReturnInvoiceDetailCubit(
        repository: sl<SupplierReturnInvoiceRepository>(),
      )..loadReturn(widget.invoiceId),
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
    final cubit = context.read<SupplierReturnInvoiceDetailCubit>();

    return BlocListener<SupplierReturnInvoiceDetailCubit,
        SupplierReturnInvoiceDetailState>(
      listenWhen: (p, c) =>
          p.lastAction != c.lastAction || p.failure != c.failure,
      listener: (context, state) {
        if (state.lastAction == SupplierReturnDetailAction.cancelled) {
          AppSnackbar.success(message: tr.return_invoice_cancelled);
          cubit.clearAction();
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(
            message: state.failure!.localizedMessage(context),
          );
          cubit.clearAction();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(tr.return_invoice_number)),
        body: SafeArea(
          child: BlocBuilder<SupplierReturnInvoiceDetailCubit,
              SupplierReturnInvoiceDetailState>(
            builder: (context, state) {
              if (state.isLoading && state.returnInvoice == null) {
                return _Loading();
              }
              if (state.failure != null && state.returnInvoice == null) {
                return _Error(
                  message: state.failure!.localizedMessage(context),
                  onRetry: () => cubit.loadReturn(invoiceId),
                );
              }
              final invoice = state.returnInvoice!;
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
                    context.vMd,
                    _NotesCard(invoice: invoice),
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

  Future<void> _confirmCancel(BuildContext context, int id) async {
    final cubit = context.read<SupplierReturnInvoiceDetailCubit>();
    final tr = context.tr;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.return_invoice_cancel_title),
        content: Text(tr.return_invoice_cancel_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(tr.detail_cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(tr.invoice_cancel),
          ),
        ],
      ),
    );
    if (confirmed == true) cubit.cancelReturn(id);
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.invoice});

  final SupplierReturnInvoiceModel invoice;

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
                label: returnStatusLabel(invoice.status, tr),
                tone: returnStatusTone(invoice.status),
              ),
            ],
          ),
          context.vSm,
          _MetaRow(
            icon: Icons.calendar_today_outlined,
            text: '${tr.invoice_date}: ${DateFormatter.toDateOnly(invoice.invoiceDate) ?? invoice.invoiceDate}',
          ),
          if (invoice.supplier != null) ...[
            context.vXs,
            _MetaRow(
              icon: Icons.local_shipping_outlined,
              text: '${tr.invoice_supplier}: ${invoice.supplier!.name}',
            ),
          ],
          context.vXs,
          _MetaRow(
            icon: Icons.payments_outlined,
            text:
                '${tr.return_invoice_refund_method}: ${returnRefundMethodLabel(invoice.refundMethod, tr)}',
          ),
          if (invoice.originalPurchaseInvoiceId != null) ...[
            context.vXs,
            _MetaRow(
              icon: Icons.link_outlined,
              text:
                  '${tr.return_invoice_original}: #${invoice.originalPurchaseInvoiceId}',
            ),
          ],
        ],
      ),
    );
  }
}

class _TotalsCard extends StatelessWidget {
  const _TotalsCard({required this.invoice});

  final SupplierReturnInvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Container(
      padding: context.pAllMd,
      decoration: _cardDecoration(context),
      child: Column(
        children: [
          _Row(
            label: tr.return_invoice_subtotal,
            value: _money(invoice.subtotal, tr.sp),
          ),
          _Row(
            label: tr.invoice_tax_total,
            value: _money(invoice.taxTotal, tr.sp),
          ),
          _Row(
            label: tr.invoice_discount_total,
            value: _money(invoice.discountTotal, tr.sp),
          ),
          const Divider(),
          _Row(
            label: tr.return_invoice_refund_total,
            value: _money(invoice.refundTotal, tr.sp),
            prominent: true,
          ),
        ],
      ),
    );
  }
}

class _ItemsCard extends StatelessWidget {
  const _ItemsCard({required this.invoice});

  final SupplierReturnInvoiceModel invoice;

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
            tr.return_invoice_items,
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          context.vMd,
          if (items.isEmpty)
            Text(
              tr.return_invoice_no_items,
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
                    (item.unitPrice * item.quantity) + item.tax - item.discount;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    name,
                    style: context.text.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${item.quantity} × ${_money(item.unitPrice, tr.sp)}'
                    '${item.tax != 0 ? ' + ${_money(item.tax, tr.sp)}' : ''}'
                    '${item.discount != 0 ? ' − ${_money(item.discount, tr.sp)}' : ''}',
                    style: context.text.labelSmall?.copyWith(
                      color: context.muted,
                    ),
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

class _NotesCard extends StatelessWidget {
  const _NotesCard({required this.invoice});

  final SupplierReturnInvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Container(
      padding: context.pAllMd,
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (invoice.reason != null && invoice.reason!.isNotEmpty) ...[
            Text(
              tr.return_invoice_reason,
              style: context.text.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            context.vSm,
            Text(
              invoice.reason!,
              style: context.text.bodyMedium,
            ),
            context.vMd,
          ],
          Text(
            tr.invoice_notes,
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          context.vSm,
          Text(
            invoice.notes?.isNotEmpty == true ? invoice.notes! : '—',
            style: context.text.bodyMedium?.copyWith(
              color: invoice.notes?.isNotEmpty == true ? null : context.muted,
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

  final SupplierReturnInvoiceModel invoice;
  final bool isCancelling;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    if (invoice.isCancelled) {
      return Center(
        child: Text(
          tr.invoice_already_cancelled,
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
                Text(tr.invoice_cancel),
              ],
            ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    this.prominent = false,
  });

  final String label;
  final String value;
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
              style:
                  (prominent
                          ? context.text.titleSmall
                          : context.text.bodyMedium)
                      ?.copyWith(
                        fontWeight: prominent ? FontWeight.bold : null,
                      ),
            ),
          ),
          Text(
            value,
            style:
                (prominent ? context.text.titleMedium : context.text.titleSmall)
                    ?.copyWith(fontWeight: FontWeight.bold),
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
          ShimmerFill(
            width: double.infinity,
            height: context.sMassive,
            radius: 16,
          ),
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
  border: Border.all(width: 1.5, color: context.colors.outline.withAlpha(170)),
  color: context.colors.surfaceContainer,
);

String _money(double amount, String currency) {
  final sign = amount.isNegative ? '-' : '';
  return '$sign${amount.abs().toStringAsFixed(2)} $currency';
}
