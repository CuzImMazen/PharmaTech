import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/widgets/filter_chip_group_wrap.dart';

class ExpiryDateFilterSection extends StatefulWidget {
  const ExpiryDateFilterSection({super.key});

  @override
  State<ExpiryDateFilterSection> createState() =>
      _ExpiryDateFilterSectionState();
}

class _ExpiryDateFilterSectionState extends State<ExpiryDateFilterSection> {
  final List<String> _expiryOptions = const [
    'Expired',
    '30 days',
    '60 days',
    '90 days',
    '6 months',
  ];

  Set<String> _selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup<String>(
      items: _expiryOptions,
      selectedItems: _selectedOptions,
      onChanged: (value) {
        setState(() {
          _selectedOptions = value;
        });
      },
      labelBuilder: (item) => item,
    );
  }
}
