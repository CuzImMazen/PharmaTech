import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_state.dart';
import 'package:pharmacy_app/features/inventory/cubit/view_mode_cubit.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/filters_row.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/inventory_header.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/inventory_shimmer.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/grid_card/medicine_grid_card.dart';
// ignore: unused_import
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/list_card/medicine_list_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/search_text_field.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.extentAfter < 320) {
      context.read<InventoryCubit>().loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final inventoryCubit = context.read<InventoryCubit>();

    return Scaffold(
      body: SafeArea(
        child: BlocListener<InventoryCubit, InventoryState>(
          listenWhen: (previous, current) =>
              previous.searchQuery != current.searchQuery,
          listener: (context, state) {
            if (_searchController.text != state.searchQuery) {
              _searchController.value = TextEditingValue(
                text: state.searchQuery,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: state.searchQuery.length),
                ),
              );
            }
          },
          child: BlocListener<InventoryCubit, InventoryState>(
            listenWhen: (previous, current) =>
                previous.failure != current.failure && current.failure != null,
            listener: (context, state) {
              AppSnackbar.failure(
                message: state.failure!.localizedMessage(context),
              );
              inventoryCubit.clearFailure();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InventoryHeader(
                  onAdd: () async {
                    await context.push('/product/add');
                    if (context.mounted) {
                      inventoryCubit.refreshProducts();
                    }
                  },
                ),
                context.vMd,
                SearchTextField(
                  controller: _searchController,
                  onChanged: inventoryCubit.updateSearchQuery,
                ),
                context.vSm,
                Padding(
                  padding: context.pHorizontal,
                  child: BlocBuilder<InventoryCubit, InventoryState>(
                    buildWhen: (p, c) => p.showDeleted != c.showDeleted,
                    builder: (context, state) {
                      return _ShowDeletedToggle(
                        value: state.showDeleted,
                        onChanged: (_) => inventoryCubit.toggleShowDeleted(),
                      );
                    },
                  ),
                ),
                context.vLg,
                FiltersRow(),
                context.vMd,
                Expanded(
                  child: BlocBuilder<InventoryCubit, InventoryState>(
                    builder: (context, state) {
                      final showInlineLoading =
                          state.isRefreshing && state.products.isNotEmpty;

                      if (state.isInitialLoading && state.products.isEmpty) {
                        return BlocBuilder<ViewModeCubit, ViewMode>(
                          builder: (context, viewMode) {
                            return InventoryShimmer(viewMode: viewMode);
                          },
                        );
                      }

                      if (state.failure != null && state.products.isEmpty) {
                        return _InventoryErrorState(
                          message: context.tr.inventory_load_error,
                          onRetry: inventoryCubit.refreshProducts,
                        );
                      }

                      if (state.products.isEmpty) {
                        return _InventoryEmptyState();
                      }

                      return Column(
                        children: [
                          if (showInlineLoading) const LinearProgressIndicator(),
                          Expanded(
                            child: RefreshIndicator(
                              onRefresh: () => inventoryCubit.refreshProducts(),
                              child: BlocBuilder<ViewModeCubit, ViewMode>(
                                builder: (context, viewMode) {
                                  if (viewMode == ViewMode.list) {
                                    return ListView.separated(
                                      controller: _scrollController,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemCount: state.products.length +
                                          (state.isLoadingMore ? 1 : 0),
                                      itemBuilder: (context, index) {
                                        if (index >= state.products.length) {
                                          return const _BottomLoader();
                                        }

                                        return ListMedicines(
                                          product: state.products[index],
                                          onTap: () async {
                                            await context.push(
                                              '/product/${state.products[index].id}',
                                              extra: state.products[index],
                                            );
                                            if (context.mounted) {
                                              inventoryCubit.refreshProducts();
                                            }
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return context.vMd;
                                      },
                                    );
                                  }

                                  return GridView.builder(
                                    controller: _scrollController,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemCount: state.products.length +
                                        (state.isLoadingMore ? 1 : 0),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: context.gridColumns,
                                      childAspectRatio: context.gridAspectRatio(
                                        columns: context.gridColumns,
                                        spacing: context.sMd,
                                      ),
                                    ),
                                    itemBuilder: (context, index) {
                                      if (index >= state.products.length) {
                                        return const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: _BottomLoader(),
                                        );
                                      }

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 8.0,
                                        ),
                                        child: GridMedicines(
                                          product: state.products[index],
                                          onTap: () async {
                                            await context.push(
                                              '/product/${state.products[index].id}',
                                              extra: state.products[index],
                                            );
                                            if (context.mounted) {
                                              inventoryCubit.refreshProducts();
                                            }
                                          },
                                        ),
                                      );
                                    },
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
      ),
    );
  }
}

class ListMedicines extends StatelessWidget {
  const ListMedicines({super.key, required this.product, this.onTap});

  final ProductCardModel product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MedicineListCard(product: product, onTap: onTap);
  }
}

class GridMedicines extends StatelessWidget {
  const GridMedicines({super.key, required this.product, this.onTap});

  final ProductCardModel product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MedicineGridCard(product: product, onTap: onTap);
  }
}

class _InventoryErrorState extends StatelessWidget {
  const _InventoryErrorState({required this.message, required this.onRetry});

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

class _InventoryEmptyState extends StatelessWidget {
  const _InventoryEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.tr.inventory_no_products,
        style: context.text.bodyMedium,
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
          context.tr.inventory_show_deleted,
          style: context.text.bodyMedium?.copyWith(color: context.muted),
        ),
        const Spacer(),
        Switch(value: value, onChanged: onChanged),
      ],
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
