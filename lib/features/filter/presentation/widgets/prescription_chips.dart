import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';

/// 3-state prescription filter: All / Rx-only (true) / Non-Rx (false).
/// Maps onto `state.prescriptionRequired` (null / true / false).
class PrescriptionChips extends StatelessWidget {
  const PrescriptionChips({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryCubit>().state;
    final tr = context.tr;

    return Wrap(
      spacing: 10,
      runSpacing: 12,
      children: [
        ChoiceChip(
          label: Text(tr.filter_all),
          selected: state.prescriptionRequired == null,
          onSelected: (_) => context
              .read<InventoryCubit>()
              .updatePrescriptionRequired(null),
        ),
        ChoiceChip(
          label: Text(tr.filter_rx_only),
          selected: state.prescriptionRequired == true,
          onSelected: (_) => context
              .read<InventoryCubit>()
              .updatePrescriptionRequired(true),
        ),
        ChoiceChip(
          label: Text(tr.filter_non_rx),
          selected: state.prescriptionRequired == false,
          onSelected: (_) => context
              .read<InventoryCubit>()
              .updatePrescriptionRequired(false),
        ),
      ],
    );
  }
}
