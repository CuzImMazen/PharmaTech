import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppBorderRadius.lg),
      onTap: onTap,
      child: Ink(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
          gradient: LinearGradient(
            colors: [
              context.colors.primary,
              context.colors.primary.withValues(alpha: 0.85),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: context.colors.primary.withValues(alpha: 0.25),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: context.text.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
