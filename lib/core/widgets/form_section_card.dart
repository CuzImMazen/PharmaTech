import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

/// A labeled, iconed, rounded outlined container used to group form fields.
///
/// Mirrors the visual style of [DetailSectionCard] (16 radius, 1.5px outline at
/// alpha 170, surfaceContainer background) so the Add/Edit forms read as one
/// system with the detail tabs. The header is an icon + bold title.
class FormSectionCard extends StatelessWidget {
  const FormSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
    this.subtitle,
  });

  final String title;
  final IconData icon;
  final String? subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.pAllMd,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.5,
          color: context.colors.outline.withAlpha(170),
        ),
        color: context.colors.surfaceContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: context.iLg,
                height: context.iLg,
                decoration: BoxDecoration(
                  color: context.primary.withAlpha(25),
                  borderRadius: context.rMd,
                ),
                child: Icon(icon, size: context.iSm, color: context.primary),
              ),
              context.hSm,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.text.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty)
                      Text(
                        subtitle!,
                        style: context.text.labelSmall?.copyWith(
                          color: context.muted,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.sMd),
          Divider(
            height: 1,
            thickness: 1,
            color: context.colors.outline.withAlpha(120),
          ),
          SizedBox(height: context.sMd),
          ...children,
        ],
      ),
    );
  }
}
