import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';
import 'package:pharmacy_app/core/widgets/status_pill.dart';
import 'package:pharmacy_app/features/supplier_debts/cubit/supplier_debt_detail_cubit.dart';
import 'package:pharmacy_app/features/supplier_debts/cubit/supplier_debt_detail_state.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';
import 'package:pharmacy_app/features/supplier_debts/data/repo/supplier_debt_repository.dart';
import 'package:pharmacy_app/features/supplier_debts/presentation/widgets/supplier_debt_card.dart';

/// Read-only detail for a single supplier debt: the summary card (reusing
/// the list card's layout concept) + the payments timeline.
class SupplierDebtDetailScreen extends StatelessWidget {
  const SupplierDebtDetailScreen({super.key, required this.debtId});

  final int debtId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SupplierDebtDetailCubit(repository: sl<SupplierDebtRepository>())
            ..loadDebt(debtId),
      child: Scaffold(
        appBar: AppBar(title: Text(context.tr.debts_title)),
        body: SafeArea(
          child: BlocBuilder<SupplierDebtDetailCubit, SupplierDebtDetailState>(
            builder: (context, state) {
              if (state.isLoading && state.debt == null) {
                return _Loading();
              }
              if (state.failure != null && state.debt == null) {
                return _Error(
                  message: state.failure!.localizedMessage(context),
                  onRetry: () =>
                      context.read<SupplierDebtDetailCubit>().loadDebt(debtId),
                );
              }
              final debt = state.debt!;
              return RefreshIndicator(
                onRefresh: () =>
                    context.read<SupplierDebtDetailCubit>().refresh(debtId),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: context.pHorizontal,
                  children: [
                    context.vSm,
                    _DebtHeaderCard(debt: debt),
                    context.vMd,
                    _AmountsCard(debt: debt),
                    context.vMd,
                    _PaymentsCard(debt: debt),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _DebtHeaderCard extends StatelessWidget {
  const _DebtHeaderCard({required this.debt});

  final SupplierDebtModel debt;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.business_outlined,
                size: context.iSm,
                color: context.muted,
              ),
              SizedBox(width: context.sXs),
              Expanded(
                child: Text(
                  debt.supplier?.name ?? '—',
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              StatusPill(
                label: debtStatusLabel(debt.status, tr),
                tone: debtStatusTone(debt.status),
              ),
            ],
          ),
          if (debt.dueDate != null) ...[
            context.vSm,
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
                  style: context.text.bodyMedium?.copyWith(
                    color: context.muted,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _AmountsCard extends StatelessWidget {
  const _AmountsCard({required this.debt});

  final SupplierDebtModel debt;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
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
      child: Column(
        children: [
          _AmountRow(
            label: tr.debt_total_amount,
            value: _money(debt.totalAmount, tr.sp),
          ),
          _AmountRow(
            label: tr.debt_paid_amount,
            value: _money(debt.paidAmount, tr.sp),
            color: AppColors.cozyEmerald,
          ),
          _AmountRow(
            label: tr.debt_remaining_amount,
            value: _money(debt.remainingAmount, tr.sp),
            color: context.colors.error,
            prominent: true,
          ),
        ],
      ),
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({
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
                    ?.copyWith(fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}

class _PaymentsCard extends StatelessWidget {
  const _PaymentsCard({required this.debt});

  final SupplierDebtModel debt;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final payments = debt.payments ?? [];
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr.debt_payments_title,
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          context.vMd,
          if (payments.isEmpty)
            Text(
              tr.debt_no_payments,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: payments.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: context.colors.outline.withAlpha(80),
              ),
              itemBuilder: (context, index) {
                final p = payments[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: AppColors.cozyEmerald.withAlpha(25),
                    child: Icon(
                      Icons.payments_rounded,
                      color: AppColors.cozyEmerald,
                      size: context.iSm,
                    ),
                  ),
                  title: Text(
                    _money(p.amount, tr.sp),
                    style: context.text.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${tr.debt_payment_date}: ${p.paymentDate}'
                    '${p.createdBy != null && p.createdBy!.displayName.isNotEmpty ? ' • ${p.createdBy!.displayName}' : ''}',
                    style: context.text.labelSmall?.copyWith(
                      color: context.muted,
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

String _money(double amount, String currency) {
  return '${amount.abs().toStringAsFixed(2)} $currency';
}
