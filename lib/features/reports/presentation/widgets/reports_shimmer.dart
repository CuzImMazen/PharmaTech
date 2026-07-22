import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Generic shimmer placeholder for all report tabs.
/// Mirrors the dashboard shimmer but with a filter bar row + stat grid + list rows.
class ReportsShimmer extends StatelessWidget {
  const ReportsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: context.pHorizontal,
        children: [
          context.vMd,
          // Filter bar row.
          Row(
            children: [
              ShimmerFill(width: 80, height: 36, radius: 12),
              context.hSm,
              ShimmerFill(width: 120, height: 36, radius: 12),
              const Spacer(),
              ShimmerFill(width: 80, height: 36, radius: 12),
            ],
          ),
          context.vMd,
          // Summary stat grid.
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
            children: const [
              _StatShimmer(),
              _StatShimmer(),
              _StatShimmer(),
              _StatShimmer(),
            ],
          ),
          context.vMd,
          // List rows.
          for (var i = 0; i < 5; i++) ...[
            _ListRowShimmer(),
            if (i < 4) context.vSm,
          ],
        ],
      ),
    );
  }
}

class _StatShimmer extends StatelessWidget {
  const _StatShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: context.rLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerDot(size: 40),
          const Spacer(),
          ShimmerFill(width: 80, height: 28, radius: 6),
          context.vXs,
          ShimmerFill(width: 100, height: 14, radius: 6),
        ],
      ),
    );
  }
}

class _ListRowShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.5,
          color: context.colors.outline.withAlpha(170),
        ),
        color: context.colors.surfaceContainer,
      ),
      child: Row(
        children: [
          ShimmerFill(width: context.iLg, height: context.iLg, radius: 12),
          context.hMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerFill(width: 140, height: 16, radius: 6),
                context.vXs,
                ShimmerFill(width: 90, height: 12, radius: 6),
              ],
            ),
          ),
          ShimmerFill(width: 70, height: 18, radius: 6),
        ],
      ),
    );
  }
}
