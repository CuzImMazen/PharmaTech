import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Stock Adjustments log. Mirrors
/// [StockAdjustmentTile]'s layout (product name + type + meta + signed qty).
class StockAdjustmentsShimmer extends StatelessWidget {
  const StockAdjustmentsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: context.pHorizontal,
        itemCount: 7,
        separatorBuilder: (context, index) => context.vMd,
        itemBuilder: (context, index) => const _ShimmerTile(),
      ),
    );
  }
}

class _ShimmerTile extends StatelessWidget {
  const _ShimmerTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllSm,
      decoration: BoxDecoration(
        borderRadius: context.rLg,
        border: Border.all(
          width: 1.5,
          color: context.colors.outline.withAlpha(120),
        ),
        color: context.colors.surfaceContainer,
      ),
      child: Row(
        children: [
          ShimmerFill(
            width: context.iLg,
            height: context.iLg,
            radius: 100,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerFill(width: double.infinity, height: 16),
                SizedBox(height: 10),
                ShimmerFill(width: 160, height: 13),
                SizedBox(height: 10),
                ShimmerFill(width: 120, height: 12),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const ShimmerFill(width: 60, height: 22, radius: 100),
        ],
      ),
    );
  }
}
