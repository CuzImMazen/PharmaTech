import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/features/dashboard/data/models/dashboard_transaction_model.dart';

class RecentTransactionsItem extends StatelessWidget {
  const RecentTransactionsItem({
    super.key,
    required this.transaction,
  });

  final DashboardTransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    final amountPrefix = transaction.type.isIncoming ? '+' : '-';
    final amountColor = transaction.type.isIncoming
        ? AppColors.cozyEmerald
        : AppColors.cozyAmber;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(26),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                _iconFor(transaction.type),
                size: context.iXs,
                color: AppColors.primary,
              ),
            ),
          ),
          context.hMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _labelFor(context, transaction.type),
                  style: context.text.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                context.vXs,
                Text(
                  transaction.invoiceNumber,
                  style: context.text.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$amountPrefix${transaction.amount.toStringAsFixed(0)} ${context.tr.sp}',
                style: context.text.titleSmall?.copyWith(color: amountColor),
              ),
              context.vXs,
              Text(
                _subtitle(context),
                style: context.text.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _subtitle(BuildContext context) {
    final dateOnly = DateFormatter.toDateOnly(transaction.invoiceDate);
    if (dateOnly != null) return dateOnly;
    return transaction.invoiceDate;
  }

  IconData _iconFor(DashboardTransactionType type) {
    return switch (type) {
      DashboardTransactionType.sale => LucideIcons.shoppingBag,
      DashboardTransactionType.purchase => LucideIcons.truck,
      DashboardTransactionType.customerReturn =>
        LucideIcons.arrowLeftRight,
      DashboardTransactionType.supplierReturn =>
        LucideIcons.arrowLeftRight,
    };
  }

  String _labelFor(BuildContext context, DashboardTransactionType type) {
    return switch (type) {
      DashboardTransactionType.sale => context.tr.dashboard_tx_sale,
      DashboardTransactionType.purchase => context.tr.dashboard_tx_purchase,
      DashboardTransactionType.customerReturn =>
        context.tr.dashboard_tx_customer_return,
      DashboardTransactionType.supplierReturn =>
        context.tr.dashboard_tx_supplier_return,
    };
  }
}
