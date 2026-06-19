import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class MedicineNameColumn extends StatelessWidget {
  const MedicineNameColumn({
    super.key,
    required this.name,
    required this.arName,
  });
  final String name;
  final String arName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: context.text.titleMedium),
        context.vXs,
        Text(
          arName,
          style: context.text.bodyMedium!.copyWith(color: context.muted),
        ),
        context.vMd,
      ],
    );
  }
}
