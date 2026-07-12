import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/cash_boxes/cubit/cash_box_cubit.dart';
import 'package:pharmacy_app/features/cash_boxes/cubit/cash_box_state.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_box_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transaction_model.dart';
import 'package:pharmacy_app/features/cash_boxes/presentation/widgets/cash_box_shimmer.dart';
import 'package:pharmacy_app/features/cash_boxes/presentation/widgets/cash_transaction_card.dart';

/// Cash Box screen: the pharmacy's single cash drawer + its transaction log.
/// When no box exists yet (backend 404), shows a one-time "Create cash box"
/// setup card; otherwise shows the balance summary and a filterable,
/// paginated transaction history.
class CashBoxScreen extends StatefulWidget {
  const CashBoxScreen({super.key});

  @override
  State<CashBoxScreen> createState() => _CashBoxScreenState();
}

class _CashBoxScreenState extends State<CashBoxScreen> {
  late final ScrollController _scrollController;
  late final TextEditingController _openingBalanceController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _openingBalanceController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _openingBalanceController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.extentAfter < 320) {
      context.read<CashBoxCubit>().loadNextTransactions();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<CashBoxCubit>();

    return BlocListener<CashBoxCubit, CashBoxState>(
      listenWhen: (p, c) =>
          p.lastAction != c.lastAction || p.failure != c.failure,
      listener: (context, state) {
        if (state.lastAction != null) {
          AppSnackbar.success(message: tr.cash_box_created);
          cubit.clearAction();
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(
            message: state.failure!.localizedMessage(context),
          );
          cubit.clearAction();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(tr.cash_box_title)),
        body: SafeArea(
          child: BlocBuilder<CashBoxCubit, CashBoxState>(
            builder: (context, state) {
              if (state.isInitialLoading) return const CashBoxShimmer();

              // Hard error on the initial box fetch (not a 404).
              if (state.failure != null &&
                  state.cashBox == null &&
                  !state.hasNoBox) {
                return _ErrorState(
                  message: state.failure!.localizedMessage(context),
                  onRetry: cubit.refresh,
                );
              }

              // No box yet → one-time setup.
              if (state.hasNoBox) {
                return _CreateBoxCard(
                  controller: _openingBalanceController,
                  isCreating: state.isCreating,
                  onCreate: () => _createBox(context),
                );
              }

              return Column(
                children: [
                  _BoxSummaryCard(box: state.cashBox!),
                  context.vMd,
                  _TxFilterRow(
                    selected: state.txFilter,
                    onSelect: cubit.setTxFilter,
                  ),
                  context.vMd,
                  Expanded(
                    child: _TransactionsList(
                      state: state,
                      scrollController: _scrollController,
                      onRetry: cubit.refresh,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _createBox(BuildContext context) {
    final cubit = context.read<CashBoxCubit>();
    final raw = _openingBalanceController.text.trim();
    final value = double.tryParse(raw);
    if (raw.isEmpty || value == null || value < 0) {
      AppSnackbar.failure(message: context.tr.cash_box_opening_balance_invalid);
      return;
    }
    cubit.createCashBox(value);
  }
}

class _BoxSummaryCard extends StatelessWidget {
  const _BoxSummaryCard({required this.box});

  final CashBoxModel box;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Container(
      width: double.infinity,
      margin: context.pHorizontal,
      padding: context.pAllLg,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.dashBoardHeaderGradient,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white.withAlpha(220),
                size: context.iMd,
              ),
              context.hSm,
              Text(
                tr.cash_box_current_balance,
                style: context.text.titleSmall?.copyWith(
                  color: Colors.white.withAlpha(220),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          context.vSm,
          Text(
            _formatMoney(box.currentBalance, tr.sp),
            style: context.text.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          context.vLg,
          Divider(color: Colors.white.withAlpha(60)),
          context.vSm,
          Row(
            children: [
              Expanded(
                child: _BalanceField(
                  label: tr.cash_box_opening_balance,
                  amount: box.openingBalance,
                  currency: tr.sp,
                ),
              ),
              Container(
                width: 1,
                height: context.iLg,
                color: Colors.white.withAlpha(60),
              ),
              Expanded(
                child: _BalanceField(
                  label: tr.cash_box_net_change,
                  amount: box.currentBalance - box.openingBalance,
                  currency: tr.sp,
                  isDelta: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BalanceField extends StatelessWidget {
  const _BalanceField({
    required this.label,
    required this.amount,
    required this.currency,
    this.isDelta = false,
  });

  final String label;
  final double amount;
  final String currency;
  final bool isDelta;

  @override
  Widget build(BuildContext context) {
    final color = isDelta
        ? (amount >= 0 ? Colors.white : Colors.red.shade100)
        : Colors.white.withAlpha(220);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sSm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.text.labelSmall?.copyWith(
              color: Colors.white.withAlpha(180),
            ),
          ),
          context.vXs,
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              _formatMoney(amount, currency),
              style: context.text.titleMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TxFilterRow extends StatelessWidget {
  const _TxFilterRow({required this.selected, required this.onSelect});

  final CashTransactionType? selected;
  final ValueChanged<CashTransactionType?> onSelect;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final chips = <_FilterChipData>[
      _FilterChipData(null, tr.cash_box_all_types),
      for (final type in CashTransactionType.values)
        _FilterChipData(type, cashTransactionTypeLabel(type, context.tr)),
    ];

    return SizedBox(
      height: context.iLg,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: context.pHorizontal,
        itemCount: chips.length,
        separatorBuilder: (context, index) => context.hXs,
        itemBuilder: (context, index) {
          final chip = chips[index];
          final active = selected == chip.type;
          return FilterChip(
            label: Text(chip.label),
            selected: active,
            onSelected: (_) => onSelect(active ? null : chip.type),
            showCheckmark: false,
          );
        },
      ),
    );
  }
}

class _TransactionsList extends StatelessWidget {
  const _TransactionsList({
    required this.state,
    required this.scrollController,
    required this.onRetry,
  });

  final CashBoxState state;
  final ScrollController scrollController;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    if (state.areTransactionsLoading && state.transactions.isEmpty) {
      return const CashBoxShimmer();
    }

    if (state.failure != null && state.transactions.isEmpty) {
      return _ErrorState(
        message: state.failure!.localizedMessage(context),
        onRetry: onRetry,
      );
    }

    if (state.transactions.isEmpty) {
      return _EmptyState(message: tr.cash_box_no_transactions);
    }

    return Column(
      children: [
        if (state.isRefreshing && state.transactions.isNotEmpty)
          const LinearProgressIndicator(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => context.read<CashBoxCubit>().refreshTransactions(),
            child: ListView.separated(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: context.pHorizontal,
              itemCount:
                  state.transactions.length + (state.isLoadingMore ? 1 : 0),
              separatorBuilder: (context, index) => context.vMd,
              itemBuilder: (context, index) {
                if (index >= state.transactions.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CashTransactionCard(
                  transaction: state.transactions[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _CreateBoxCard extends StatelessWidget {
  const _CreateBoxCard({
    required this.controller,
    required this.isCreating,
    required this.onCreate,
  });

  final TextEditingController controller;
  final bool isCreating;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: context.pAllLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.savings_rounded,
              size: context.iHuge,
              color: context.muted,
            ),
            context.vLg,
            Text(
              tr.cash_box_no_box_title,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            context.vSm,
            Text(
              tr.cash_box_no_box_hint,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
              textAlign: TextAlign.center,
            ),
            context.vLg,
            AbsorbPointer(
              absorbing: isCreating,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.cash_box_opening_balance,
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                    decoration: InputDecoration(
                      hintText: '0',
                      prefixIcon: Icon(
                        Icons.payments_outlined,
                        color: context.muted,
                        size: 22,
                      ),
                      filled: true,
                      fillColor: theme.colorScheme.surface,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: context.muted.withValues(alpha: 0.2),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.primaryVariant,
                          width: 1.8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            context.vLg,
            CustomButton(
              onTap: isCreating ? null : onCreate,
              child: isCreating
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(tr.cash_box_create),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.pAllLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: context.iHuge,
              color: context.muted,
            ),
            context.vLg,
            Text(
              message,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

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

class _FilterChipData {
  const _FilterChipData(this.type, this.label);
  final CashTransactionType? type;
  final String label;
}

/// Formats a monetary amount with two decimals + the given currency suffix.
String _formatMoney(double amount, String currency) {
  final sign = amount.isNegative ? '-' : '';
  final abs = amount.abs().toStringAsFixed(2);
  return '$sign$abs $currency';
}
