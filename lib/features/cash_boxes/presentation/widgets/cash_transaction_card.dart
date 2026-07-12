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
        children: [
          _TypeIcon(type: transaction.transactionType, color: amountColor),
          context.hMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cashTransactionTypeLabel(transaction.transactionType, tr),
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (transaction.notes != null &&
                    transaction.notes!.isNotEmpty) ...[
                  context.vXs,
                  Text(
                    transaction.notes!,
                    style: context.text.bodySmall?.copyWith(
                      color: context.muted,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
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
                      SizedBox(width: context.sSm),
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
          context.hMd,
          Text(
            '$sign${_formatMoney(transaction.amount, tr.sp)}',
            style: context.text.titleMedium?.copyWith(
              color: amountColor,
              fontWeight: FontWeight.bold,
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
