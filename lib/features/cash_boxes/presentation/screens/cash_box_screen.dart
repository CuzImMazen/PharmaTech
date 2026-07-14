import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/cash_boxes/cubit/cash_box_cubit.dart';
import 'package:pharmacy_app/features/cash_boxes/cubit/cash_box_state.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_box_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_box_statistics_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transaction_model.dart';
import 'package:pharmacy_app/features/cash_boxes/presentation/widgets/cash_box_shimmer.dart';
import 'package:pharmacy_app/features/cash_boxes/presentation/widgets/cash_transaction_card.dart';

/// Cash Box screen: the pharmacy's single cash drawer + its transaction log.
/// When no box exists yet (backend 404), shows a one-time "Create cash box"
/// setup card; otherwise shows the balance summary, income/outcome statistics,
/// a compact filter bar, and a paginated transaction history.
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
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () => cubit.refresh(),
                      child: CustomScrollView(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        slivers: [
                          SliverPadding(
                            padding: context.pHorizontal,
                            sliver: SliverToBoxAdapter(
                              child: _BoxSummaryCard(box: state.cashBox!),
                            ),
                          ),
                          SliverToBoxAdapter(child: context.vMd),
                          SliverPadding(
                            padding: context.pHorizontal,
                            sliver: SliverToBoxAdapter(
                              child: _StatisticsCard(
                                statistics: state.statistics,
                                isLoading: state.isLoadingStatistics,
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(child: context.vMd),
                          SliverPadding(
                            padding: context.pHorizontal,
                            sliver: SliverToBoxAdapter(
                              child: _FilterBar(
                                selectedType: state.txFilter,
                                fromDate: state.fromDate,
                                toDate: state.toDate,
                                onTapFilters: () => _openFilters(context),
                                onClearType: () => cubit.setTxFilter(null),
                                onClearDateRange: () =>
                                    cubit.setDateRange(from: null, to: null),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(child: context.vMd),
                          if (state.areTransactionsLoading &&
                              state.transactions.isNotEmpty)
                            const SliverToBoxAdapter(
                              child: LinearProgressIndicator(minHeight: 2),
                            ),
                          _TransactionsSliver(state: state),
                        ],
                      ),
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

  Future<void> _openFilters(BuildContext context) async {
    final cubit = context.read<CashBoxCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(context.sXl)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: cubit,
        child: const _TxFilterSheet(),
      ),
    );
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

enum _StatisticsPeriod { today, week, month }

class _StatisticsCard extends StatefulWidget {
  const _StatisticsCard({
    required this.statistics,
    required this.isLoading,
  });

  final CashBoxStatisticsModel? statistics;
  final bool isLoading;

  @override
  State<_StatisticsCard> createState() => _StatisticsCardState();
}

class _StatisticsCardState extends State<_StatisticsCard> {
  _StatisticsPeriod _period = _StatisticsPeriod.today;

  CashBoxPeriodStatistics? get _currentPeriod {
    final stats = widget.statistics;
    if (stats == null) return null;
    return switch (_period) {
      _StatisticsPeriod.today => stats.today,
      _StatisticsPeriod.week => stats.week,
      _StatisticsPeriod.month => stats.month,
    };
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final period = _currentPeriod;

    return Container(
      width: double.infinity,
      padding: context.pAllLg,
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.colors.outline.withAlpha(170),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr.cash_box_statistics,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.isLoading)
                SizedBox(
                  width: context.iSm,
                  height: context.iSm,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            ],
          ),
          context.vMd,
          Row(
            children: [
              _PeriodChip(
                label: tr.today,
                selected: _period == _StatisticsPeriod.today,
                onTap: () => setState(
                  () => _period = _StatisticsPeriod.today,
                ),
              ),
              context.hSm,
              _PeriodChip(
                label: tr.this_week,
                selected: _period == _StatisticsPeriod.week,
                onTap: () => setState(
                  () => _period = _StatisticsPeriod.week,
                ),
              ),
              context.hSm,
              _PeriodChip(
                label: tr.cash_box_month,
                selected: _period == _StatisticsPeriod.month,
                onTap: () => setState(
                  () => _period = _StatisticsPeriod.month,
                ),
              ),
            ],
          ),
          context.vMd,
          if (period != null)
            Row(
              children: [
                Expanded(
                  child: _PeriodStat(
                    label: tr.cash_box_in,
                    amount: period.inAmount,
                    currency: tr.sp,
                    isIn: true,
                  ),
                ),
                context.hSm,
                Expanded(
                  child: _PeriodStat(
                    label: tr.cash_box_out,
                    amount: period.outAmount,
                    currency: tr.sp,
                    isIn: false,
                  ),
                ),
              ],
            )
          else
            SizedBox(
              height: context.iLg,
              child: Center(
                child: Text(
                  '—',
                  style: context.text.bodyMedium?.copyWith(
                    color: context.muted,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PeriodChip extends StatelessWidget {
  const _PeriodChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
    );
  }
}

class _PeriodStat extends StatelessWidget {
  const _PeriodStat({
    required this.label,
    required this.amount,
    required this.currency,
    required this.isIn,
  });

  final String label;
  final double amount;
  final String currency;
  final bool isIn;

  @override
  Widget build(BuildContext context) {
    final color = isIn ? AppColors.cozyEmerald : AppColors.destructive;
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.text.labelSmall?.copyWith(color: color),
          ),
          context.vXs,
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${isIn ? '+' : '-'}${_formatMoney(amount, currency)}',
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

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.selectedType,
    required this.fromDate,
    required this.toDate,
    required this.onTapFilters,
    required this.onClearType,
    required this.onClearDateRange,
  });

  final CashTransactionType? selectedType;
  final String? fromDate;
  final String? toDate;
  final VoidCallback onTapFilters;
  final VoidCallback onClearType;
  final VoidCallback onClearDateRange;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final active =
        selectedType != null || fromDate != null || toDate != null;

    return Row(
      children: [
        OutlinedButton.icon(
          onPressed: onTapFilters,
          icon: Icon(Icons.filter_list_rounded, size: context.iSm),
          label: Text(tr.filter_filters_and_sort),
          style: OutlinedButton.styleFrom(
            foregroundColor:
                active ? context.primary : context.colors.onSurface,
            side: BorderSide(
              color: active ? context.primary : context.muted.withAlpha(120),
            ),
          ),
        ),
        context.hSm,
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                if (selectedType != null)
                  _ActiveFilterChip(
                    label: cashTransactionTypeLabel(selectedType!, tr),
                    onClear: onClearType,
                  ),
                if (fromDate != null || toDate != null)
                  _ActiveFilterChip(
                    label: _formatDateRange(fromDate, toDate),
                    onClear: onClearDateRange,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatDateRange(String? from, String? to) {
    final f = DateFormatter.toDateOnly(from);
    final t = DateFormatter.toDateOnly(to);
    if (f != null && t != null && f == t) return f;
    if (f != null && t != null) return '$f → $t';
    return f ?? t ?? '';
  }
}

class _ActiveFilterChip extends StatelessWidget {
  const _ActiveFilterChip({required this.label, required this.onClear});

  final String label;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.sSm),
      child: Chip(
        label: Text(label),
        labelStyle: context.text.labelSmall?.copyWith(
          color: context.primary,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: context.primary.withAlpha(25),
        side: BorderSide(color: context.primary.withAlpha(80)),
        visualDensity: VisualDensity.compact,
        deleteIcon: Icon(Icons.close_rounded, size: context.iXs),
        onDeleted: onClear,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

class _TxFilterSheet extends StatefulWidget {
  const _TxFilterSheet();

  @override
  State<_TxFilterSheet> createState() => _TxFilterSheetState();
}

class _TxFilterSheetState extends State<_TxFilterSheet> {
  CashTransactionType? _type;
  DateTime? _from;
  DateTime? _to;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<CashBoxCubit>();
    _type = cubit.state.txFilter;
    _from = _parse(cubit.state.fromDate);
    _to = _parse(cubit.state.toDate);
  }

  DateTime? _parse(String? iso) {
    if (iso == null || iso.isEmpty) return null;
    return DateTime.tryParse(iso);
  }

  String? _format(DateTime? date) {
    if (date == null) return null;
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<CashBoxCubit>();

    return SafeArea(
      child: Padding(
        padding: context.pAllLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr.filter_filters,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            context.vMd,
            Text(tr.cash_box_all_types, style: context.text.titleSmall),
            context.vSm,
            Wrap(
              spacing: context.sSm,
              runSpacing: context.sSm,
              children: [
                _Chip(
                  label: tr.filter_all,
                  selected: _type == null,
                  onTap: () => setState(() => _type = null),
                ),
                for (final type in CashTransactionType.values)
                  _Chip(
                    label: cashTransactionTypeLabel(type, tr),
                    selected: _type == type,
                    onTap: () => setState(() => _type = type),
                  ),
              ],
            ),
            context.vMd,
            Text(tr.filter_expiry_date, style: context.text.titleSmall),
            context.vSm,
            Row(
              children: [
                Expanded(
                  child: _DateField(
                    hint: tr.filter_from,
                    date: _from,
                    onTap: () => _pickDate(isFrom: true),
                  ),
                ),
                context.hSm,
                Expanded(
                  child: _DateField(
                    hint: tr.filter_to,
                    date: _to,
                    onTap: () => _pickDate(isFrom: false),
                  ),
                ),
              ],
            ),
            context.vLg,
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      cubit.clearFilters();
                      Navigator.of(context).pop();
                    },
                    child: Text(tr.filter_reset),
                  ),
                ),
                context.hSm,
                Expanded(
                  flex: 2,
                  child: CustomButton(
                    onTap: () {
                      cubit.setTxFilter(_type);
                      cubit.setDateRange(
                        from: _format(_from),
                        to: _format(_to),
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text(tr.filter_show_results),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final initial = isFrom ? _from : _to;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    setState(() {
      if (isFrom) {
        _from = picked;
        if (_to != null && _to!.isBefore(_from!)) _to = _from;
      } else {
        _to = picked;
        if (_from != null && _from!.isAfter(_to!)) _from = _to;
      }
    });
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.hint,
    required this.date,
    required this.onTap,
  });

  final String hint;
  final DateTime? date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final value = date == null
        ? hint
        : '${date!.year}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}';
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: context.sMd,
            vertical: context.sSm,
          ),
        ),
        child: Text(
          value,
          style: context.text.bodyMedium?.copyWith(
            color: date == null ? context.muted : null,
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
    );
  }
}

class _TransactionsSliver extends StatelessWidget {
  const _TransactionsSliver({required this.state});

  final CashBoxState state;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<CashBoxCubit>();

    if (state.areTransactionsLoading && state.transactions.isEmpty) {
      return const SliverFillRemaining(child: CashBoxShimmer());
    }

    if (state.failure != null && state.transactions.isEmpty) {
      return SliverFillRemaining(
        child: _ErrorState(
          message: state.failure!.localizedMessage(context),
          onRetry: cubit.refreshTransactions,
        ),
      );
    }

    if (state.transactions.isEmpty) {
      return SliverFillRemaining(
        child: _EmptyState(message: tr.cash_box_no_transactions),
      );
    }

    return SliverPadding(
      padding: context.pHorizontal,
      sliver: SliverList.separated(
        itemCount: state.transactions.length + (state.isLoadingMore ? 1 : 0),
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

/// Formats a monetary amount with two decimals + the given currency suffix.
String _formatMoney(double amount, String currency) {
  final sign = amount.isNegative ? '-' : '';
  final abs = amount.abs().toStringAsFixed(2);
  return '$sign$abs $currency';
}
