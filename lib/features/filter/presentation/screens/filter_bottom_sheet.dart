import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/category_chips.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/company_chips.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/expiry_chips.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/filter_section_header.dart';
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
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            context.tr.filter_reset_title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.cozyRose,
            ),
          ),
          content: Text(context.tr.filter_reset_message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(context.tr.filter_cancel),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                context.read<InventoryCubit>().clearFilters();
                _minPriceController.clear();
                _maxPriceController.clear();
              },
              child: Text(context.tr.filter_reset),
            ),
          ],
        );
      },
    );
  }

  void _applyFiltersAndClose() {
    final cubit = context.read<InventoryCubit>();

    // 1. Parse and update price state criteria fields locally
    final minPrice = num.tryParse(_minPriceController.text.trim());
    final maxPrice = num.tryParse(_maxPriceController.text.trim());
    cubit.updatePriceRange(minPrice: minPrice, maxPrice: maxPrice);

    // 2. 🚀 Fire ONE single batch request to the backend service
    cubit.applyFilters();

    // 3. Dismiss sheet safely
    Navigator.of(context).pop();
  }

  /// A compact "couldn't load — Retry" tile shown in place of a filter
  /// section's chips when that section's fetch failed. Tapping it re-fetches
  /// only that section.
  Widget _sectionRetryTile(
    BuildContext context, {
    required VoidCallback onRetry,
  }) {
    final errorColor = Theme.of(context).colorScheme.error;
    return InkWell(
      onTap: onRetry,
      borderRadius: context.rLg,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: context.rLg,
          color: errorColor.withAlpha(20),
          border: Border.all(color: errorColor.withAlpha(80), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 16, color: errorColor),
            const SizedBox(width: 6),
            Text(
              context.tr.filter_section_failed,
              style: context.text.bodySmall?.copyWith(color: errorColor),
            ),
            const SizedBox(width: 8),
            Icon(Icons.refresh, size: 16, color: errorColor),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<InventoryCubit, InventoryState>(
        builder: (context, state) {
          final categories = state.categories;
          final units = state.units;
          final companies = state.companies;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                context.vXl,
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: GestureDetector(
                          onTap: state.isFilterOptionsLoading
                              ? null
                              : _resetFilters,
                          child: Text(
                            context.tr.filter_reset,
                            style: context.text.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      context.tr.filter_filters_and_sort,
                      style: context.text.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
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
                  // The very first load shows a single full-sheet spinner.
                  // After that each fetch-backed section manages its own
                  // loading/error state and can retry independently.
                  child: state.isFilterOptionsLoading &&
                          categories.isEmpty &&
                          units.isEmpty &&
                          companies.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircularProgressIndicator(),
                              const SizedBox(height: 12),
                              Text(context.tr.filter_loading),
                            ],
                          ),
                        )
                      : ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            FilterSectionHeader(
                              title: context.tr.filter_category,
                              isLoading: state.isLoadingCategories,
                              hasError: state.hasCategoriesError,
                              onRetry: () => context
                                  .read<InventoryCubit>()
                                  .reloadCategories(),
                            ),
                            context.vMd,
                            if (state.hasCategoriesError)
                              _sectionRetryTile(
                                context,
                                onRetry: () => context
                                    .read<InventoryCubit>()
                                    .reloadCategories(),
                              )
                            else
                              CategoryChips(categories: categories),
                            context.vLg,
                            FilterSectionHeader(
                              title: context.tr.filter_stock_status,
                            ),
                            context.vMd,
                            const StockStatusChips(),
                            context.vLg,
                            FilterSectionHeader(
                              title: context.tr.filter_price_range,
                            ),
                            context.vMd,
                            PriceRangeRow(
                              minController: _minPriceController,
                              maxController: _maxPriceController,
                            ),
                            context.vLg,
                            FilterSectionHeader(
                              title: context.tr.filter_expiry_date,
                            ),
                            context.vMd,
                            const ExpiryChips(),
                            context.vLg,
                            FilterSectionHeader(
                              title: context.tr.filter_package_unit,
                              isLoading: state.isLoadingUnits,
                              hasError: state.hasUnitsError,
                              onRetry: () => context
                                  .read<InventoryCubit>()
                                  .reloadUnits(),
                            ),
                            context.vMd,
                            if (state.hasUnitsError)
                              _sectionRetryTile(
                                context,
                                onRetry: () => context
                                    .read<InventoryCubit>()
                                    .reloadUnits(),
                              )
                            else
                              PackageUnitChips(units: units),
                            context.vLg,
                            FilterSectionHeader(
                              title: context.tr.filter_company,
                              isLoading: state.isLoadingCompanies,
                              hasError: state.hasCompaniesError,
                              onRetry: () => context
                                  .read<InventoryCubit>()
                                  .reloadCompanies(),
                            ),
                            context.vMd,
                            if (state.hasCompaniesError)
                              _sectionRetryTile(
                                context,
                                onRetry: () => context
                                    .read<InventoryCubit>()
                                    .reloadCompanies(),
                              )
                            else
                              CompanyChips(
                                companies: companies,
                              ),
                            context.vLg,
                            FilterSectionHeader(
                              title: context.tr.filter_prescription,
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
                  onTap: state.isFilterOptionsLoading
                      ? null
                      : _applyFiltersAndClose,
                  text: context.tr.filter_show_results,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
