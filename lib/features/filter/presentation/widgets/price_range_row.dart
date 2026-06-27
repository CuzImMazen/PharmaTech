import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/features/filter/presentation/widgets/price_textfield_.dart';

class PriceRangeRow extends StatelessWidget {
  const PriceRangeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PriceTextField(labelText: "From", hintText: "0"),
        ),
        context.hMd,
        Container(width: 20, height: 1, color: Colors.grey.shade400),
        context.hMd,
        Expanded(
          child: PriceTextField(labelText: "To", hintText: "1000"),
        ),
      ],
    );
  }
}
