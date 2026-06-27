import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import '../../../../core/widgets/filter_chip_group_wrap.dart';

class PrescriptionFilterSection extends StatefulWidget {
  const PrescriptionFilterSection({super.key});

  @override
  State<PrescriptionFilterSection> createState() =>
      _PrescriptionFilterSectionState();
}

class _PrescriptionFilterSectionState extends State<PrescriptionFilterSection> {
  final List<String> _prescriptionTypes = const ['Yes', 'No'];

  Set<String> _selectedPrescriptionTypes = {};

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup<String>(
      items: _prescriptionTypes,
      selectedItems: _selectedPrescriptionTypes,
      mode: FilterSelectionMode.single,
      onChanged: (value) {
        setState(() {
          _selectedPrescriptionTypes = value;
        });
      },
      labelBuilder: (item) => item,
    );
  }
}
