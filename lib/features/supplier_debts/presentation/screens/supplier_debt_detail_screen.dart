import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
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
      child: _Body(debtId: debtId),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.debtId});

  final int debtId;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<SupplierDebtDetailCubit>();

    return BlocListener<SupplierDebtDetailCubit, SupplierDebtDetailState>(
      listenWhen: (p, c) => p.justPaid != c.justPaid || p.failure != c.failure,
      listener: (context, state) {
        if (state.justPaid) {
          AppSnackbar.success(message: tr.debt_pay_success);
          cubit.clearSignal();
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(
            message: state.failure!.localizedMessage(context),
          );
          cubit.clearSignal();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(tr.debts_title)),
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
              if (state.debt == null) {
                return _Loading();
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
                    context.vMd,
                    _PayAction(
                      debt: debt,
                      isPaying: state.isPaying,
                      onTap: () => _showPaySheet(context, debt),
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

  Future<void> _showPaySheet(
    BuildContext context,
    SupplierDebtModel debt,
  ) async {
    final cubit = context.read<SupplierDebtDetailCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(context.sXl)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: cubit,
        child: _PaySheet(debt: debt),
      ),
    );
  }
}

/// "Record payment" action. Hidden once the debt is fully paid/cancelled.
class _PayAction extends StatelessWidget {
  const _PayAction({
    required this.debt,
    required this.isPaying,
    required this.onTap,
  });

  final SupplierDebtModel debt;
  final bool isPaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final canPay =
        debt.status != SupplierDebtStatus.paid &&
        debt.status != SupplierDebtStatus.cancelled &&
        debt.remainingAmount > 0;
    if (!canPay && !isPaying) {
      return const SizedBox.shrink();
    }
    return CustomButton(
      onTap: isPaying ? null : onTap,
      child: isPaying
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
                const Icon(Icons.payments_rounded, color: Colors.white),
                SizedBox(width: context.sSm),
                Text(context.tr.debt_pay),
              ],
            ),
    );
  }
}

class _PaySheet extends StatefulWidget {
  const _PaySheet({required this.debt});

  final SupplierDebtModel debt;

  @override
  State<_PaySheet> createState() => _PaySheetState();
}

class _PaySheetState extends State<_PaySheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _amount;
  late final TextEditingController _notes;
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    _amount = TextEditingController();
    _notes = TextEditingController();
    _date = DateTime.now();
  }

  @override
  void dispose() {
    _amount.dispose();
    _notes.dispose();
    super.dispose();
  }

  String get _dateStr =>
      '${_date.year}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')}';

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _date = picked);
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final amount = double.tryParse(_amount.text.trim());
    if (amount == null || amount <= 0) return;
    if (amount > widget.debt.remainingAmount) return;

    final cubit = context.read<SupplierDebtDetailCubit>();
    Navigator.of(context).pop();
    cubit.payDebt(
      widget.debt.id,
      amount: amount,
      paymentDate: _dateStr,
      notes: _notes.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.sLg,
        context.sLg,
        context.sLg,
        MediaQuery.of(context).viewInsets.bottom + context.sLg,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr.debt_pay_title,
                style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              context.vSm,
              Text(
                '${tr.debt_remaining_amount}: ${_money(widget.debt.remainingAmount, tr.sp)}',
                style: context.text.bodyMedium?.copyWith(color: context.muted),
              ),
              context.vMd,
              CustomTextField(
                controller: _amount,
                labelText: tr.debt_pay_amount,
                hintText: tr.debt_pay_amount_hint,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                prefixIcon: Icons.payments_outlined,
                onlyDigits: false,
                validator: (value) => _validateAmount(value, tr),
              ),
              context.vMd,
              _DateField(
                label: tr.debt_pay_date,
                value: _dateStr,
                onTap: _pickDate,
              ),
              context.vMd,
              CustomTextField(
                controller: _notes,
                labelText: tr.debt_pay_notes,
                hintText: tr.debt_pay_notes_hint,
                prefixIcon: Icons.notes_outlined,
                height: 100,
              ),
              context.vLg,
              CustomButton(onTap: _submit, child: Text(tr.debt_pay)),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateAmount(String? value, AppLocalizations tr) {
    final amount = double.tryParse(value?.trim() ?? '');
    if (amount == null || amount <= 0) {
      return tr.debt_pay_invalid_amount;
    }
    if (amount > widget.debt.remainingAmount) {
      return tr.debt_pay_exceeds_remaining;
    }
    return null;
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.text.titleSmall),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: context.muted.withValues(alpha: 0.2),
                  width: 1.5,
                ),
              ),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: context.muted,
                  size: 22,
                ),
                const SizedBox(width: 12),
                Text(value, style: context.text.bodyLarge),
              ],
            ),
          ),
        ),
      ],
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
                  '${tr.debt_due_date}: ${DateFormatter.toDateOnly(debt.dueDate) ?? debt.dueDate}',
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
                    '${tr.debt_payment_date}: ${DateFormatter.toDateOnly(p.paymentDate) ?? p.paymentDate}'
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
