import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/widgets/filter_chip_group_wrap.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';

class StockStatusChips extends StatelessWidget {
  const StockStatusChips({super.key});

  static const List<String> _stockStatusValues = [
    'available',
    'low',
    'out',
  ];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryCubit>().state;
    final tr = context.tr;

    String labelFor(String value) => switch (value) {
      'available' => tr.filter_stock_available,
      'low' => tr.filter_stock_low,
      'out' => tr.filter_stock_out,
      _ => value,
    };

    return FilterChipGroup<String>(
      items: _stockStatusValues,
      selectedItems: {if (state.stockStatus != null) state.stockStatus!},
      mode: FilterSelectionMode.single,
      onChanged: (updatedSelection) {
        final selected = updatedSelection.isEmpty
            ? null
            : updatedSelection.first;
        context.read<InventoryCubit>().updateStockStatus(selected);
      },
      labelBuilder: labelFor,
    );
  }
}
