import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class TermsAndConditionsRow extends StatelessWidget {
  const TermsAndConditionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //  prev.acceptTerms != curr.acceptTerms ||
        Checkbox(
          value: //state.acceptTerms,
              false,
          onChanged: (value) {},
        ),

        Expanded(
          child: RichText(
            text: TextSpan(
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurface, // removed opacity
              ),
              children: [
                TextSpan(text: '${context.tr.agree_to} '),

                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      context.tr.terms_and_conditions,
                      style: context.text.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                TextSpan(text: ' ${context.tr.and} '),

                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      context.tr.privacy_policy,
                      style: context.text.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
