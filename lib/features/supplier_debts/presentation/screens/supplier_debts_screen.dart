import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/supplier_debts/cubit/supplier_debt_cubit.dart';
import 'package:pharmacy_app/features/supplier_debts/cubit/supplier_debt_state.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';
import 'package:pharmacy_app/features/supplier_debts/presentation/widgets/supplier_debt_card.dart';
import 'package:pharmacy_app/features/supplier_debts/presentation/widgets/supplier_debts_shimmer.dart';

/// Supplier Debts list: paginated, filtered by supplier + status. Read-only.
/// Reached from Settings → Operations → Supplier Debts.
class SupplierDebtsScreen extends StatefulWidget {
  const SupplierDebtsScreen({super.key});

  @override
  State<SupplierDebtsScreen> createState() => _SupplierDebtsScreenState();
}

class _SupplierDebtsScreenState extends State<SupplierDebtsScreen> {
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
      context.read<SupplierDebtCubit>().loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<SupplierDebtCubit>();

    return Scaffold(
      appBar: AppBar(title: Text(tr.debts_title)),
      body: SafeArea(
        child: Column(
          children: [
            _FilterBar(onOpenFilters: () => _openFilters(context)),
            context.vMd,
            Expanded(
              child: BlocBuilder<SupplierDebtCubit, SupplierDebtState>(
                builder: (context, state) {
                  final showInlineLoading =
                      state.isRefreshing && state.debts.isNotEmpty;

                  if (state.isInitialLoading && state.debts.isEmpty) {
                    return const SupplierDebtsShimmer();
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
                              return SupplierDebtCard(
                                debt: debt,
                                onTap: () => context.push(
                                  AppRoutesKeys.debtDetailWith(debt.id),
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
    final cubit = context.read<SupplierDebtCubit>();
    final result = await showModalBottomSheet<_DebtFilter>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(context.sXl)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: cubit,
        child: _DebtFilterSheet(
          supplierId: cubit.state.supplierIdFilter,
          status: cubit.state.statusFilter,
        ),
      ),
    );
    if (result == null) return;
    await cubit.setSupplierFilter(result.supplierId);
    await cubit.setStatusFilter(result.status);
  }
}

class _DebtFilter {
  const _DebtFilter({this.supplierId, this.status});
  final int? supplierId;
  final SupplierDebtStatus? status;
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({required this.onOpenFilters});

  final VoidCallback onOpenFilters;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SupplierDebtCubit>();
    return Padding(
      padding: context.pHorizontal,
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<SupplierDebtCubit, SupplierDebtState>(
              buildWhen: (p, c) =>
                  p.supplierIdFilter != c.supplierIdFilter ||
                  p.statusFilter != c.statusFilter,
              builder: (context, state) {
                final active =
                    state.supplierIdFilter != null ||
                    state.statusFilter != null;
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
          BlocBuilder<SupplierDebtCubit, SupplierDebtState>(
            buildWhen: (p, c) =>
                p.supplierIdFilter != c.supplierIdFilter ||
                p.statusFilter != c.statusFilter,
            builder: (context, state) {
              if (state.supplierIdFilter == null &&
                  state.statusFilter == null) {
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
  const _DebtFilterSheet({required this.supplierId, required this.status});

  final int? supplierId;
  final SupplierDebtStatus? status;

  @override
  State<_DebtFilterSheet> createState() => _DebtFilterSheetState();
}

class _DebtFilterSheetState extends State<_DebtFilterSheet> {
  int? _supplierId;
  SupplierDebtStatus? _status;

  @override
  void initState() {
    super.initState();
    _supplierId = widget.supplierId;
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
                for (final s in SupplierDebtStatus.values)
                  _StatusChip(
                    label: debtStatusLabel(s, tr),
                    selected: _status == s,
                    onTap: () => setState(() => _status = s),
                  ),
              ],
            ),
            context.vLg,
            CustomButton(
              onTap: () => Navigator.of(
                context,
              ).pop(_DebtFilter(supplierId: _supplierId, status: _status)),
              child: Text(tr.filter_show_results),
            ),
          ],
        ),
      ),
    );
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
              context.tr.debts_empty,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            context.vSm,
            Text(
              context.tr.debts_empty_hint,
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
