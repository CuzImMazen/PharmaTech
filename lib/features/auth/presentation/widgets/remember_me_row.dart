import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({
    super.key,
    required this.rememberMe,
    required this.onChanged,
  });
  final bool rememberMe;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: rememberMe, onChanged: onChanged),
        Text(
          context.tr.auth_remember_me,
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colors.secondary,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            // Handle forgot password action
          },
          child: Text(
            context.tr.auth_forgot_password,
            style: context.text.bodyMedium!.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
