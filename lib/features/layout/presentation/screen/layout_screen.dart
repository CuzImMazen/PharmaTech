import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

class LayoutScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const LayoutScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(context.sMd),
        child: Container(
          decoration: BoxDecoration(
            color: context.surface,
            borderRadius: context.rLg,
            border: Border.all(color: context.colors.outline.withAlpha(38)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            children: [
              _ExpandedNavItem(
                icon: LucideIcons.layoutDashboard,
                label: context.tr.dashboard,
                isActive: navigationShell.currentIndex == 0,
                onTap: () => navigationShell.goBranch(
                  0,
                  initialLocation: navigationShell.currentIndex == 0,
                ),
              ),
              _ExpandedNavItem(
                icon: LucideIcons.package,
                label: context.tr.inventory,
                isActive: navigationShell.currentIndex == 1,
                onTap: () => navigationShell.goBranch(
                  1,
                  initialLocation: navigationShell.currentIndex == 1,
                ),
              ),
              _ExpandedNavItem(
                icon: LucideIcons.shoppingCart,
                label: context.tr.sales,
                isActive: navigationShell.currentIndex == 2,
                onTap: () => navigationShell.goBranch(
                  2,
                  initialLocation: navigationShell.currentIndex == 2,
                ),
              ),
              _ExpandedNavItem(
                icon: LucideIcons.chartBar,
                label: context.tr.reports,
                isActive: navigationShell.currentIndex == 3,
                onTap: () => navigationShell.goBranch(
                  3,
                  initialLocation: navigationShell.currentIndex == 3,
                ),
              ),
              _ExpandedNavItem(
                icon: LucideIcons.settings,
                label: context.tr.settings,
                isActive: navigationShell.currentIndex == 4,
                onTap: () => navigationShell.goBranch(
                  4,
                  initialLocation: navigationShell.currentIndex == 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExpandedNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _ExpandedNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = context.primary;
    final muted = context.muted;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: context.rMd,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isActive ? primary.withAlpha(26) : Colors.transparent,
                  borderRadius: context.rMd,
                ),
                child: Icon(
                  icon,
                  size: context.iSm,
                  color: isActive ? primary : muted,
                ),
              ),
              context.vXs,
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.labelSmall?.copyWith(
                  fontSize: 10,
                  color: isActive ? primary : muted,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
