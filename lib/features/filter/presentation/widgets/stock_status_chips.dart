import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/widgets/filter_chip_group_wrap.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';

class StockStatusChips extends StatelessWidget {
  const StockStatusChips({super.key});

  static const Map<String, String> _stockStatusOptions = {
    'Available': 'available',
    'Low': 'low',
    'Out': 'out',
  };

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryCubit>().state;

    return FilterChipGroup<String>(
      items: _stockStatusOptions.values.toList(),
      selectedItems: {if (state.stockStatus != null) state.stockStatus!},
      mode: FilterSelectionMode.single,
      onChanged: (updatedSelection) {
        final selected = updatedSelection.isEmpty
            ? null
            : updatedSelection.first;
        context.read<InventoryCubit>().updateStockStatus(selected);
      },
      labelBuilder: (item) => _stockStatusOptions.entries
          .firstWhere((entry) => entry.value == item)
          .key,
    );
  }
}
