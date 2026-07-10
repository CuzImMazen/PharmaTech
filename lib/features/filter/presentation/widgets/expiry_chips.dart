import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/widgets/filter_chip_group_wrap.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';

class ExpiryChips extends StatelessWidget {
  const ExpiryChips({super.key});

  static const List<String> _expiryValues = [
    'expired',
    '30days',
    '60days',
    '90days',
    '6months',
  ];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryCubit>().state;
    final tr = context.tr;

    String labelFor(String value) => switch (value) {
      'expired' => tr.filter_expiry_expired,
      '30days' => tr.filter_expiry_30_days,
      '60days' => tr.filter_expiry_60_days,
      '90days' => tr.filter_expiry_90_days,
      '6months' => tr.filter_expiry_6_months,
      _ => value,
    };

    return FilterChipGroup<String>(
      items: _expiryValues,
      selectedItems: state.expiryFilters.toSet(),
      onChanged: (updatedSelection) {
        context.read<InventoryCubit>().updateExpiryFilters(updatedSelection);
      },
      labelBuilder: labelFor,
    );
  }
}
