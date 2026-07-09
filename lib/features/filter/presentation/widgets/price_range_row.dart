import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class PriceRangeRow extends StatelessWidget {
  const PriceRangeRow({
    super.key,
    required this.minController,
    required this.maxController,
  });

  final TextEditingController minController;
  final TextEditingController maxController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: minController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'From', hintText: '0'),
          ),
        ),
        context.hMd,
        Container(width: 20, height: 1, color: Colors.grey.shade400),
        context.hMd,
        Expanded(
          child: TextField(
            controller: maxController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'To',
              hintText: '1000',
            ),
          ),
        ),
      ],
    );
  }
}
