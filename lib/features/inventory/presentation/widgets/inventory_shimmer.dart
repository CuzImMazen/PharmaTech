import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/widgets/shimmer_box.dart';

/// Loading placeholder for the inventory list/grid. Mirrors the real
/// [MedicineListCard] / [MedicineGridCard] layout exactly — same bordered
/// `surfaceContainer` container, same status pill, category pill, info cards,
/// and stock progress bar — so the shimmer reads as the real widget mid-load
/// rather than a generic stack of bars. The whole grid is wrapped in a single
/// [ShimmerScope] so the sweep animates as one unit.
class InventoryShimmer extends StatelessWidget {
  const InventoryShimmer({super.key, required this.viewMode});

  final ViewMode viewMode;

  @override
  Widget build(BuildContext context) {
    final isList = viewMode == ViewMode.list;
    final itemCount = isList ? 6 : 8;

    return ShimmerScope(
      child: isList
          ? ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: context.pHorizontal,
              itemCount: itemCount,
              separatorBuilder: (context, index) => context.vMd,
              itemBuilder: (context, index) => const _ShimmerListCard(),
            )
          : GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: itemCount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.gridColumns,
                childAspectRatio: context.gridAspectRatio(
                  columns: context.gridColumns,
                  spacing: context.sMd,
                ),
              ),
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: _ShimmerGridCard(),
              ),
            ),
    );
  }
}

// Mirrors the real card container: 16-radius border + surfaceContainer.
class _ShimmerCardShell extends StatelessWidget {
  const _ShimmerCardShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.5,
          color: Theme.of(context).colorScheme.outline.withAlpha(170),
        ),
        color: context.colors.surfaceContainer,
      ),
      child: child,
    );
  }
}

// Pill shapes used by the real status badge + category chip (rLg / rMd).
const _pillRadius = 100.0;

class _ShimmerListCard extends StatelessWidget {
  const _ShimmerListCard();

  @override
  Widget build(BuildContext context) {
    return _ShimmerCardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name (left) + status pill (right) — mirrors MedicineListCard row.
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerFill(width: double.infinity, height: 18),
                    SizedBox(height: 6),
                    ShimmerFill(width: 120, height: 14),
                  ],
                ),
              ),
              ShimmerFill(width: 74, height: 26, radius: _pillRadius),
            ],
          ),
          const SizedBox(height: 12),
          // Category pill.
          const ShimmerFill(width: 110, height: 22, radius: _pillRadius),
          const SizedBox(height: 16),
          // Three 100px info cards — mirrors MedicineInfoCard (rLg, highest).
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerFill(width: 100, height: 64, radius: 16),
              ShimmerFill(width: 100, height: 64, radius: 16),
              ShimmerFill(width: 100, height: 64, radius: 16),
            ],
          ),
          const SizedBox(height: 16),
          // Stock-level line.
          const Row(
            children: [
              ShimmerFill(width: 90, height: 12),
              Spacer(),
              ShimmerFill(width: 60, height: 12),
            ],
          ),
          const SizedBox(height: 12),
          // 10px stock progress bar.
          const ShimmerFill(width: double.infinity, height: 10, radius: 5),
        ],
      ),
    );
  }
}

class _ShimmerGridCard extends StatelessWidget {
  const _ShimmerGridCard();

  @override
  Widget build(BuildContext context) {
    return _ShimmerCardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: dot (left) + status pill (right) — mirrors grid header.
          Row(
            children: const [
              ShimmerDot(size: 10),
              Spacer(),
              ShimmerFill(width: 74, height: 26, radius: _pillRadius),
            ],
          ),
          const SizedBox(height: 12),
          // Name + ar name.
          const ShimmerFill(width: double.infinity, height: 18),
          const SizedBox(height: 6),
          const ShimmerFill(width: 110, height: 14),
          const SizedBox(height: 12),
          // Category pill.
          const ShimmerFill(width: 110, height: 22, radius: _pillRadius),
          const SizedBox(height: 16),
          // Stock (left) + price (right) — mirrors grid card bottom row.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerFill(width: 50, height: 18),
                  SizedBox(height: 4),
                  ShimmerFill(width: 40, height: 12),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerFill(width: 50, height: 18),
                  SizedBox(height: 4),
                  ShimmerFill(width: 40, height: 12),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
