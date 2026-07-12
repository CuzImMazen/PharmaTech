import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/shared/widgets/status_pill.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';

/// A single row in the Purchase Invoices list: invoice number, date, supplier
/// name, the grand total, and status + payment-status pills. Mirrors the app's
/// card style (16-radius bordered surfaceContainer).
class PurchaseInvoiceCard extends StatelessWidget {
  const PurchaseInvoiceCard({
    super.key,
    required this.invoice,
    this.isMutating,
    this.onTap,
  });

  final PurchaseInvoiceModel invoice;
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
                            invoice.invoiceDate,
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
                    label: invoiceStatusLabel(invoice.status, tr),
                    tone: invoiceStatusTone(invoice.status),
                  ),
              ],
            ),
            context.vSm,
            if (invoice.supplier != null) ...[
              Row(
                children: [
                  Icon(
                    Icons.local_shipping_outlined,
                    size: context.iXs,
                    color: context.muted,
                  ),
                  SizedBox(width: context.sXs),
                  Expanded(
                    child: Text(
                      invoice.supplier!.name,
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
                  _money(invoice.grandTotal, tr.sp),
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.primary,
                  ),
                ),
                const Spacer(),
                StatusPill(
                  label: invoicePaymentStatusLabel(invoice.paymentStatus, tr),
                  tone: paymentStatusTone(invoice.paymentStatus),
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

/// Localized label for an invoice status.
String invoiceStatusLabel(InvoiceStatus status, AppLocalizations tr) {
  return switch (status) {
    InvoiceStatus.completed => tr.invoice_status_completed,
    InvoiceStatus.cancelled => tr.invoice_status_cancelled,
    InvoiceStatus.pending => tr.invoice_status_pending,
  };
}

/// Visual tone for an invoice status.
StatusPillTone invoiceStatusTone(InvoiceStatus status) {
  return switch (status) {
    InvoiceStatus.completed => StatusPillTone.positive,
    InvoiceStatus.pending => StatusPillTone.warning,
    InvoiceStatus.cancelled => StatusPillTone.neutral,
  };
}

/// Localized label for a payment status.
String invoicePaymentStatusLabel(InvoicePaymentStatus status, AppLocalizations tr) {
  return switch (status) {
    InvoicePaymentStatus.paid => tr.invoice_payment_status_paid,
    InvoicePaymentStatus.partial => tr.invoice_payment_status_partial,
    InvoicePaymentStatus.unpaid => tr.invoice_payment_status_unpaid,
  };
}

/// Visual tone for a payment status.
StatusPillTone paymentStatusTone(InvoicePaymentStatus status) {
  return switch (status) {
    InvoicePaymentStatus.paid => StatusPillTone.positive,
    InvoicePaymentStatus.partial => StatusPillTone.warning,
    InvoicePaymentStatus.unpaid => StatusPillTone.negative,
  };
}

/// Localized label for a payment method.
String invoicePaymentMethodLabel(InvoicePaymentMethod method, AppLocalizations tr) {
  return switch (method) {
    InvoicePaymentMethod.cash => tr.invoice_payment_method_cash,
    InvoicePaymentMethod.credit => tr.invoice_payment_method_credit,
    InvoicePaymentMethod.debt => tr.invoice_payment_method_debt,
  };
}
