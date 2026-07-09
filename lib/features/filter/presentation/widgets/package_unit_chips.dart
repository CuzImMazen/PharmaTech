import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';
import 'package:pharmacy_app/features/inventory/data/models/base_unit_model.dart';

class PackageUnitChips extends StatelessWidget {
  const PackageUnitChips({super.key, required this.units});

  final List<BaseUnitModel> units;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryCubit>().state;

    return Wrap(
      spacing: 10,
      runSpacing: 12,
      children: [
        ChoiceChip(
          label: const Text('All'),
          selected: state.baseUnitId == null,
          onSelected: (_) =>
              context.read<InventoryCubit>().updateBaseUnitId(null),
        ),
        ...units.map(
          (unit) => ChoiceChip(
            label: Text('${unit.name} (${unit.type})'),
            selected: state.baseUnitId == unit.id,
            onSelected: (_) {
              context.read<InventoryCubit>().updateBaseUnitId(unit.id);
            },
          ),
        ),
      ],
    );
  }
}
