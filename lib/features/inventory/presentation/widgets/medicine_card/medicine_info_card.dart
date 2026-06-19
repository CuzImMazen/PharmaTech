import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class MedicineInfoCard extends StatelessWidget {
  const MedicineInfoCard({super.key, required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: context.rLg,
        color: context.colors.surfaceContainerHighest,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Column(
          children: [
            Text(value, style: context.text.titleMedium),
            Text(label, style: context.text.bodyMedium),
          ],
        ),
      ),
    );
  }
}
