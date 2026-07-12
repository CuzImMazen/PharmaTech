import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Cash Box screen: a gradient-ish summary card
/// placeholder plus a few transaction-row placeholders, all inside one
/// [ShimmerScope] so they animate as a single sweep.
class CashBoxShimmer extends StatelessWidget {
  const CashBoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: context.pHorizontal,
        children: [
          // Summary card placeholder.
          Container(
            width: double.infinity,
            height: context.sXxl,
            margin: EdgeInsets.symmetric(vertical: context.sSm),
            child: ShimmerFill(
              width: double.infinity,
              height: context.sXxl,
              radius: 20,
            ),
          ),
          SizedBox(height: context.sLg),
          // Transaction rows.
          for (var i = 0; i < 6; i++) const _ShimmerTxRow(),
        ],
      ),
    );
  }
}

class _ShimmerTxRow extends StatelessWidget {
  const _ShimmerTxRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllMd,
      margin: EdgeInsets.only(bottom: context.sMd),
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
          SizedBox(width: context.sMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerFill(width: 140, height: 16),
                SizedBox(height: context.sSm),
                ShimmerFill(width: 90, height: 12),
              ],
            ),
          ),
          ShimmerFill(width: 70, height: 18, radius: 6),
        ],
      ),
    );
  }
}
