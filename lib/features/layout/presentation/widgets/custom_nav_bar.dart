import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/layout/presentation/widgets/nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            NavBarItem(
              icon: LucideIcons.layoutDashboard,
              label: context.tr.dashboard,
              isActive: navigationShell.currentIndex == 0,
              onTap: () => navigationShell.goBranch(
                0,
                initialLocation: navigationShell.currentIndex == 0,
              ),
            ),
            NavBarItem(
              icon: LucideIcons.package,
              label: context.tr.inventory,
              isActive: navigationShell.currentIndex == 1,
              onTap: () => navigationShell.goBranch(
                1,
                initialLocation: navigationShell.currentIndex == 1,
              ),
            ),
            NavBarItem(
              icon: LucideIcons.shoppingCart,
              label: context.tr.sales,
              isActive: navigationShell.currentIndex == 2,
              onTap: () => navigationShell.goBranch(
                2,
                initialLocation: navigationShell.currentIndex == 2,
              ),
            ),
            NavBarItem(
              icon: LucideIcons.chartBar,
              label: context.tr.reports,
              isActive: navigationShell.currentIndex == 3,
              onTap: () => navigationShell.goBranch(
                3,
                initialLocation: navigationShell.currentIndex == 3,
              ),
            ),
            NavBarItem(
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
    );
  }
}
