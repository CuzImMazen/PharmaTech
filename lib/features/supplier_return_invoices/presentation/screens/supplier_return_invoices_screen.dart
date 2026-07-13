import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/cubit/supplier_return_invoice_cubit.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/cubit/supplier_return_invoice_state.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/presentation/widgets/supplier_return_invoice_card.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/presentation/widgets/supplier_return_invoices_shimmer.dart';

/// Supplier Return Invoices list: paginated, with an add button and a cancel
/// action (handled via the detail screen).
class SupplierReturnInvoicesScreen extends StatefulWidget {
  const SupplierReturnInvoicesScreen({super.key});

  @override
  State<SupplierReturnInvoicesScreen> createState() =>
      _SupplierReturnInvoicesScreenState();
}

class _SupplierReturnInvoicesScreenState
    extends State<SupplierReturnInvoicesScreen> {
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
      context.read<SupplierReturnInvoiceCubit>().loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<SupplierReturnInvoiceCubit>();

    return Scaffold(
      appBar: AppBar(title: Text(tr.return_supplier_title)),
      body: SafeArea(
        child: Column(
          children: [
            // Header: add button.
            Padding(
              padding: context.pHorizontal,
              child: Row(
                children: [
                  const Spacer(),
                  _AddButton(
                    onTap: () async {
                      await context.push(AppRoutesKeys.supplierReturnInvoiceAdd);
                      if (context.mounted) cubit.refresh();
                    },
                  ),
                ],
              ),
            ),
            context.vSm,
            Expanded(
              child: BlocBuilder<SupplierReturnInvoiceCubit,
                  SupplierReturnInvoiceState>(
                builder: (context, state) {
                  final showInlineLoading =
                      state.isRefreshing && state.returns.isNotEmpty;

                  if (state.isInitialLoading && state.returns.isEmpty) {
                    return const SupplierReturnInvoicesShimmer();
                  }

                  if (state.failure != null && state.returns.isEmpty) {
                    return _ErrorState(
                      message: state.failure!.localizedMessage(context),
                      onRetry: cubit.refresh,
                    );
                  }

                  if (state.returns.isEmpty) {
                    return _EmptyState(
                      onAdd: () async {
                        await context.push(
                          AppRoutesKeys.supplierReturnInvoiceAdd,
                        );
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
                            itemCount: state.returns.length +
                                (state.isLoadingMore ? 1 : 0),
                            separatorBuilder: (context, index) =>
                                context.vMd,
                            itemBuilder: (context, index) {
                              if (index >= state.returns.length) {
                                return const _BottomLoader();
                              }
                              final invoice = state.returns[index];
                              return SupplierReturnInvoiceCard(
                                invoice: invoice,
                                onTap: () => context.push(
                                  AppRoutesKeys.supplierReturnInvoiceDetailWith(
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
              Icons.receipt_long_outlined,
              size: context.iHuge,
              color: context.muted,
            ),
            context.vLg,
            Text(
              context.tr.return_invoices_empty,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            context.vLg,
            CustomButton(text: context.tr.return_supplier_add_title, onTap: onAdd),
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
