import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Medical Info tab. Mirrors the real
/// [_MedicalInfoContent] layout — an Edit/Delete action row at the top, then a
/// stack of [DetailSectionCard] sections (icon + title + divider +
/// multi-line paragraph body) — so the shimmer reads as the real tab mid-load.
/// The whole layout animates as one [ShimmerScope] sweep.
class MedicalInfoShimmer extends StatelessWidget {
  const MedicalInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView(
        padding: context.pScreen,
        children: [
          // Edit + Delete action buttons row — mirrors _ActionButton (rLg pill).
          Row(
            children: const [
              ShimmerFill(width: 96, height: 40, radius: 16),
              SizedBox(width: 8),
              ShimmerFill(width: 96, height: 40, radius: 16),
            ],
          ),
          context.vMd,
          const _ShimmerSection(),
          const _ShimmerSection(),
          const _ShimmerSection(),
          const _ShimmerSection(),
        ],
      ),
    );
  }
}

/// Mirrors a medical-info [DetailSectionCard]: bordered 16-radius container,
/// icon + title header, divider, then a multi-line paragraph body.
class _ShimmerSection extends StatelessWidget {
  const _ShimmerSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.sMd),
      child: Container(
        width: double.infinity,
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
            // Header: icon + title.
            Row(
              children: const [
                ShimmerFill(width: 20, height: 20, radius: 4),
                SizedBox(width: 8),
                ShimmerFill(width: 180, height: 16),
              ],
            ),
            context.vSm,
            Divider(
              height: 1,
              thickness: 1,
              color: context.colors.outline.withAlpha(120),
            ),
            // Paragraph body (varied widths for a natural look).
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.sSm),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerFill(width: double.infinity, height: 12),
                  SizedBox(height: 8),
                  ShimmerFill(width: double.infinity, height: 12),
                  SizedBox(height: 8),
                  ShimmerFill(width: 240, height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
