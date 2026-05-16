import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.sXxl),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.primary.withAlpha(30),
      ),
      child: Icon(icon, size: 90, color: context.colors.primary.withAlpha(150)),
    );
  }
}
