import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/extensions/location_localization_ext.dart';

class LocationDropDown extends StatelessWidget {
  const LocationDropDown({
    super.key,
    required this.label,
    required this.initialValue,
    required this.hint,
    required this.items,
    required this.enabled,
    this.onChanged,
    this.isGovernorate = false,
  });

  final String label;
  final String? initialValue;
  final String hint;
  final List<String> items;
  final bool enabled;
  final bool isGovernorate;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: enabled
                ? colorScheme.surface
                : colorScheme.surface.withValues(alpha: 0.6),
            borderRadius: context.rMd,
            border: Border.all(
              color: context.muted.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: DropdownButtonFormField<String>(
            initialValue: (initialValue != null && initialValue!.isNotEmpty)
                ? initialValue
                : null,

            hint: Text(
              hint,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: context.muted.withValues(alpha: 0.5),
              ),
            ),

            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: context.muted),

            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface,
            ),

            decoration: InputDecoration(
              contentPadding: context.pAllMd,
              border: InputBorder.none,
            ),

            dropdownColor: colorScheme.surface,

            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  isGovernorate
                      ? context.govLabel(item)
                      : context.cityLabel(item),
                ),
              );
            }).toList(),

            onChanged: enabled ? onChanged : null,
          ),
        ),
      ],
    );
  }
}
