import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A self-contained shimmer box reused by detail-screen loading states.
///
/// Wraps the `shimmer` package's [Shimmer.fromColors] so every placeholder
/// reads as one animated system — a left-to-right highlight sweep across a
/// surface-colored box, with a softly rounded corner so the placeholder
/// echoes the rounded cards it stands in for.
class ShimmerBox extends StatelessWidget {
  const ShimmerBox({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlight = Theme.of(context).colorScheme.surface;

    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: base,
        highlightColor: highlight,
        period: const Duration(milliseconds: 1400),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: base,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}

/// Wraps a block of child placeholders in a single shared [Shimmer.fromColors]
/// sweep so a whole loading layout animates as one unit (instead of each box
/// running its own animation). Use [ShimmerFill] / [ShimmerDot] for the shapes
/// inside.
class ShimmerScope extends StatelessWidget {
  const ShimmerScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlight = Theme.of(context).colorScheme.surface;

    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      period: const Duration(milliseconds: 1400),
      child: child,
    );
  }
}

/// A plain surface-colored rounded box for use inside a [ShimmerScope]. Pass a
/// large [radius] (or [double.infinity]) for pill shapes; default 6 gives the
/// subtle rounding used on text lines.
class ShimmerFill extends StatelessWidget {
  const ShimmerFill({
    super.key,
    required this.width,
    required this.height,
    this.radius = 6,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

/// A small circular dot placeholder (e.g. the status dot on a medicine card).
class ShimmerDot extends StatelessWidget {
  const ShimmerDot({super.key, this.size = 8});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
