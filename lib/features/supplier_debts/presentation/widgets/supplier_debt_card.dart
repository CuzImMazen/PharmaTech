import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/shared/widgets/status_pill.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';

/// A single row in the Supplier Debts list: supplier name, the remaining
/// amount (prominent), total/paid figures, the status pill, and an optional
/// due date. Mirrors the app's card style (16-radius bordered surfaceContainer).
class SupplierDebtCard extends StatelessWidget {
  const SupplierDebtCard({
    super.key,
    required this.debt,
    this.onTap,
  });

  final SupplierDebtModel debt;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return GestureDetector(
      onTap: onTap,
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
                        debt.supplier?.name ?? '—',
                        style: context.text.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (debt.dueDate != null) ...[
                        context.vXs,
                        Row(
                          children: [
                            Icon(
                              Icons.event_rounded,
                              size: context.iXs,
                              color: context.muted,
                            ),
                            SizedBox(width: context.sXs),
                            Text(
                              '${tr.debt_due_date}: ${debt.dueDate}',
                              style: context.text.labelSmall?.copyWith(
                                color: context.muted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                StatusPill(
                  label: debtStatusLabel(debt.status, tr),
                  tone: debtStatusTone(debt.status),
                ),
              ],
            ),
            context.vMd,
            // Amounts row.
            Container(
              padding: context.pAllMd,
              decoration: BoxDecoration(
                color: context.muted.withAlpha(20),
                borderRadius: context.rMd,
              ),
              child: Row(
                children: [
                  _AmountCell(
                    label: tr.debt_remaining_amount,
                    value: _money(debt.remainingAmount, tr.sp),
                    prominent: true,
                  ),
                  _Divider(),
                  _AmountCell(
                    label: tr.debt_paid_amount,
                    value: _money(debt.paidAmount, tr.sp),
                  ),
                  _Divider(),
                  _AmountCell(
                    label: tr.debt_total_amount,
                    value: _money(debt.totalAmount, tr.sp),
                  ),
                ],
              ),
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

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: context.iLg,
      margin: EdgeInsets.symmetric(horizontal: context.sSm),
      color: context.muted.withAlpha(60),
    );
  }
}

class _AmountCell extends StatelessWidget {
  const _AmountCell({
    required this.label,
    required this.value,
    this.prominent = false,
  });

  final String label;
  final String value;
  final bool prominent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.text.labelSmall?.copyWith(color: context.muted),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          context.vXs,
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: (prominent
                      ? context.text.titleMedium
                      : context.text.titleSmall)
                  ?.copyWith(
                fontWeight: FontWeight.bold,
                color: prominent ? context.colors.error : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Localized label for a debt status.
String debtStatusLabel(SupplierDebtStatus status, AppLocalizations tr) {
  return switch (status) {
    SupplierDebtStatus.open => tr.debt_status_open,
    SupplierDebtStatus.partial => tr.debt_status_partial,
    SupplierDebtStatus.paid => tr.debt_status_paid,
    SupplierDebtStatus.overdue => tr.debt_status_overdue,
    SupplierDebtStatus.cancelled => tr.debt_status_cancelled,
  };
}

/// Visual tone for a debt status.
StatusPillTone debtStatusTone(SupplierDebtStatus status) {
  return switch (status) {
    SupplierDebtStatus.paid => StatusPillTone.positive,
    SupplierDebtStatus.partial => StatusPillTone.warning,
    SupplierDebtStatus.overdue => StatusPillTone.negative,
    SupplierDebtStatus.cancelled => StatusPillTone.neutral,
    SupplierDebtStatus.open => StatusPillTone.info,
  };
}
