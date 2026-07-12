import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the Product Detail screen. Mirrors the Overview
/// tab layout exactly — name + status badge header, then three
/// [DetailSectionCard]s (icon + title + divider + label/value rows with
/// interleaved dividers) — so the shimmer reads as the real tab mid-load. The
/// whole layout animates as one [ShimmerScope] sweep.
class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView(
        padding: context.pScreen,
        children: [
          // Header: name (start) + status badge (trailing).
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerFill(width: double.infinity, height: 26),
                    SizedBox(height: 6),
                    ShimmerFill(width: 140, height: 16),
                  ],
                ),
              ),
              SizedBox(width: 12),
              ShimmerFill(width: 90, height: 28, radius: 100),
            ],
          ),
          context.vLg,
          const _ShimmerSectionCard(rows: 7),
          context.vLg,
          const _ShimmerSectionCard(rows: 4),
          context.vLg,
          const _ShimmerSectionCard(rows: 5),
        ],
      ),
    );
  }
}

/// Mirrors [DetailSectionCard]: bordered 16-radius container, icon + title
/// header, divider, then [rows] label/value pairs separated by thin dividers.
class _ShimmerSectionCard extends StatelessWidget {
  const _ShimmerSectionCard({required this.rows});

  final int rows;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Header: icon placeholder + title.
          Row(
            children: const [
              ShimmerFill(width: 20, height: 20, radius: 4),
              SizedBox(width: 8),
              ShimmerFill(width: 150, height: 16),
            ],
          ),
          context.vSm,
          Divider(
            height: 1,
            thickness: 1,
            color: context.colors.outline.withAlpha(120),
          ),
          for (var i = 0; i < rows; i++) ...[
            // Label (start) + value (end) — mirrors DetailKeyValueRow.
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.sSm),
              child: const Row(
                children: [
                  ShimmerFill(width: 110, height: 14),
                  Spacer(),
                  ShimmerFill(width: 80, height: 14),
                ],
              ),
            ),
            if (i < rows - 1)
              Divider(
                height: 1,
                thickness: 1,
                color: context.colors.outline.withAlpha(80),
              ),
          ],
        ],
      ),
    );
  }
}
