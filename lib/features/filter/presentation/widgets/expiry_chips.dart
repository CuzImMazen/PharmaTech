import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/widgets/filter_chip_group_wrap.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';

class ExpiryChips extends StatelessWidget {
  const ExpiryChips({super.key});

  static const Map<String, String> _expiryOptions = {
    'Expired': 'expired',
    '30 days': '30days',
    '60 days': '60days',
    '90 days': '90days',
    '6 months': '6months',
  };

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryCubit>().state;

    return FilterChipGroup<String>(
      items: _expiryOptions.values.toList(),
      selectedItems: state.expiryFilters.toSet(),
      onChanged: (updatedSelection) {
        context.read<InventoryCubit>().updateExpiryFilters(updatedSelection);
      },
      labelBuilder: (item) =>
          _expiryOptions.entries.firstWhere((entry) => entry.value == item).key,
    );
  }
}
