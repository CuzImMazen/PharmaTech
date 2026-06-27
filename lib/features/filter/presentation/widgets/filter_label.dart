import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class FilterLabel extends StatelessWidget {
  const FilterLabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: context.text.titleMedium),
        context.hSm,
        Expanded(
          child: Divider(
            color: context.mutedSurface,
            thickness: 3.0,
            height: 3.0,
          ),
        ),
      ],
    );
  }
}
