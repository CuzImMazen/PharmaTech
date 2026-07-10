import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/inventory/cubit/inventory_cubit.dart';
import 'package:pharmacy_app/features/inventory/data/models/company_model.dart';

class CompanyChips extends StatelessWidget {
  const CompanyChips({super.key, required this.companies});

  final List<CompanyModel> companies;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InventoryCubit>().state;

    return Wrap(
      spacing: 10,
      runSpacing: 12,
      children: [
        ChoiceChip(
          label: Text(context.tr.filter_all),
          selected: state.companyIds.isEmpty,
          onSelected: (_) =>
              context.read<InventoryCubit>().updateCompanyIds({}),
        ),
        ...companies.map(
          (company) => ChoiceChip(
            label: Text(company.name),
            selected: state.companyIds.contains(company.id),
            onSelected: (_) {
              final newCompanyIds = state.companyIds.toSet();
              if (newCompanyIds.contains(company.id)) {
                newCompanyIds.remove(company.id);
              } else {
                newCompanyIds.add(company.id);
              }
              context.read<InventoryCubit>().updateCompanyIds(newCompanyIds);
            },
          ),
        ),
      ],
    );
  }
}
