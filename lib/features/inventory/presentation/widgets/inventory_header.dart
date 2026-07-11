import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

class InventoryHeader extends StatelessWidget {
  const InventoryHeader({super.key, this.onAdd});

  /// Tapped when the user presses the add-product icon (top-right).
  final VoidCallback? onAdd;

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
          const Spacer(),
          Material(
            color: context.colors.primaryContainer,
            borderRadius: context.rMd,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onAdd,
              child: Padding(
                padding: context.pAllSm,
                child: Icon(
                  Icons.add,
                  color: context.colors.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
