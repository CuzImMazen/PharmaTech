import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class InventoryHeader extends StatelessWidget {
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pAllMd,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Inventory",
                style: context.text.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              context.vSm,
              Text(
                "20 of 20 items",
                style: context.text.bodyMedium?.copyWith(
                  color: context.colors.onSurface.withAlpha(140),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: context.pAllSm,
            decoration: BoxDecoration(
              color: context.colors.primaryContainer,
              borderRadius: context.rMd,
            ),
            child: Icon(Icons.add, color: context.colors.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}
