import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Medical Info tab while the (standalone) medical
/// info re-fetch is in flight after a mutation or manual reload.
class MedicalInfoShimmer extends StatelessWidget {
  const MedicalInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.pScreen,
      children: const [
        _ShimmerSection(),
        SizedBox(height: 16),
        _ShimmerSection(),
        SizedBox(height: 16),
        _ShimmerSection(),
      ],
    );
  }
}

class _ShimmerSection extends StatelessWidget {
  const _ShimmerSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.pAllMd,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBox(width: 160, height: 18),
          SizedBox(height: 16),
          ShimmerBox(width: double.infinity, height: 12),
          SizedBox(height: 8),
          ShimmerBox(width: double.infinity, height: 12),
          SizedBox(height: 8),
          ShimmerBox(width: 220, height: 12),
        ],
      ),
    );
  }
}
