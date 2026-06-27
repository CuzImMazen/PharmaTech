import 'package:flutter/material.dart';

import '../../../../core/widgets/filter_chip_group_wrap.dart';

class CategoryFilterSection extends StatefulWidget {
  const CategoryFilterSection({super.key});

  @override
  State<CategoryFilterSection> createState() => _CategoryFilterSectionState();
}

class _CategoryFilterSectionState extends State<CategoryFilterSection> {
  final List<String> _categories = const [
    'Antibiotics',
    'Painkillers',
    'Digestive',
    'Diabetes',
    'Cardiovascular',
    'Vitamins',
    'Hormones',
    'Dermatology',
    'Allergy',
    'Antifungals',
  ];

  Set<String> _selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup<String>(
      items: _categories,
      selectedItems: _selectedCategories,
      onChanged: (value) {
        setState(() {
          _selectedCategories = value;
        });
      },
      labelBuilder: (item) => item,
    );
  }
}
