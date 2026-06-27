import 'package:flutter/material.dart';
import '../../../../core/widgets/filter_chip_group_wrap.dart';

class PackageUnitFilterSection extends StatefulWidget {
  const PackageUnitFilterSection({super.key});

  @override
  State<PackageUnitFilterSection> createState() =>
      _PackageUnitFilterSectionState();
}

class _PackageUnitFilterSectionState extends State<PackageUnitFilterSection> {
  final List<String> _statuses = const ['Box', 'Bottle', 'Tube'];

  Set<String> _selectedStatuses = {};

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup<String>(
      items: _statuses,
      selectedItems: _selectedStatuses,
      onChanged: (value) {
        setState(() {
          _selectedStatuses = value;
        });
      },
      labelBuilder: (item) => item,
    );
  }
}
