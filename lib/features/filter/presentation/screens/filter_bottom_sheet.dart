import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/category_filter_Section.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/expiry_filter_section.dart.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/filter_header.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/filter_label.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/package_unit_filter_section.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/prescription_filter_section.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/price_range_row.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/stock_status_filter_section.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const FilterHeader(),
            context.vMd,

            // 🔥 Scrollable content
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  FilterLabel(label: "Category"),
                  context.vMd,
                  const CategoryFilterSection(),

                  context.vMd,
                  FilterLabel(label: "Stock Status"),
                  context.vMd,
                  const StockStatusFilterSection(),

                  context.vMd,
                  FilterLabel(label: "Price Range (SP)"),
                  context.vMd,
                  const PriceRangeRow(),

                  context.vMd,
                  FilterLabel(label: "Expiry Date"),
                  context.vMd,
                  const ExpiryDateFilterSection(),

                  context.vMd,
                  FilterLabel(label: "Package Unit"),
                  context.vMd,
                  const PackageUnitFilterSection(),
                  context.vMd,

                  FilterLabel(label: "Prescription Required"),
                  context.vMd,
                  const PrescriptionFilterSection(),

                  context.vLg,
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Divider(
                    color: context.mutedSurface,
                    thickness: 3.0,
                    height: 3.0,
                  ),
                  context.vMd,

                  CustomButton(
                    onTap: () {
                      // Apply filters
                    },
                    text: "Show Results",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
