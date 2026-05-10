import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class TermsAndConditionsRow extends StatelessWidget {
  const TermsAndConditionsRow({
    super.key,
    required this.acceptedTerms,
    this.onChanged,
    this.onPrivacyTap,
    this.onTermsTap,
  });

  final bool acceptedTerms;
  final void Function(bool?)? onChanged;
  final VoidCallback? onPrivacyTap;
  final VoidCallback? onTermsTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.text.bodySmall?.copyWith(
      color: context.colors.onSurface,
    );

    final linkStyle = textStyle?.copyWith(
      color: context.colors.primary,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      decorationColor: context.colors.primary,
    );

    return Row(
      children: [
        Checkbox(value: acceptedTerms, onChanged: onChanged),

        Expanded(
          child: Wrap(
            children: [
              Text('${context.tr.agree_to} ', style: textStyle),
              GestureDetector(
                onTap: onTermsTap,

                child: Text(context.tr.terms_and_conditions, style: linkStyle),
              ),

              Text(" & ", style: textStyle),

              GestureDetector(
                onTap: onPrivacyTap,

                child: Text(context.tr.privacy_policy, style: linkStyle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
