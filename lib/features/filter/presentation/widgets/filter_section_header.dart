import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

/// A filter-section title row with an optional inline reload affordance.
///
/// When [isLoading] is true a small spinning arrow is shown next to the title.
/// When [hasError] is true a tappable reload arrow (in the error color) is
/// shown instead; tapping it calls [onRetry]. This lets each filter section
/// (categories, package units, companies) retry its own failed fetch
/// independently instead of forcing a full reload.
class FilterSectionHeader extends StatelessWidget {
  const FilterSectionHeader({
    super.key,
    required this.title,
    this.isLoading = false,
    this.hasError = false,
    this.onRetry,
  });

  final String title;
  final bool isLoading;
  final bool hasError;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.error;

    Widget? trailing;
    if (isLoading) {
      trailing = SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(context.muted),
        ),
      );
    } else if (hasError) {
      trailing = _ReloadArrow(color: errorColor, onTap: onRetry);
    }

    return Row(
      children: [
        Text(title, style: context.text.titleMedium),
        const Spacer(),
        if (trailing != null) ...[trailing, context.hSm],
      ],
    );
  }
}

/// A tappable, briefly-animated reload arrow. Spins once on tap as feedback
/// that the retry was registered.
class _ReloadArrow extends StatefulWidget {
  const _ReloadArrow({required this.color, this.onTap});

  final Color color;
  final VoidCallback? onTap;

  @override
  State<_ReloadArrow> createState() => _ReloadArrowState();
}

class _ReloadArrowState extends State<_ReloadArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward(from: 0);
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: context.tr.filter_retry,
      child: InkResponse(
        onTap: _handleTap,
        radius: 18,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: RotationTransition(
            turns: _controller,
            child: Icon(Icons.refresh, size: 18, color: widget.color),
          ),
        ),
      ),
    );
  }
}
