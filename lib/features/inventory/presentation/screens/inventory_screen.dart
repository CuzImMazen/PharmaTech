import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/categories_section.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/filters_row.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/inventory_header.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/medicine_card/medicine_list_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/search_text_field.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

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
            SearchTextField(controller: _searchController),
            context.vLg,

            CategoriesSection(),
            context.vMd,
            FiltersRow(),
            context.vMd,
            Expanded(
              child: ListView.separated(
                // Dynamically size it based on your data length
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  // Grab the specific map for this item
                  final medicine = medicines[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: MedicineListCard(
                      name: medicine["name"] as String,
                      arName: medicine["arName"] as String,
                      currentStock: medicine["current"] as int,
                      minStock: medicine["min"] as int,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return context.vMd;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
