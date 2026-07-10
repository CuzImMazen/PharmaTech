import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
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

  static const List<String> _sortValues = [
    'name_asc',
    'name_desc',
    'price_asc',
    'price_desc',
    'stock_asc',
    'stock_desc',
    'expiry_asc',
    'expiry_desc',
  ];

  String _labelFor(BuildContext context, String value) {
    final tr = context.tr;
    return switch (value) {
      'name_asc' => tr.sort_name_asc,
      'name_desc' => tr.sort_name_desc,
      'price_asc' => tr.sort_price_asc,
      'price_desc' => tr.sort_price_desc,
      'stock_asc' => tr.sort_stock_asc,
      'stock_desc' => tr.sort_stock_desc,
      'expiry_asc' => tr.sort_expiry_soon,
      'expiry_desc' => tr.sort_expiry_late,
      _ => value,
    };
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
      items: _sortValues
          .map(
            (value) => PopupMenuItem(
              value: value,
              child: Text(_labelFor(context, value)),
            ),
          )
          .toList(),
    );

    if (selected != null) {
      context.read<InventoryCubit>().updateSortBy(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (context, state) {
        final currentLabel =
            state.sortBy != null ? _labelFor(context, state.sortBy!) : null;
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
                    currentLabel ?? context.tr.sort_name_asc,
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
                  context.tr.filter_filters,
                  style: context.text.bodyMedium!.copyWith(color: Colors.white),
                ),
                context.hSm,
                BlocBuilder<InventoryCubit, InventoryState>(
                  builder: (context, state) {
                    final activeFilters = [
                      if (state.stockStatus != null) 1,
                      if (state.inStockOnly) 1,
                      if (state.categoryIds.isNotEmpty) 1,
                      if (state.companyIds.isNotEmpty) 1,
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
