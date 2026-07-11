import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

/// A labeled outlined dropdown that visually matches [CustomTextField].
///
/// Generic over the option type [T]; [labelText] is shown above the field,
/// [itemLabel] maps an option to its display string, and [value] is the
/// currently-selected option (null = nothing selected / placeholder shown).
/// When [items] is empty the field shows a loading/disabled hint and, if
/// [onRetry] is provided, taps retry the option load.
class CustomDropdownField<T> extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.labelText,
    required this.items,
    required this.itemLabel,
    required this.value,
    required this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.isLoading = false,
    this.hasError = false,
    this.onRetry,
  });

  final String labelText;
  final List<T> items;
  final String Function(T item) itemLabel;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? hintText;
  final IconData? prefixIcon;
  final bool isLoading;
  final bool hasError;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Only honor [value] when it's actually present in [items]. A value that
    // isn't in the list (e.g. a saved selection whose options haven't loaded
    // yet, or a unit that no longer matches the list's type) would otherwise
    // trip DropdownButton's "exactly one item with value" assertion.
    final effectiveValue =
        (value != null && items.contains(value)) ? value : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: hasError
                    ? Colors.redAccent
                    : context.muted.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            color: colorScheme.surface,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: effectiveValue,
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: context.muted,
              ),
              hint: _buildHint(context),
              items: items
                  .map(
                    (item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        itemLabel(item),
                        style: theme.textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: items.isEmpty ? null : onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHint(BuildContext context) {
    if (isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: context.muted,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '...',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.muted.withValues(alpha: 0.5),
                ),
          ),
        ],
      );
    }
    if (hasError) {
      return GestureDetector(
        onTap: onRetry,
        child: Text(
          onRetry != null ? 'Tap to retry' : 'Failed to load',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.redAccent,
              ),
        ),
      );
    }
    return Text(
      hintText ?? '',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: context.muted.withValues(alpha: 0.5),
          ),
    );
  }
}
