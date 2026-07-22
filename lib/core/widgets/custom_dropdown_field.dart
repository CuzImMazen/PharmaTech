import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        DecoratedBox(
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
          child: _buildFieldContent(context),
        ),
      ],
    );
  }

  /// Renders the dropdown itself, or a standalone loading/error state that
  /// fills the same outlined box. Loading and error are drawn *outside* the
  /// `DropdownButton` so a retry tap is reliably received — embedding the
  /// retry `GestureDetector` inside a disabled `DropdownButton` (items empty
  /// → onChanged null) silently swallowed the tap, leaving "Tap to retry"
  /// non-functional.
  /// Only honor [value] when it's actually present in [items]. A value that
  /// isn't in the list (e.g. a saved selection whose options haven't loaded
  /// yet, or a unit that no longer matches the list's type) would otherwise
  /// trip DropdownButton's "exactly one item with value" assertion.
  T? get _effectiveValue =>
      (value != null && items.contains(value)) ? value : null;

  Widget _buildFieldContent(BuildContext context) {
    // While options are loading AND nothing is selected yet, show the
    // spinner. Once a product is set (e.g. seeded/scanned), show the dropdown
    // even mid-load so the selection is visible.
    if (isLoading && value == null) {
      return _buildStatusHint(context);
    }
    if (hasError && items.isEmpty && value == null) {
      return _buildStatusHint(context);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: _effectiveValue,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.muted,
          ),
          hint: _buildPlaceholder(context),
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    itemLabel(item),
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          onChanged: items.isEmpty ? null : onChanged,
        ),
      ),
    );
  }

  /// Loading spinner or tappable error, sized to match the dropdown's row.
  Widget _buildStatusHint(BuildContext context) {
    final theme = Theme.of(context);
    final tr = context.tr;
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
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
              tr.dropdown_loading,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: context.muted.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      );
    }
    // Error state: tap anywhere in the box to retry.
    return InkWell(
      onTap: onRetry,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                onRetry != null ? tr.dropdown_tap_to_retry : tr.dropdown_failed,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Text(
      hintText ?? '',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: context.muted.withValues(alpha: 0.5),
          ),
    );
  }
}
