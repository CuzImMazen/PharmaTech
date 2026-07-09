import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InventoryHeader(),
            context.vMd,
            SearchTextField(
              controller: _searchController,
              onChanged: inventoryCubit.updateSearchQuery,
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
                      message: 'Unable to load products right now.',
                      onRetry: inventoryCubit.refreshProducts,
                    );
                  }

                  if (state.products.isEmpty) {
                    return const _InventoryEmptyState();
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
                                  itemCount:
                                      state.products.length +
                                      (state.isLoadingMore ? 1 : 0),
                                  itemBuilder: (context, index) {
                                    if (index >= state.products.length) {
                                      return const _BottomLoader();
                                    }

                                    return ListMedicines(
                                      product: state.products[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return context.vMd;
                                  },
                                );
                              }

                              return GridView.builder(
                                controller: _scrollController,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount:
                                    state.products.length +
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
    );
  }
}

class ListMedicines extends StatelessWidget {
  const ListMedicines({super.key, required this.product});

  final ProductCardModel product;

  @override
  Widget build(BuildContext context) {
    return MedicineListCard(product: product);
  }
}

class GridMedicines extends StatelessWidget {
  const GridMedicines({super.key, required this.product});

  final ProductCardModel product;

  @override
  Widget build(BuildContext context) {
    return MedicineGridCard(product: product);
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
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
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
      child: Text('No products found.', style: context.text.bodyMedium),
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
