import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class ResendLinkButton extends StatelessWidget {
  const ResendLinkButton({super.key, this.onTap, required this.buttonText});

  final VoidCallback? onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: context.rMd,
      child: Container(
        height: context.btnLg,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: context.rMd,
          color: context.colors.primary.withAlpha(30),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: context.text.bodyLarge!.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
