import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    this.tabletLayout,
    this.desktopLayout,
  });

  final WidgetBuilder mobileLayout;
  final WidgetBuilder? tabletLayout;
  final WidgetBuilder? desktopLayout;

  static const double tabletBreakpoint = 800;
  static const double desktopBreakpoint = 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width >= desktopBreakpoint && desktopLayout != null) {
          return desktopLayout!(context);
        }

        if (width >= tabletBreakpoint && tabletLayout != null) {
          return tabletLayout!(context);
        }

        return mobileLayout(context);
      },
    );
  }
}
