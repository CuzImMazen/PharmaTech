import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Customers list. Mirrors [CustomerCard]'s
/// layout (name + phone line + action row) inside the same bordered
/// `surfaceContainer` container, so the shimmer reads as the real card
/// mid-load. The whole list animates as one [ShimmerScope] sweep.
class CustomersShimmer extends StatelessWidget {
  const CustomersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: context.pHorizontal,
        itemCount: 7,
        separatorBuilder: (context, index) => context.vMd,
        itemBuilder: (context, index) => const _ShimmerCustomerCard(),
      ),
    );
  }
}

class _ShimmerCustomerCard extends StatelessWidget {
  const _ShimmerCustomerCard();

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
          // Name.
          const Row(
            children: [
              Expanded(child: ShimmerFill(width: double.infinity, height: 18)),
            ],
          ),
          const SizedBox(height: 14),
          // Phone line placeholder.
          const Row(
            children: [
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
