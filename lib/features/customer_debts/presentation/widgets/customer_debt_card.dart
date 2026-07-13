import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/core/widgets/status_pill.dart';
import 'package:pharmacy_app/features/customer_debts/data/models/customer_debt_model.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart'
    show SupplierDebtStatus;
import 'package:pharmacy_app/features/supplier_debts/presentation/widgets/supplier_debt_card.dart'
    show debtStatusLabel, debtStatusTone;

/// A single row in the Customer Debts list. Mirrors [SupplierDebtCard] but
/// shows the customer name and reuses the shared debt-status labels/tone.
class CustomerDebtCard extends StatelessWidget {
  const CustomerDebtCard({super.key, required this.debt, this.onTap});

  final CustomerDebtModel debt;
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
                        debt.customer?.fullName ?? '—',
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
                              '${tr.debt_due_date}: ${DateFormatter.toDateOnly(debt.dueDate) ?? debt.dueDate}',
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
                  label: debtStatusLabel(_mapStatus(debt.status), tr),
                  tone: debtStatusTone(_mapStatus(debt.status)),
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

  // Map the customer-debt status enum onto the shared supplier-debt label/tone
  // functions (they have the same members).
  SupplierDebtStatus _mapStatus(CustomerDebtStatus s) {
    return switch (s) {
      CustomerDebtStatus.open => SupplierDebtStatus.open,
      CustomerDebtStatus.partial => SupplierDebtStatus.partial,
      CustomerDebtStatus.paid => SupplierDebtStatus.paid,
      CustomerDebtStatus.overdue => SupplierDebtStatus.overdue,
      CustomerDebtStatus.cancelled => SupplierDebtStatus.cancelled,
    };
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
              style:
                  (prominent
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
