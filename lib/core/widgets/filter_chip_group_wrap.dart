import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/widgets/app_filter_chip.dart';

class FilterChipGroup<T> extends StatelessWidget {
  final List<T> items;
  final Set<T> selectedItems;
  final FilterSelectionMode mode;
  final String Function(T item) labelBuilder;
  final void Function(Set<T> updatedSelection) onChanged;

  const FilterChipGroup({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
    required this.labelBuilder,
    this.mode = FilterSelectionMode.multiple,
  });

  void _toggleItem(T item) {
    final newSelection = Set<T>.from(selectedItems);

    if (mode == FilterSelectionMode.single) {
      if (newSelection.contains(item)) {
        newSelection.clear();
      } else {
        newSelection
          ..clear()
          ..add(item);
      }
    } else {
      if (newSelection.contains(item)) {
        newSelection.remove(item);
      } else {
        newSelection.add(item);
      }
    }

    onChanged(newSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 12,
      children: items.map((item) {
        final selected = selectedItems.contains(item);

        return AppFilterChip(
          label: labelBuilder(item),
          selected: selected,
          onTap: () => _toggleItem(item),
        );
      }).toList(),
    );
  }
}
