import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Supplier Debts list. Mirrors
/// [SupplierDebtCard]'s layout (supplier name + status pill + amounts box).
class SupplierDebtsShimmer extends StatelessWidget {
  const SupplierDebtsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: context.pHorizontal,
        itemCount: 7,
        separatorBuilder: (context, index) => context.vMd,
        itemBuilder: (context, index) => const _ShimmerDebtCard(),
      ),
    );
  }
}

class _ShimmerDebtCard extends StatelessWidget {
  const _ShimmerDebtCard();

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
          Row(
            children: const [
              Expanded(child: ShimmerFill(width: double.infinity, height: 18)),
              SizedBox(width: 12),
              ShimmerFill(width: 80, height: 22, radius: 100),
            ],
          ),
          const SizedBox(height: 14),
          ShimmerFill(
            width: double.infinity,
            height: context.iLg,
            radius: 12,
          ),
        ],
      ),
    );
  }
}
