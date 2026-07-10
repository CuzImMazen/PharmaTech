import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

class InventoryHeader extends StatelessWidget {
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pAllMd,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr.inventory,
                style: context.text.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              context.vSm,
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
