import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/customers/cubit/customer_cubit.dart';
import 'package:pharmacy_app/features/customers/cubit/customer_state.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/customers/presentation/widgets/customer_card.dart';
import 'package:pharmacy_app/features/customers/presentation/widgets/customers_shimmer.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/search_text_field.dart';

/// Customers management screen: paginated list with search, a "show deleted"
/// toggle, and add/edit/delete/restore. Reached from the Operations hub.
class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.extentAfter < 320) {
      context.read<CustomerCubit>().loadNextPage();
    }
  }

  void _onSearchChanged(String query) {
    // Mirror the InventoryCubit's debounced search (350ms).
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      context.read<CustomerCubit>().updateSearchQuery(query);
    });
  }

  Future<void> _confirmDelete(CustomerModel customer) async {
    final tr = context.tr;
    final cubit = context.read<CustomerCubit>();
    final deleted = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.customer_delete_title),
        content: Text(tr.customer_delete_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(tr.detail_cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(tr.detail_delete),
          ),
        ],
      ),
    );
    if (deleted == true) cubit.deleteCustomer(customer.id);
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<CustomerCubit>();

    return BlocListener<CustomerCubit, CustomerState>(
      listenWhen: (p, c) =>
          p.lastAction != c.lastAction ||
          p.failure != c.failure,
      listener: (context, state) {
        if (state.lastAction != null) {
          AppSnackbar.success(
            message: switch (state.lastAction!) {
              CustomerActionResult.created => tr.customer_created,
              CustomerActionResult.updated => tr.customer_updated,
              CustomerActionResult.deleted => tr.customer_deleted,
              CustomerActionResult.restored => tr.customer_restored,
            },
          );
          cubit.clearAction();
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(message: state.failure!.localizedMessage(context));
          cubit.clearAction();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(tr.customers_title)),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: search + add button.
              Padding(
                padding: context.pHorizontal,
                child: Row(
                  children: [
                    Expanded(
                      child: SearchTextField(
                        controller: _searchController,
                        onChanged: _onSearchChanged,
                        hintText: tr.customers_search_hint,
                      ),
                    ),
                    context.hSm,
                    _AddButton(
                      onTap: () async {
                        await context.push(AppRoutesKeys.customerAdd);
                        if (context.mounted) cubit.refresh();
                      },
                    ),
                  ],
                ),
              ),
              context.vSm,
              // Show-deleted toggle.
              Padding(
                padding: context.pHorizontal,
                child: BlocBuilder<CustomerCubit, CustomerState>(
                  buildWhen: (p, c) => p.showDeleted != c.showDeleted,
                  builder: (context, state) {
                    return _ShowDeletedToggle(
                      value: state.showDeleted,
                      onChanged: (_) => cubit.toggleShowDeleted(),
                    );
                  },
                ),
              ),
              context.vMd,
              Expanded(
                child: BlocBuilder<CustomerCubit, CustomerState>(
                  builder: (context, state) {
                    final showInlineLoading =
                        state.isRefreshing && state.customers.isNotEmpty;

                    if (state.isInitialLoading && state.customers.isEmpty) {
                      return const CustomersShimmer();
                    }

                    if (state.failure != null && state.customers.isEmpty) {
                      return _ErrorState(
                        message: state.failure!.localizedMessage(context),
                        onRetry: cubit.refresh,
                      );
                    }

                    if (state.customers.isEmpty) {
                      return _EmptyState(
                        onAdd: () async {
                          await context.push(AppRoutesKeys.customerAdd);
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
                              itemCount: state.customers.length +
                                  (state.isLoadingMore ? 1 : 0),
                              separatorBuilder: (context, index) => context.vMd,
                              itemBuilder: (context, index) {
                                if (index >= state.customers.length) {
                                  return const _BottomLoader();
                                }
                                final customer = state.customers[index];
                                return CustomerCard(
                                  customer: customer,
                                  isMutating:
                                      state.mutatingId == customer.id,
                                  onTap: () async {
                                    await context.push(
                                      AppRoutesKeys.customerEditWith(
                                        customer.id,
                                      ),
                                      extra: customer,
                                    );
                                    if (context.mounted) cubit.refresh();
                                  },
                                  onEdit: () async {
                                    await context.push(
                                      AppRoutesKeys.customerEditWith(
                                        customer.id,
                                      ),
                                      extra: customer,
                                    );
                                    if (context.mounted) cubit.refresh();
                                  },
                                  onDelete: () => _confirmDelete(customer),
                                  onRestore: () =>
                                      cubit.restoreCustomer(customer.id),
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
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: context.iMd,
          ),
        ),
      ),
    );
  }
}

class _ShowDeletedToggle extends StatelessWidget {
  const _ShowDeletedToggle({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.delete_outline_rounded,
          size: context.iSm,
          color: context.muted,
        ),
        SizedBox(width: context.sXs),
        Text(
          context.tr.customers_show_deleted,
          style: context.text.bodyMedium?.copyWith(color: context.muted),
        ),
        const Spacer(),
        Switch(value: value, onChanged: onChanged),
      ],
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
              Icons.people_outline_rounded,
              size: context.iHuge,
              color: context.muted,
            ),
            context.vLg,
            Text(
              context.tr.customers_empty,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            context.vSm,
            Text(
              context.tr.customers_empty_hint,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
              textAlign: TextAlign.center,
            ),
            context.vLg,
            CustomButton(text: context.tr.customers_add, onTap: onAdd),
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
