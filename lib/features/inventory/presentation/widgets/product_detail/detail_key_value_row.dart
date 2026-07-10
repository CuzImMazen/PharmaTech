import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

/// A single key/value row used inside [DetailSectionCard].
///
/// The key sits at the start, the value at the end (space-between) so it
/// mirrors correctly in RTL. Pass [accent] to render the value in the primary
/// accent color (used for highlighted values like selling price / total qty).
/// Pass [ltrValue] when the value is numeric or an ID that must read
/// left-to-right even in Arabic.
class DetailKeyValueRow extends StatelessWidget {
  const DetailKeyValueRow({
    super.key,
    required this.label,
    required this.value,
    this.accent = false,
    this.ltrValue = false,
  });

  final String label;
  final String value;
  final bool accent;
  final bool ltrValue;

  @override
  Widget build(BuildContext context) {
    final valueStyle = context.text.bodyMedium?.copyWith(
      color: accent ? context.primary : context.colors.onSurface,
      fontWeight: accent ? FontWeight.bold : FontWeight.w500,
    );

    final valueText = Text(
      value,
      style: valueStyle,
      textAlign: TextAlign.end,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sSm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
            ),
          ),
          context.hSm,
          Flexible(
            child: ltrValue
                ? Directionality(
                    textDirection: TextDirection.ltr,
                    child: valueText,
                  )
                : valueText,
          ),
        ],
      ),
    );
  }
}
