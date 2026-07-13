import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/widgets/status_pill.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoice_model.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';

/// A single row in the Customer Return Invoices list: return number, date,
/// customer name, the refund total, and a status pill. Mirrors
/// [SalesInvoiceCard]'s card style (16-radius bordered surfaceContainer).
class CustomerReturnInvoiceCard extends StatelessWidget {
  const CustomerReturnInvoiceCard({
    super.key,
    required this.invoice,
    this.isMutating,
    this.onTap,
  });

  final CustomerReturnInvoiceModel invoice;
  final bool? isMutating;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return GestureDetector(
      onTap: isMutating == true ? null : onTap,
      child: Container(
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        invoice.invoiceNumber,
                        style: context.text.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      context.vXs,
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: context.iXs,
                            color: context.muted,
                          ),
                          SizedBox(width: context.sXs),
                          Text(
                            invoice.invoiceDate.length >= 10
                                ? invoice.invoiceDate.substring(0, 10)
                                : invoice.invoiceDate,
                            style: context.text.labelSmall?.copyWith(
                              color: context.muted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (isMutating == true)
                  const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  StatusPill(
                    label: returnStatusLabel(invoice.status, tr),
                    tone: returnStatusTone(invoice.status),
                  ),
              ],
            ),
            context.vSm,
            if (invoice.customer != null) ...[
              Row(
                children: [
                  Icon(
                    Icons.person_outline_rounded,
                    size: context.iXs,
                    color: context.muted,
                  ),
                  SizedBox(width: context.sXs),
                  Expanded(
                    child: Text(
                      invoice.customer!.fullName,
                      style: context.text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              context.vSm,
            ],
            Row(
              children: [
                Text(
                  _money(invoice.refundTotal, tr.sp),
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.primary,
                  ),
                ),
                const Spacer(),
                StatusPill(
                  label: returnRefundMethodLabel(invoice.refundMethod, tr),
                  tone: invoice.refundMethod == ReturnRefundMethod.cash
                      ? StatusPillTone.positive
                      : StatusPillTone.info,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _money(double amount, String currency) {
    return '${amount.abs().toStringAsFixed(2)} $currency';
  }
}

/// Localized label for a return-invoice lifecycle status. The keys mirror the
/// backend's enum names (completed / cancelled / pending) and reuse the
/// shared invoice-status strings where the semantics match.
String returnStatusLabel(ReturnInvoiceStatus status, AppLocalizations tr) {
  return switch (status) {
    ReturnInvoiceStatus.completed => tr.invoice_status_completed,
    ReturnInvoiceStatus.cancelled => tr.invoice_status_cancelled,
    ReturnInvoiceStatus.pending => tr.invoice_status_pending,
  };
}

/// Visual tone for a return-invoice status pill. Completed → positive,
/// cancelled → negative, pending → info.
StatusPillTone returnStatusTone(ReturnInvoiceStatus status) {
  return switch (status) {
    ReturnInvoiceStatus.completed => StatusPillTone.positive,
    ReturnInvoiceStatus.cancelled => StatusPillTone.negative,
    ReturnInvoiceStatus.pending => StatusPillTone.info,
  };
}

/// Localized label for the refund method (cash / credit).
String returnRefundMethodLabel(ReturnRefundMethod method, AppLocalizations tr) {
  return switch (method) {
    ReturnRefundMethod.cash => tr.return_invoice_refund_cash,
    ReturnRefundMethod.credit => tr.return_invoice_refund_credit,
  };
}
