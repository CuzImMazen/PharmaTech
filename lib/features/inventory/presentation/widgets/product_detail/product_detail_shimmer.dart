import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Product Detail screen, approximating the
/// Overview tab (header + status badge + three section cards). Shown during
/// the initial fetch.
class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.pScreen,
      children: [
        // Header: name + status badge.
        Row(
          children: const [
            Expanded(
              child: ShimmerBox(width: double.infinity, height: 28),
            ),
            SizedBox(width: 12),
            ShimmerBox(width: 90, height: 26),
          ],
        ),
        const SizedBox(height: 24),
        _ShimmerCard(rows: 7),
        const SizedBox(height: 16),
        _ShimmerCard(rows: 4),
        const SizedBox(height: 16),
        _ShimmerCard(rows: 5),
      ],
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard({required this.rows});

  final int rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.pAllMd,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerBox(width: 140, height: 18),
          const SizedBox(height: 16),
          for (var i = 0; i < rows; i++) ...[
            const Row(
              children: [
                ShimmerBox(width: 100, height: 14),
                Spacer(),
                ShimmerBox(width: 80, height: 14),
              ],
            ),
            if (i < rows - 1) const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
