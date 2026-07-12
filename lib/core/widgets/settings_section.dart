import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

/// Shared grouped-row building blocks used by the Settings screen and the
/// Operations hub — a section header, a bordered card grouping rows, and the
/// tappable row / icon-box primitives that fill it.
///
/// Extracted from settings_screen.dart so both screens share one look.

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.sSm, bottom: context.sSm),
      child: Text(
        label,
        style: context.text.labelLarge?.copyWith(
          color: context.muted,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// A bordered rounded container (matching the app's card style) grouping a set
/// of rows separated by thin dividers.
class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.5,
          color: context.colors.outline.withAlpha(170),
        ),
        color: context.colors.surfaceContainer,
      ),
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1)
              Divider(
                height: 1,
                thickness: 1,
                color: context.colors.outline.withAlpha(80),
                indent: context.sMd,
                endIndent: context.sMd,
              ),
          ],
        ],
      ),
    );
  }
}

/// A single tappable settings row: leading icon box + label + trailing chevron.
class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sMd,
            vertical: context.sMd,
          ),
          child: Row(
            children: [
              IconBox(icon: icon, color: iconColor),
              context.hMd,
              Expanded(
                child: Text(
                  label,
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: context.muted,
                size: context.iMd,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A rounded tinted box holding a leading icon. Shared by every row.
class IconBox extends StatelessWidget {
  const IconBox({super.key, required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.iLg,
      height: context.iLg,
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: context.rMd,
      ),
      child: Icon(icon, size: context.iSm, color: color),
    );
  }
}

/// Accent colors for the operation/settings rows, kept out of the call sites.
/// Add more accents here as rows grow.
class AppColorsHelper {
  static Color supplier(BuildContext context) =>
      context.isDark ? const Color(0xFF60A5FA) : const Color(0xFF2563EB);

  static Color customer(BuildContext context) =>
      context.isDark ? const Color(0xFFF472B6) : const Color(0xFFDB2777);

  static Color theme(BuildContext context) =>
      context.isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706);

  static Color language(BuildContext context) =>
      context.isDark ? const Color(0xFF4FD1C5) : const Color(0xFF0D9488);

  static Color invoice(BuildContext context) =>
      context.isDark ? const Color(0xFFC084FC) : const Color(0xFF7C3AED);

  static Color sale(BuildContext context) =>
      context.isDark ? const Color(0xFF34D399) : const Color(0xFF059669);

  static Color debt(BuildContext context) =>
      context.isDark ? const Color(0xFFF472B6) : const Color(0xFFDB2777);

  static Color cashBox(BuildContext context) =>
      context.isDark ? const Color(0xFF34D399) : const Color(0xFF059669);

  static Color adjustment(BuildContext context) =>
      context.isDark ? const Color(0xFF60A5FA) : const Color(0xFF2563EB);

  static Color profile(BuildContext context) =>
      context.isDark ? const Color(0xFFA78BFA) : const Color(0xFF6D28D9);

  static Color destructive(BuildContext context) =>
      context.isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626);
}
