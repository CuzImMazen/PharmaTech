import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/cubit/sales_invoice_cubit.dart';
import 'package:pharmacy_app/features/sales_invoices/cubit/sales_invoice_state.dart';
import 'package:pharmacy_app/features/sales_invoices/presentation/widgets/sales_invoice_card.dart';
import 'package:pharmacy_app/features/sales_invoices/presentation/widgets/sales_invoices_shimmer.dart';

/// Sales Invoices list: paginated, with a status/payment-status filter
/// bottom sheet and a cancel action (handled via the detail screen). Reached
/// from the Operations hub.
class SalesInvoicesScreen extends StatefulWidget {
  const SalesInvoicesScreen({super.key});

  @override
  State<SalesInvoicesScreen> createState() => _SalesInvoicesScreenState();
}

class _SalesInvoicesScreenState extends State<SalesInvoicesScreen> {
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
      context.read<SalesInvoiceCubit>().loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<SalesInvoiceCubit>();

    return BlocListener<SalesInvoiceCubit, SalesInvoiceState>(
      listenWhen: (p, c) =>
          p.lastAction != c.lastAction || p.failure != c.failure,
      listener: (context, state) {
        if (state.lastAction != null) {
          AppSnackbar.success(message: tr.sales_invoice_cancelled);
          cubit.clearAction();
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(message: state.failure!.localizedMessage(context));
          cubit.clearAction();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(tr.sales_invoices_title)),
        body: SafeArea(
          child: Column(
            children: [
              // Header: filter button + add button.
              Padding(
                padding: context.pHorizontal,
                child: Row(
                  children: [
                    Expanded(
                      child: _FilterButton(onTap: () => _openFilters(context)),
                    ),
                    context.hSm,
                    _AddButton(
                      onTap: () async {
                        await context.push(AppRoutesKeys.salesInvoiceAdd);
                        if (context.mounted) cubit.refresh();
                      },
                    ),
                  ],
                ),
              ),
              context.vSm,
              Expanded(
                child: BlocBuilder<SalesInvoiceCubit, SalesInvoiceState>(
                  builder: (context, state) {
                    final showInlineLoading =
                        state.isRefreshing && state.invoices.isNotEmpty;

                    if (state.isInitialLoading && state.invoices.isEmpty) {
                      return const SalesInvoicesShimmer();
                    }

                    if (state.failure != null && state.invoices.isEmpty) {
                      return _ErrorState(
                        message: state.failure!.localizedMessage(context),
                        onRetry: cubit.refresh,
                      );
                    }

                    if (state.invoices.isEmpty) {
                      return _EmptyState(
                        onAdd: () async {
                          await context.push(AppRoutesKeys.salesInvoiceAdd);
                          if (context.mounted) cubit.refresh();
                        },
                      );
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
                              itemCount: state.invoices.length +
                                  (state.isLoadingMore ? 1 : 0),
                              separatorBuilder: (context, index) =>
                                  context.vMd,
                              itemBuilder: (context, index) {
                                if (index >= state.invoices.length) {
                                  return const _BottomLoader();
                                }
                                final invoice = state.invoices[index];
                                return SalesInvoiceCard(
                                  invoice: invoice,
                                  isMutating:
                                      state.mutatingId == invoice.id,
                                  onTap: () => context.push(
                                    AppRoutesKeys.salesInvoiceDetailWith(
                                      invoice.id,
                                    ),
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
      ),
    );
  }

  Future<void> _openFilters(BuildContext context) async {
    final cubit = context.read<SalesInvoiceCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(context.sXl)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: cubit,
        child: _InvoiceFilterSheet(),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SalesInvoiceCubit>();
    return BlocBuilder<SalesInvoiceCubit, SalesInvoiceState>(
      buildWhen: (p, c) =>
          p.customerIdFilter != c.customerIdFilter ||
          p.statusFilter != c.statusFilter ||
          p.paymentStatusFilter != c.paymentStatusFilter ||
          p.fromDate != c.fromDate ||
          p.toDate != c.toDate,
      builder: (context, state) {
        final active = cubit.hasActiveFilters;
        return OutlinedButton.icon(
          onPressed: onTap,
          icon: Icon(Icons.filter_list_rounded, size: context.iSm),
          label: Text(context.tr.filter_filters_and_sort),
          style: OutlinedButton.styleFrom(
            foregroundColor: active ? context.primary : context.colors.onSurface,
            side: BorderSide(
              color: active ? context.primary : context.muted.withAlpha(120),
            ),
          ),
        );
      },
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.btnLg,
      height: context.btnLg,
      child: Material(
        color: context.primary,
        shape: RoundedRectangleBorder(borderRadius: context.rMd),
        child: InkWell(
          borderRadius: context.rMd,
          onTap: onTap,
          child: Icon(Icons.add_rounded, color: Colors.white, size: context.iMd),
        ),
      ),
    );
  }
}

class _InvoiceFilterSheet extends StatefulWidget {
  @override
  State<_InvoiceFilterSheet> createState() => _InvoiceFilterSheetState();
}

class _InvoiceFilterSheetState extends State<_InvoiceFilterSheet> {
  InvoiceStatus? _status;
  InvoicePaymentStatus? _paymentStatus;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SalesInvoiceCubit>();
    _status = cubit.state.statusFilter;
    _paymentStatus = cubit.state.paymentStatusFilter;
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<SalesInvoiceCubit>();
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
            Text(tr.invoice_status, style: context.text.titleSmall),
            context.vSm,
            Wrap(
              spacing: context.sSm,
              runSpacing: context.sSm,
              children: [
                _Chip(
                  label: tr.filter_all,
                  selected: _status == null,
                  onTap: () => setState(() => _status = null),
                ),
                for (final s in InvoiceStatus.values)
                  _Chip(
                    label: invoiceStatusLabel(s, tr),
                    selected: _status == s,
                    onTap: () => setState(() => _status = s),
                  ),
              ],
            ),
            context.vMd,
            Text(tr.invoice_payment_status, style: context.text.titleSmall),
            context.vSm,
            Wrap(
              spacing: context.sSm,
              runSpacing: context.sSm,
              children: [
                _Chip(
                  label: tr.filter_all,
                  selected: _paymentStatus == null,
                  onTap: () => setState(() => _paymentStatus = null),
                ),
                for (final s in InvoicePaymentStatus.values)
                  _Chip(
                    label: invoicePaymentStatusLabel(s, tr),
                    selected: _paymentStatus == s,
                    onTap: () => setState(() => _paymentStatus = s),
                  ),
              ],
            ),
            context.vLg,
            CustomButton(
              onTap: () {
                cubit.setStatusFilter(_status);
                cubit.setPaymentStatusFilter(_paymentStatus);
                Navigator.of(context).pop();
              },
              child: Text(tr.filter_show_results),
            ),
          ],
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

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.pAllLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.point_of_sale,
              size: context.iHuge,
              color: context.muted,
            ),
            context.vLg,
            Text(
              context.tr.sales_invoices_empty,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            context.vSm,
            Text(
              context.tr.sales_invoices_empty_hint,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
              textAlign: TextAlign.center,
            ),
            context.vLg,
            CustomButton(text: context.tr.sales_invoices_add, onTap: onAdd),
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

class _BottomLoader extends StatelessWidget {
  const _BottomLoader();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
