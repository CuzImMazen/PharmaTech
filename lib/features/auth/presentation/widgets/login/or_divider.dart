import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: context.muted.withAlpha(150), thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(context.tr.auth_or),
        ),
        Expanded(
          child: Divider(color: context.muted.withAlpha(150), thickness: 1),
        ),
      ],
    );
  }
}
