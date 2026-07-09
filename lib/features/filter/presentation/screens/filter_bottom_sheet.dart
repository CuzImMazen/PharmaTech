import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/category_chips.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/expiry_chips.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/package_unit_chips.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/prescription_chips.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/price_range_row.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/stock_status_chips.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_state.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late final TextEditingController _minPriceController;
  late final TextEditingController _maxPriceController;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _minPriceController = TextEditingController();
    _maxPriceController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final state = context.read<InventoryCubit>().state;
    _minPriceController.text = state.minPrice?.toString() ?? '';
    _maxPriceController.text = state.maxPrice?.toString() ?? '';
    _initialized = true;
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _resetFilters() {
    final cubit = context.read<InventoryCubit>();
    cubit.clearFilters();
    _minPriceController.clear();
    _maxPriceController.clear();
  }

  void _applyPriceRange() {
    final cubit = context.read<InventoryCubit>();
    final minPrice = num.tryParse(_minPriceController.text.trim());
    final maxPrice = num.tryParse(_maxPriceController.text.trim());
    cubit.updatePriceRange(minPrice: minPrice, maxPrice: maxPrice);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<InventoryCubit, InventoryState>(
        builder: (context, state) {
          final categories = state.categories;
          final units = state.units;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                context.vXl,
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: _resetFilters,
                          child: Text(
                            'Reset',
                            style: context.text.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Filters & Sort',
                      style: context.text.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(Icons.close, color: context.muted),
                        ),
                      ),
                    ),
                  ],
                ),
                context.vMd,
                Expanded(
                  child:
                      state.isFilterOptionsLoading &&
                          categories.isEmpty &&
                          units.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Text('Category', style: context.text.titleMedium),
                            context.vMd,
                            CategoryChips(categories: categories),
                            context.vLg,
                            Text(
                              'Stock Status',
                              style: context.text.titleMedium,
                            ),
                            context.vMd,
                            const StockStatusChips(),
                            context.vLg,
                            Text(
                              'Price Range (SP)',
                              style: context.text.titleMedium,
                            ),
                            context.vMd,
                            PriceRangeRow(
                              minController: _minPriceController,
                              maxController: _maxPriceController,
                            ),
                            context.vLg,
                            Text(
                              'Expiry Date',
                              style: context.text.titleMedium,
                            ),
                            context.vMd,
                            const ExpiryChips(),
                            context.vLg,
                            Text(
                              'Package Unit',
                              style: context.text.titleMedium,
                            ),
                            context.vMd,
                            PackageUnitChips(units: units),
                            context.vLg,
                            Text(
                              'Prescription Required',
                              style: context.text.titleMedium,
                            ),
                            context.vMd,
                            const PrescriptionChips(),
                            context.vLg,
                          ],
                        ),
                ),
                Divider(
                  color: context.mutedSurface,
                  thickness: 3.0,
                  height: 3.0,
                ),
                context.vMd,
                CustomButton(
                  onTap: () {
                    _applyPriceRange();
                    Navigator.of(context).pop();
                  },
                  text: 'Show Results',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
