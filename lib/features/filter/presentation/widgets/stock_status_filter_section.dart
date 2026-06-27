import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import '../../../../core/widgets/filter_chip_group_wrap.dart';

class StockStatusFilterSection extends StatefulWidget {
  const StockStatusFilterSection({super.key});

  @override
  State<StockStatusFilterSection> createState() =>
      _StockStatusFilterSectionState();
}

class _StockStatusFilterSectionState extends State<StockStatusFilterSection> {
  final List<String> _statuses = const ['Available', 'Low', 'Out'];

  Set<String> _selectedStatuses = {};

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup<String>(
      items: _statuses,
      selectedItems: _selectedStatuses,
      mode: FilterSelectionMode.single,
      onChanged: (value) {
        setState(() {
          _selectedStatuses = value;
        });
      },
      labelBuilder: (item) => item,
    );
  }
}
