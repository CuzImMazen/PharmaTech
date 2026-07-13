import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Supplier Return Invoices list. Mirrors
/// [SupplierReturnInvoiceCard]'s layout (invoice number + date + supplier +
/// refund total + status pill) inside the same bordered surfaceContainer.
class SupplierReturnInvoicesShimmer extends StatelessWidget {
  const SupplierReturnInvoicesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: context.pHorizontal,
        itemCount: 7,
        separatorBuilder: (context, index) => context.vMd,
        itemBuilder: (context, index) => const _ShimmerReturnCard(),
      ),
    );
  }
}

class _ShimmerReturnCard extends StatelessWidget {
  const _ShimmerReturnCard();

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
              ShimmerFill(width: 70, height: 22, radius: 100),
            ],
          ),
          const SizedBox(height: 12),
          const ShimmerFill(width: 120, height: 12),
          const SizedBox(height: 14),
          const Row(
            children: [
              ShimmerFill(width: 24, height: 24, radius: 6),
              SizedBox(width: 8),
              ShimmerFill(width: 140, height: 14),
              Spacer(),
              ShimmerFill(width: 80, height: 18),
            ],
          ),
        ],
      ),
    );
  }
}
