import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  static const List<String> categories = [
    "All",
    "Antibiotics",
    "Painkillers",
    "Digestive",
    "Hormones",
    "Vitamins",
    "Dermatology",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ChoiceChip(
            showCheckmark: false,
            selected: index == 5 || index == 2,
            label: Text(categories[index]),
            onSelected: (bool value) {},
          );
        },
        separatorBuilder: (context, index) => context.hSm,
      ),
    );
  }
}
