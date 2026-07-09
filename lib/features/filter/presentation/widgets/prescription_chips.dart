import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/widgets/filter_chip_group_wrap.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';

class PrescriptionChips extends StatelessWidget {
  const PrescriptionChips({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryCubit>().state;

    return FilterChipGroup<bool?>(
      items: const [null, true, false],
      selectedItems: {
        if (state.prescriptionRequired != null) state.prescriptionRequired,
      },
      mode: FilterSelectionMode.single,
      onChanged: (updatedSelection) {
        final selected = updatedSelection.isEmpty
            ? null
            : updatedSelection.first;
        context.read<InventoryCubit>().updatePrescriptionRequired(selected);
      },
      labelBuilder: (item) {
        if (item == null) return 'All';
        return item == true ? 'Yes' : 'No';
      },
    );
  }
}
