import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/features/inventory/cubit/view_mode_cubit.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/filters_row.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/inventory_header.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/grid_card/medicine_grid_card.dart';
// ignore: unused_import
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/list_card/medicine_list_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/search_text_field.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicines = [
      {"name": "Aspirin", "arName": "أسبرين", "current": 12, "min": 25},
      {
        "name": "Paracetamol",
        "arName": "باراسيتامول",
        "current": 45,
        "min": 30,
      },
      {"name": "Ibuprofen", "arName": "إيبوبروفين", "current": 0, "min": 20},
      {
        "name": "Amoxicillin",
        "arName": "أموكسيسيلين",
        "current": 25,
        "min": 25,
      },
      {"name": "Metformin", "arName": "ميتفورمين", "current": 60, "min": 50},
      {"name": "Lipitor", "arName": "ليبيتور", "current": 5, "min": 15},
      {"name": "Omeprazole", "arName": "أوميبرازول", "current": 30, "min": 40},
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InventoryHeader(),
            context.vMd,
            SearchTextField(),
            context.vLg,
            FiltersRow(),
            context.vMd,
            Expanded(
              child: BlocBuilder<ViewModeCubit, ViewMode>(
                builder: (context, viewMode) {
                  if (viewMode == ViewMode.list) {
                    return ListView.separated(
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        final medicine = medicines[index];

                        return ListMedicines(medicine: medicine);
                      },
                      separatorBuilder: (context, index) {
                        return context.vMd;
                      },
                    );
                  }
                  return GridMedicines(medicines: medicines);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListMedicines extends StatelessWidget {
  const ListMedicines({super.key, required this.medicine});

  final Map<String, Object> medicine;

  @override
  Widget build(BuildContext context) {
    return MedicineListCard(
      name: medicine["name"] as String,
      arName: medicine["arName"] as String,
      currentStock: medicine["current"] as int,
      minStock: medicine["min"] as int,
    );
  }
}

class GridMedicines extends StatelessWidget {
  const GridMedicines({super.key, required this.medicines});

  final List<Map<String, Object>> medicines;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: medicines.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.gridColumns,
        childAspectRatio: context.gridAspectRatio(
          columns: context.gridColumns,
          spacing: context.sMd,
        ),
      ),
      itemBuilder: (context, index) {
        final medicine = medicines[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: MedicineGridCard(
            name: medicine["name"] as String,
            arName: medicine["arName"] as String,
            currentStock: medicine["current"] as int,
            minStock: medicine["min"] as int,
          ),
        );
      },
    );
  }
}
