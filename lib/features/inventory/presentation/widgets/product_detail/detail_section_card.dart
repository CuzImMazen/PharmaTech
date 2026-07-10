import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

/// A rounded elevation card for the Overview tab. Header = icon + title
/// aligned to the start; body = an arbitrary list of children (typically
/// [DetailKeyValueRow]s) separated by thin dividers.
///
/// Mirrors the existing [MedicineListCard] container style: 16 radius,
/// 1.5px outline at alpha 170, surfaceContainer background.
class DetailSectionCard extends StatelessWidget {
  const DetailSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  final IconData icon;
  final String title;
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
              Icon(icon, size: context.iSm, color: context.primary),
              context.hSm,
              Text(
                title,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: context.sSm),
          Divider(
            height: 1,
            thickness: 1,
            color: context.colors.outline.withAlpha(120),
          ),
          ..._interleaved(context, children),
        ],
      ),
    );
  }

  /// Inserts a thin divider between each child (not before the first, not
  /// after the last).
  List<Widget> _interleaved(BuildContext context, List<Widget> items) {
    if (items.isEmpty) return items;
    final result = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      result.add(items[i]);
      if (i < items.length - 1) {
        result.add(
          Divider(
            height: 1,
            thickness: 1,
            color: context.colors.outline.withAlpha(80),
          ),
        );
      }
    }
    return result;
  }
}
