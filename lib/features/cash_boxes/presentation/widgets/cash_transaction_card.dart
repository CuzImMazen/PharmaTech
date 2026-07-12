import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transaction_model.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';

/// A single row in the cash-box transaction log. Mirrors the app's card style
/// (16-radius bordered `surfaceContainer`): a colored leading icon (in = green,
/// out = red), the amount with the `+`/`-` sign, the localized type label, and
/// the timestamp + optional recorder.
class CashTransactionCard extends StatelessWidget {
  const CashTransactionCard({super.key, required this.transaction});

  final CashTransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final isIn = transaction.transactionType.isIn;
    final amountColor = isIn ? AppColors.cozyEmerald : AppColors.destructive;
    final sign = isIn ? '+' : '-';

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TypeIcon(type: transaction.transactionType, color: amountColor),
          context.hMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + amount on the same line; the amount sits opposite the
                // label so the footer below gets the full card width for the
                // time + recorder metadata (no truncation competition).
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        cashTransactionTypeLabel(
                          transaction.transactionType,
                          tr,
                        ),
                        style: context.text.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    context.hSm,
                    Text(
                      '$sign${_formatMoney(transaction.amount, tr.sp)}',
                      style: context.text.titleMedium?.copyWith(
                        color: amountColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Reference chip: when the transaction is tied to a purchase
                // invoice, the backend buries its number in `notes` (e.g.
                // "Payment for purchase invoice PUR-2026-0001"). Extract and
                // surface it as a compact chip so the unique number stays
                // visible without showing the unlocalized boilerplate sentence.
                if (_referenceNumber(transaction.notes).isNotEmpty) ...[
                  context.vXs,
                  _ReferenceChip(number: _referenceNumber(transaction.notes)),
                ],
                if (_userNote(transaction.notes).isNotEmpty) ...[
                  context.vXs,
                  Text(
                    _userNote(transaction.notes),
                    style: context.text.bodySmall?.copyWith(
                      color: context.muted,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                // Single compact footer line: timestamp + recorder separated by
                // a dot, both visible without crowding each other onto two
                // stacked rows. The recorder (when present) gets a Flexible
                // wrapper so a long name ellipses instead of overflowing.
                context.vXs,
                Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: context.iXs,
                      color: context.muted,
                    ),
                    SizedBox(width: context.sXs),
                    Flexible(
                      child: Text(
                        _formatDateTime(transaction.transactionTime),
                        style: context.text.labelSmall?.copyWith(
                          color: context.muted,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (transaction.createdBy != null &&
                        transaction.createdBy!.displayName.isNotEmpty) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.sXs,
                        ),
                        child: Text(
                          '·',
                          style: context.text.labelSmall?.copyWith(
                            color: context.muted,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.person_outline_rounded,
                        size: context.iXs,
                        color: context.muted,
                      ),
                      SizedBox(width: context.sXs),
                      Flexible(
                        child: Text(
                          transaction.createdBy!.displayName,
                          style: context.text.labelSmall?.copyWith(
                            color: context.muted,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeIcon extends StatelessWidget {
  const _TypeIcon({required this.type, required this.color});

  final CashTransactionType type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.iLg,
      height: context.iLg,
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: context.rMd,
      ),
      child: Icon(
        cashTransactionTypeIcon(type),
        size: context.iSm,
        color: color,
      ),
    );
  }
}

/// Compact chip that surfaces a transaction's reference (invoice) number —
/// the unique identifier the backend otherwise buries in the boilerplate
/// `notes` string. Kept small and muted so it reads as metadata, not a label.
class _ReferenceChip extends StatelessWidget {
  const _ReferenceChip({required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.sXs,
        vertical: context.sXs / 2,
      ),
      decoration: BoxDecoration(
        color: context.colors.outline.withAlpha(40),
        borderRadius: context.rSm,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: context.iXs,
            color: context.muted,
          ),
          SizedBox(width: context.sXs / 2),
          Text(
            number,
            style: context.text.labelSmall?.copyWith(
              color: context.muted,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Localized label for each cash transaction type.
String cashTransactionTypeLabel(CashTransactionType type, AppLocalizations tr) {
  return switch (type) {
    CashTransactionType.purchaseOut => tr.cash_tx_purchase_out,
    CashTransactionType.saleIn => tr.cash_tx_sale_in,
    CashTransactionType.customerReturnOut => tr.cash_tx_customer_return_out,
    CashTransactionType.supplierReturnIn => tr.cash_tx_supplier_return_in,
    CashTransactionType.customerDebtPaymentIn =>
      tr.cash_tx_customer_debt_payment_in,
    CashTransactionType.supplierDebtPaymentOut =>
      tr.cash_tx_supplier_debt_payment_out,
    CashTransactionType.manualIn => tr.cash_tx_manual_in,
    CashTransactionType.manualOut => tr.cash_tx_manual_out,
  };
}

/// Icon for each cash transaction type.
IconData cashTransactionTypeIcon(CashTransactionType type) {
  return switch (type) {
    CashTransactionType.purchaseOut => Icons.outbound_rounded,
    CashTransactionType.saleIn => Icons.point_of_sale_rounded,
    CashTransactionType.customerReturnOut => Icons.undo_rounded,
    CashTransactionType.supplierReturnIn => Icons.replay_circle_filled_rounded,
    CashTransactionType.customerDebtPaymentIn => Icons.payments_rounded,
    CashTransactionType.supplierDebtPaymentOut => Icons.local_shipping_rounded,
    CashTransactionType.manualIn => Icons.south_west_rounded,
    CashTransactionType.manualOut => Icons.north_east_rounded,
  };
}

String _formatMoney(double amount, String currency) {
  return '${amount.abs().toStringAsFixed(2)} $currency';
}

String _formatDateTime(String iso) {
  final parsed = DateTime.tryParse(iso);
  if (parsed == null) return iso;
  final d = parsed.toLocal();
  String two(int n) => n.toString().padLeft(2, '0');
  return '${d.year}-${two(d.month)}-${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
}

/// Returns a user-written note to display, or an empty string to hide it.
///
/// The backend auto-fills `notes` with English boilerplate for system-driven
/// transactions (e.g. "Payment for purchase invoice PUR-2026-0001",
/// "Refund — invoice PUR-2026-0001 cancelled") which is unlocalized and
/// redundant with the localized type label ("Purchase Out", "Supplier Return
/// In"). Hide those and only surface genuinely user-written notes.
String _userNote(String? raw) {
  final note = raw?.trim() ?? '';
  if (note.isEmpty) return '';
  final lower = note.toLowerCase();
  const boilerplate = [
    'payment for purchase invoice',
    'refund — invoice',
    'refund - invoice',
    'refund invoice',
    'refund for invoice',
  ];
  for (final prefix in boilerplate) {
    if (lower.startsWith(prefix)) return '';
  }
  return note;
}

/// Extracts a reference (invoice) number from a boilerplate note, e.g.
/// "PUR-2026-0001" out of "Payment for purchase invoice PUR-2026-0001".
/// Returns '' when there's no recognisable reference — so the chip is only
/// shown for system-driven transactions that actually carry one.
String _referenceNumber(String? raw) {
  final note = raw ?? '';
  // Invoice numbers the backend generates look like `PUR-YYYY-NNNN`. Match
  // any `XXX-YYYY-NNNN[-...]` token to stay resilient to format tweaks.
  final match = RegExp(
    r'\b([A-Z]{2,5}-\d{4}-\d{1,6}(?:-\d+)?)\b',
  ).firstMatch(note);
  return match?.group(1) ?? '';
}
