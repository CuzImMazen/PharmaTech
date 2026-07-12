import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/purchase_invoices/presentation/widgets/purchase_invoice_card.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';
import 'package:pharmacy_app/features/shared/widgets/status_pill.dart';

// Re-export the shared invoice label/tone helpers (the enums are shared, so
// these work unchanged for sales invoices). Callers should import them from
// `purchase_invoice_card.dart`; these aliases keep the sales feature
// self-contained and document the reuse.
export 'package:pharmacy_app/features/purchase_invoices/presentation/widgets/purchase_invoice_card.dart'
    show
        invoiceStatusLabel,
        invoiceStatusTone,
        invoicePaymentStatusLabel,
        paymentStatusTone,
        invoicePaymentMethodLabel;

/// A single row in the Sales Invoices list: invoice number, date, customer
/// name, the grand total, and status + payment-status pills. Mirrors the app's
/// card style (16-radius bordered surfaceContainer).
class SalesInvoiceCard extends StatelessWidget {
  const SalesInvoiceCard({
    super.key,
    required this.invoice,
    this.isMutating,
    this.onTap,
  });

  final SalesInvoiceModel invoice;
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
