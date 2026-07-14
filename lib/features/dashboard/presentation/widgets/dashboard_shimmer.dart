import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the whole dashboard. Mirrors the layout of
/// [DashboardScreen] so the transition from loading to loaded feels instant.
class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 24,
                bottom: 24,
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerFill(width: 120, height: 16, radius: 6),
                      ShimmerDot(size: 32),
                    ],
                  ),
                  context.vXl,
                  ShimmerFill(width: 180, height: 28, radius: 6),
                  context.vSm,
                  ShimmerFill(width: 220, height: 16, radius: 6),
                  context.vLg,
                  ShimmerFill(width: 140, height: 14, radius: 6),
                  context.vSm,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      ShimmerFill(width: 160, height: 48, radius: 6),
                      context.hSm,
                      ShimmerFill(width: 50, height: 24, radius: 6),
                      context.hSm,
                      ShimmerFill(width: 120, height: 24, radius: 14),
                    ],
                  ),
                  context.vLg,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(38),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                ShimmerFill(width: 56, height: 18, radius: 6),
                                const SizedBox(height: 2),
                                ShimmerFill(width: 50, height: 12, radius: 6),
                              ],
                            ),
                          ),
                          Container(width: 1, color: Colors.white.withAlpha(70)),
                          Expanded(
                            child: Column(
                              children: [
                                ShimmerFill(width: 56, height: 18, radius: 6),
                                const SizedBox(height: 2),
                                ShimmerFill(width: 70, height: 12, radius: 6),
                              ],
                            ),
                          ),
                          Container(width: 1, color: Colors.white.withAlpha(70)),
                          Expanded(
                            child: Column(
                              children: [
                                ShimmerFill(width: 56, height: 18, radius: 6),
                                const SizedBox(height: 2),
                                ShimmerFill(width: 64, height: 12, radius: 6),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              delegate: SliverChildListDelegate.fixed([
                _StatCardShimmer(),
                _StatCardShimmer(),
                _StatCardShimmer(),
                _StatCardShimmer(),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: context.rMd,
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withAlpha(38),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerFill(width: 120, height: 16, radius: 6),
                      ShimmerFill(width: 40, height: 12, radius: 6),
                    ],
                  ),
                  context.vMd,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (var i = 0; i < 7; i++) ...[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ShimmerFill(width: 20, height: 10, radius: 6),
                                context.vXs,
                                ShimmerFill(
                                  width: double.infinity,
                                  height: 40 + (i * 8).toDouble(),
                                  radius: 15,
                                ),
                                context.vXs,
                                ShimmerFill(width: 20, height: 10, radius: 6),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  context.vMd,
                  Row(
                    children: [
                      ShimmerDot(size: 8),
                      context.hSm,
                      ShimmerFill(width: 40, height: 11, radius: 6),
                      context.hMd,
                      ShimmerDot(size: 8),
                      context.hSm,
                      ShimmerFill(width: 70, height: 11, radius: 6),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerFill(width: 140, height: 18, radius: 6),
                  ShimmerFill(width: 60, height: 14, radius: 6),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: context.rMd,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withAlpha(38),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < 4; i++) ...[
                      _TransactionRowShimmer(),
                      if (i < 3)
                        Divider(
                          color: Theme.of(
                            context,
                          ).colorScheme.outline.withAlpha(70),
                          height: 1,
                          thickness: 1,
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerFill(width: 120, height: 18, radius: 6),
                  ShimmerFill(width: 80, height: 14, radius: 6),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  for (var i = 0; i < 2; i++) _StockAlertShimmer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: context.rLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerDot(size: 44),
          context.vSm,
          ShimmerFill(width: 80, height: 28, radius: 6),
          context.vXs,
          ShimmerFill(width: 100, height: 14, radius: 6),
          const Spacer(),
          Row(
            children: [
              ShimmerFill(width: 24, height: 14, radius: 6),
              const SizedBox(width: 4),
              ShimmerFill(width: 70, height: 14, radius: 6),
            ],
          ),
        ],
      ),
    );
  }
}

class _TransactionRowShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ShimmerFill(width: 40, height: 40, radius: 20),
          context.hMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerFill(width: 100, height: 16, radius: 6),
                context.vXs,
                ShimmerFill(width: 70, height: 12, radius: 6),
              ],
            ),
          ),
          ShimmerFill(width: 70, height: 18, radius: 6),
        ],
      ),
    );
  }
}

class _StockAlertShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: context.rMd,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerFill(width: 140, height: 16, radius: 6),
                context.vXs,
                ShimmerFill(width: 80, height: 12, radius: 6),
              ],
            ),
          ),
          ShimmerFill(width: 50, height: 14, radius: 6),
        ],
      ),
    );
  }
}
