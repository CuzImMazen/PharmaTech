import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_category.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key, required this.categories});

  final List<ProductCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryCubit>().state;

    return Wrap(
      spacing: 10,
      runSpacing: 12,
      children: [
        ChoiceChip(
          label: Text(context.tr.filter_all),
          selected: state.categoryIds.isEmpty,
          onSelected: (_) =>
              context.read<InventoryCubit>().updateCategoryIds({}),
        ),
        ...categories.map(
          (category) => ChoiceChip(
            label: Text(category.name),
            selected: state.categoryIds.contains(category.id),
            onSelected: (_) {
              final newCategoryIds = state.categoryIds.toSet();
              if (newCategoryIds.contains(category.id)) {
                newCategoryIds.remove(category.id);
              } else {
                newCategoryIds.add(category.id);
              }
              context.read<InventoryCubit>().updateCategoryIds(newCategoryIds);
            },
          ),
        ),
      ],
    );
  }
}
