import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/features/customer_debts/cubit/customer_debt_cubit.dart';
import 'package:pharmacy_app/features/customer_debts/cubit/customer_debt_state.dart';
import 'package:pharmacy_app/features/customer_debts/data/models/customer_debt_model.dart';
import 'package:pharmacy_app/features/customer_debts/presentation/widgets/customer_debt_card.dart';
import 'package:pharmacy_app/features/customer_debts/presentation/widgets/customer_debts_shimmer.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart'
    show SupplierDebtStatus;
import 'package:pharmacy_app/features/supplier_debts/presentation/widgets/supplier_debt_card.dart'
    show debtStatusLabel;

/// Customer Debts list: paginated, filtered by status. Read-only (payments are
/// recorded from the detail screen). Reached from Settings → Operations →
/// Customer Debts.
class CustomerDebtsScreen extends StatefulWidget {
  const CustomerDebtsScreen({super.key});

  @override
  State<CustomerDebtsScreen> createState() => _CustomerDebtsScreenState();
}

class _CustomerDebtsScreenState extends State<CustomerDebtsScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.extentAfter < 320) {
      context.read<CustomerDebtCubit>().loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<CustomerDebtCubit>();

    return Scaffold(
      appBar: AppBar(title: Text(tr.customer_debts_title)),
      body: SafeArea(
        child: Column(
          children: [
            _FilterBar(onOpenFilters: () => _openFilters(context)),
            context.vMd,
            Expanded(
              child: BlocBuilder<CustomerDebtCubit, CustomerDebtState>(
                builder: (context, state) {
                  final showInlineLoading =
                      state.isRefreshing && state.debts.isNotEmpty;

                  if (state.isInitialLoading && state.debts.isEmpty) {
                    return const CustomerDebtsShimmer();
                  }

                  if (state.failure != null && state.debts.isEmpty) {
                    return _ErrorState(
                      message: state.failure!.localizedMessage(context),
                      onRetry: cubit.refresh,
                    );
                  }

                  if (state.debts.isEmpty) {
                    return _EmptyState();
                  }

                  return Column(
                    children: [
                      if (showInlineLoading) const LinearProgressIndicator(),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () => cubit.refresh(),
                          child: ListView.separated(
                            controller: _scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: context.pHorizontal,
                            itemCount:
                                state.debts.length +
                                (state.isLoadingMore ? 1 : 0),
                            separatorBuilder: (context, index) => context.vMd,
                            itemBuilder: (context, index) {
                              if (index >= state.debts.length) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final debt = state.debts[index];
                              return CustomerDebtCard(
                                debt: debt,
                                onTap: () => context.push(
                                  AppRoutesKeys.customerDebtDetailWith(debt.id),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openFilters(BuildContext context) async {
    final cubit = context.read<CustomerDebtCubit>();
    final result = await showModalBottomSheet<_DebtFilter>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(context.sXl)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: cubit,
        child: _DebtFilterSheet(status: cubit.state.statusFilter),
      ),
    );
    if (result == null) return;
    await cubit.setStatusFilter(result.status);
  }
}

class _DebtFilter {
  const _DebtFilter({this.status});
  final CustomerDebtStatus? status;
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({required this.onOpenFilters});

  final VoidCallback onOpenFilters;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomerDebtCubit>();
    return Padding(
      padding: context.pHorizontal,
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<CustomerDebtCubit, CustomerDebtState>(
              buildWhen: (p, c) =>
                  p.customerIdFilter != c.customerIdFilter ||
                  p.statusFilter != c.statusFilter,
              builder: (context, state) {
                final active = state.statusFilter != null;
                return OutlinedButton.icon(
                  onPressed: onOpenFilters,
                  icon: Icon(Icons.filter_list_rounded, size: context.iSm),
                  label: Text(context.tr.filter_filters),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: active
                        ? context.primary
                        : context.colors.onSurface,
                    side: BorderSide(
                      color: active
                          ? context.primary
                          : context.muted.withAlpha(120),
                    ),
                  ),
                );
              },
            ),
          ),
          BlocBuilder<CustomerDebtCubit, CustomerDebtState>(
            buildWhen: (p, c) => p.statusFilter != c.statusFilter,
            builder: (context, state) {
              if (state.statusFilter == null) {
                return const SizedBox.shrink();
              }
              return IconButton(
                tooltip: context.tr.filter_reset,
                onPressed: () => cubit.clearFilters(),
                icon: const Icon(Icons.refresh_rounded),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DebtFilterSheet extends StatefulWidget {
  const _DebtFilterSheet({required this.status});

  final CustomerDebtStatus? status;

  @override
  State<_DebtFilterSheet> createState() => _DebtFilterSheetState();
}

class _DebtFilterSheetState extends State<_DebtFilterSheet> {
  CustomerDebtStatus? _status;

  @override
  void initState() {
    super.initState();
    _status = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
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
            Text(tr.debts_filter_status, style: context.text.titleSmall),
            context.vSm,
            Wrap(
              spacing: context.sSm,
              runSpacing: context.sSm,
              children: [
                _StatusChip(
                  label: tr.filter_all,
                  selected: _status == null,
                  onTap: () => setState(() => _status = null),
                ),
                for (final s in CustomerDebtStatus.values)
                  _StatusChip(
                    label: debtStatusLabel(_mapStatus(s), tr),
                    selected: _status == s,
                    onTap: () => setState(() => _status = s),
                  ),
              ],
            ),
            context.vLg,
            FilledButton(
              onPressed: () =>
                  Navigator.of(context).pop(_DebtFilter(status: _status)),
              child: Text(tr.filter_show_results),
            ),
          ],
        ),
      ),
    );
  }

  SupplierDebtStatus _mapStatus(CustomerDebtStatus s) {
    return switch (s) {
      CustomerDebtStatus.open => SupplierDebtStatus.open,
      CustomerDebtStatus.partial => SupplierDebtStatus.partial,
      CustomerDebtStatus.paid => SupplierDebtStatus.paid,
      CustomerDebtStatus.overdue => SupplierDebtStatus.overdue,
      CustomerDebtStatus.cancelled => SupplierDebtStatus.cancelled,
    };
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
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

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.pAllLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.request_quote_outlined,
              size: context.iHuge,
              color: context.muted,
            ),
            context.vLg,
            Text(
              context.tr.customer_debts_empty,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            context.vSm,
            Text(
              context.tr.customer_debts_empty_hint,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
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
