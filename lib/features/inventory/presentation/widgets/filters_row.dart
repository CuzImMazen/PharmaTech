import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/features/filter/presentation/screens/filter_bottom_sheet.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_state.dart';
import 'package:pharmacy_app/features/inventory/cubit/view_mode_cubit.dart';
import 'package:pharmacy_app/core/enums/enums.dart'; // Retained for ViewMode if needed

class FiltersRow extends StatelessWidget {
  const FiltersRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(flex: 3, child: _OrderContainer()),
          context.hSm,
          const Expanded(flex: 3, child: _FilterContainer()),
          context.hSm,
          const Expanded(flex: 2, child: _ViewTypeContainer()),
        ],
      ),
    );
  }
}

class _OrderContainer extends StatefulWidget {
  const _OrderContainer();

  @override
  State<_OrderContainer> createState() => _OrderContainerState();
}

class _OrderContainerState extends State<_OrderContainer> {
  final GlobalKey _key = GlobalKey();

  static const Map<String, String?> _sortOptions = {
    'Name A→Z': 'name_asc',
    'Name Z→A': 'name_desc',
    'Price ↑': 'price_asc',
    'Price ↓': 'price_desc',
    'Stock ↑': 'stock_asc',
    'Stock ↓': 'stock_desc',
    'Exp Soon': 'expiry_asc',
    'Exp Late': 'expiry_desc',
  };

  String _currentSortLabel(String? sortBy) {
    return _sortOptions.entries
        .firstWhere(
          (entry) => entry.value == sortBy,
          orElse: () => const MapEntry('Name A→Z', 'name_asc'),
        )
        .key;
  }

  Future<void> _openMenu() async {
    final renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height + 8,
        offset.dx + size.width,
        offset.dy,
      ),
      color: context.mutedSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      items: _sortOptions.keys
          .map((label) => PopupMenuItem(value: label, child: Text(label)))
          .toList(),
    );

    if (selected != null) {
      context.read<InventoryCubit>().updateSortBy(_sortOptions[selected]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (context, state) {
        return GestureDetector(
          key: _key,
          onTap: _openMenu,
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: context.rLg,
              color: context.mutedSurface,
            ),
            child: Row(
              children: [
                Icon(Icons.arrow_drop_down_sharp, color: context.muted),
                context.hXs,
                Expanded(
                  child: Text(
                    _currentSortLabel(state.sortBy),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.bodyMedium?.copyWith(
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FilterContainer extends StatelessWidget {
  const _FilterContainer();

  @override
  Widget build(BuildContext context) {
    final inventoryCubit = context.read<InventoryCubit>();

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (sheetContext) => BlocProvider.value(
            value: inventoryCubit,
            child: const FilterBottomSheet(),
          ),
        );
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: context.rLg,
          color: context.colors.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.tune, color: Colors.white),
                context.hSm,
                Text(
                  'Filters',
                  style: context.text.bodyMedium!.copyWith(color: Colors.white),
                ),
                context.hSm,
                BlocBuilder<InventoryCubit, InventoryState>(
                  builder: (context, state) {
                    final activeFilters = [
                      if (state.stockStatus != null) 1,
                      if (state.inStockOnly) 1,
                      if (state.categoryIds.isNotEmpty)
                        1, // Fixed parameter reference
                      if (state.companyId != null) 1,
                      if (state.baseUnitId != null) 1,
                      if (state.prescriptionRequired != null) 1,
                      if (state.expiryFilters.isNotEmpty) 1,
                      if (state.minPrice != null || state.maxPrice != null) 1,
                    ].length;

                    if (activeFilters == 0) {
                      return const SizedBox.shrink();
                    }

                    return Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          '$activeFilters',
                          style: context.text.bodyMedium!.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ViewTypeContainer extends StatelessWidget {
  const _ViewTypeContainer();

  @override
  Widget build(BuildContext context) {
    final ViewMode viewMode = context.watch<ViewModeCubit>().state;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: context.rLg,
        color: context.mutedSurface,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<ViewModeCubit>().updateViewMode(ViewMode.list);
                },
                child: Icon(
                  Icons.format_list_bulleted,
                  color: viewMode == ViewMode.list
                      ? context.colors.primary
                      : context.muted,
                  size: context.sLg,
                ),
              ),
              context.hSm,
              GestureDetector(
                onTap: () {
                  context.read<ViewModeCubit>().updateViewMode(ViewMode.grid);
                },
                child: Icon(
                  Icons.grid_view,
                  color: viewMode == ViewMode.grid
                      ? context.colors.primary
                      : context.muted,
                  size: context.sLg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
