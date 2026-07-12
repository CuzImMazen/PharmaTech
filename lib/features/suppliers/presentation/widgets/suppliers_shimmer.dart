import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Suppliers list. Mirrors [SupplierCard]'s
/// layout (name + company pill + contact line + action row) inside the same
/// bordered `surfaceContainer` container, so the shimmer reads as the real
/// card mid-load. The whole list animates as one [ShimmerScope] sweep.
class SuppliersShimmer extends StatelessWidget {
  const SuppliersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: context.pHorizontal,
        itemCount: 7,
        separatorBuilder: (context, index) => context.vMd,
        itemBuilder: (context, index) => const _ShimmerSupplierCard(),
      ),
    );
  }
}

class _ShimmerSupplierCard extends StatelessWidget {
  const _ShimmerSupplierCard();

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name (left) + company pill (right).
          Row(
            children: const [
              Expanded(child: ShimmerFill(width: double.infinity, height: 18)),
              SizedBox(width: 12),
              ShimmerFill(width: 90, height: 22, radius: 100),
            ],
          ),
          const SizedBox(height: 14),
          // Contact line (phone + email placeholders).
          const Row(
            children: [
              ShimmerFill(width: 24, height: 24, radius: 6),
              SizedBox(width: 8),
              ShimmerFill(width: 120, height: 14),
              SizedBox(width: 16),
              ShimmerFill(width: 24, height: 24, radius: 6),
              SizedBox(width: 8),
              ShimmerFill(width: 140, height: 14),
            ],
          ),
          const SizedBox(height: 14),
          // Action row (edit + delete icon placeholders).
          const Row(
            children: [
              ShimmerFill(width: 36, height: 36, radius: 12),
              SizedBox(width: 10),
              ShimmerFill(width: 36, height: 36, radius: 12),
            ],
          ),
        ],
      ),
    );
  }
}
