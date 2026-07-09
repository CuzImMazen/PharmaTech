import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class InventoryShimmer extends StatelessWidget {
  const InventoryShimmer({super.key, required this.viewMode});

  final ViewMode viewMode;

  @override
  Widget build(BuildContext context) {
    final isList = viewMode == ViewMode.list;
    final itemCount = isList ? 6 : 8;

    return isList
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
          );
  }
}

class _ShimmerSurface extends StatefulWidget {
  const _ShimmerSurface({required this.height});

  final double height;

  @override
  State<_ShimmerSurface> createState() => _ShimmerSurfaceState();
}

class _ShimmerSurfaceState extends State<_ShimmerSurface>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlight = Theme.of(context).colorScheme.surface;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment(-1.0 + (_controller.value * 2), -0.3),
              end: Alignment(1.0 + (_controller.value * 2), 0.3),
              colors: [base, highlight, base],
              stops: const [0.35, 0.5, 0.65],
            ).createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
      child: Container(height: widget.height, color: base),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: _ShimmerSurface(height: height),
    );
  }
}

class _ShimmerListCard extends StatelessWidget {
  const _ShimmerListCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(child: _ShimmerBox(width: double.infinity, height: 18)),
              SizedBox(width: 12),
              _ShimmerBox(width: 74, height: 26),
            ],
          ),
          const SizedBox(height: 12),
          const _ShimmerBox(width: 110, height: 24),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: _ShimmerBox(width: double.infinity, height: 52)),
              SizedBox(width: 12),
              Expanded(child: _ShimmerBox(width: double.infinity, height: 52)),
              SizedBox(width: 12),
              Expanded(child: _ShimmerBox(width: double.infinity, height: 52)),
            ],
          ),
          const SizedBox(height: 16),
          const _ShimmerBox(width: double.infinity, height: 10),
        ],
      ),
    );
  }
}

class _ShimmerGridCard extends StatelessWidget {
  const _ShimmerGridCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _ShimmerBox(width: double.infinity, height: 18),
          SizedBox(height: 12),
          _ShimmerBox(width: 150, height: 24),
          SizedBox(height: 18),
          _ShimmerBox(width: 110, height: 20),
          SizedBox(height: 14),
          _ShimmerBox(width: double.infinity, height: 56),
          SizedBox(height: 12),
          _ShimmerBox(width: double.infinity, height: 28),
        ],
      ),
    );
  }
}
