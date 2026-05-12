import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class ResendLinkButton extends StatelessWidget {
  const ResendLinkButton({super.key, this.onTap});

  final VoidCallback? onTap;

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
            context.tr.resendLink,
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
