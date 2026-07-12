import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/app/auth/sign_out_cubit.dart';
import 'package:pharmacy_app/core/app/auth/sign_out_state.dart';
import 'package:pharmacy_app/core/app/settings/locale_cubit.dart';
import 'package:pharmacy_app/core/app/settings/theme_cubit.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';

/// Settings home. Grouped option rows: Appearance (theme + language),
/// Pharmacy (suppliers), and Account (sign out).
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignOutCubit(),
      child: const _SettingsView(),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return BlocListener<SignOutCubit, SignOutState>(
      listenWhen: (p, c) => p.failure != c.failure,
      listener: (context, state) {
        if (state.failure != null) {
          AppSnackbar.failure(
            message: state.failure!.localizedMessage(context),
          );
          context.read<SignOutCubit>().clearFailure();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(tr.settings)),
        body: SafeArea(
          child: ListView(
            padding: context.pScreen,
            children: [
              // Appearance section.
              _SectionHeader(label: tr.settings_appearance),
              _SettingsSection(
                children: [
                  _SettingsValueRow(
                    icon: LucideIcons.sunMoon,
                    iconColor: AppColorsHelper.theme(context),
                    label: tr.settings_theme,
                    value: _themeLabel(context),
                    onTap: () => _showThemePicker(context),
                  ),
                  _SettingsValueRow(
                    icon: LucideIcons.languages,
                    iconColor: AppColorsHelper.language(context),
                    label: tr.settings_language,
                    value: _languageLabel(context),
                    onTap: () => _showLanguagePicker(context),
                  ),
                ],
              ),

              // Pharmacy section.
              context.vLg,
              _SectionHeader(label: tr.settings_pharmacy),
              _SettingsSection(
                children: [
                  _SettingsRow(
                    icon: LucideIcons.truck,
                    iconColor: AppColorsHelper.supplier(context),
                    label: tr.settings_suppliers,
                    onTap: () => context.push(AppRoutesKeys.suppliersList),
                  ),
                ],
              ),

              // Operations section.
              context.vLg,
              _SectionHeader(label: tr.settings_operations),
              _SettingsSection(
                children: [
                  _SettingsRow(
                    icon: LucideIcons.receipt,
                    iconColor: AppColorsHelper.invoice(context),
                    label: tr.settings_purchase_invoices,
                    onTap: () => context.push(AppRoutesKeys.invoicesList),
                  ),
                  _SettingsRow(
                    icon: LucideIcons.landmark,
                    iconColor: AppColorsHelper.debt(context),
                    label: tr.settings_supplier_debts,
                    onTap: () => context.push(AppRoutesKeys.debtsList),
                  ),
                  _SettingsRow(
                    icon: LucideIcons.wallet,
                    iconColor: AppColorsHelper.cashBox(context),
                    label: tr.settings_cash_box,
                    onTap: () => context.push(AppRoutesKeys.cashBox),
                  ),
                  _SettingsRow(
                    icon: LucideIcons.slidersHorizontal,
                    iconColor: AppColorsHelper.adjustment(context),
                    label: tr.settings_stock_adjustments,
                    onTap: () => context.push(AppRoutesKeys.adjustmentsList),
                  ),
                ],
              ),

              // Account section.
              context.vLg,
              _SectionHeader(label: tr.settings_account),
              _SettingsSection(
                children: [
                  _SettingsRow(
                    icon: LucideIcons.user,
                    iconColor: AppColorsHelper.profile(context),
                    label: tr.profile,
                    onTap: () => context.push(AppRoutesKeys.profile),
                  ),
                  _SignOutRow(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _themeLabel(BuildContext context) {
    final mode = context.watch<ThemeCubit>().state;
    final tr = context.tr;
    return switch (mode) {
      ThemeMode.system => tr.theme_system,
      ThemeMode.light => tr.theme_light,
      ThemeMode.dark => tr.theme_dark,
    };
  }

  String _languageLabel(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state;
    final tr = context.tr;
    if (locale == null) return tr.language_system;
    return locale.languageCode == 'ar'
        ? tr.language_arabic
        : tr.language_english;
  }

  void _showThemePicker(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<ThemeCubit>();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(context.sXl)),
      ),
      builder: (_) => _SettingsChoiceSheet(
        title: tr.settings_theme,
        options: [
          _Choice(tr.theme_system, cubit.state == ThemeMode.system,
              cubit.useSystemTheme),
          _Choice(tr.theme_light, cubit.state == ThemeMode.light,
              cubit.useLightTheme),
          _Choice(tr.theme_dark, cubit.state == ThemeMode.dark,
              cubit.useDarkTheme),
        ],
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<LocaleCubit>();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(context.sXl)),
      ),
      builder: (_) => _SettingsChoiceSheet(
        title: tr.settings_language,
        options: [
          _Choice(tr.language_system, cubit.state == null,
              cubit.useSystemLocale),
          _Choice(tr.language_english, cubit.state?.languageCode == 'en',
              cubit.useEnglish),
          _Choice(tr.language_arabic, cubit.state?.languageCode == 'ar',
              cubit.useArabic),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label});

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
/// of settings rows separated by thin dividers.
class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.children});

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
class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
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
              _IconBox(icon: icon, color: iconColor),
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

/// A settings row showing the current value of a setting (e.g. theme/locale).
class _SettingsValueRow extends StatelessWidget {
  const _SettingsValueRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
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
              _IconBox(icon: icon, color: iconColor),
              context.hMd,
              Expanded(
                child: Text(
                  label,
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                value,
                style: context.text.bodyMedium?.copyWith(color: context.muted),
              ),
              SizedBox(width: context.sXs),
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

class _IconBox extends StatelessWidget {
  const _IconBox({required this.icon, required this.color});

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

class _Choice {
  const _Choice(this.label, this.isSelected, this.onTap);
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
}

/// A modal bottom sheet listing options with a check on the current one.
class _SettingsChoiceSheet extends StatelessWidget {
  const _SettingsChoiceSheet({required this.title, required this.options});

  final String title;
  final List<_Choice> options;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.pAllLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: _DragHandle()),
            context.vMd,
            Text(
              title,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            context.vMd,
            for (final option in options) ...[
              _ChoiceTile(option: option),
              if (option != options.last) context.vXs,
            ],
          ],
        ),
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.iLg,
      height: context.sXs,
      decoration: BoxDecoration(
        color: context.muted.withAlpha(120),
        borderRadius: BorderRadius.circular(context.sHuge),
      ),
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({required this.option});

  final _Choice option;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: option.isSelected
          ? context.primary.withAlpha(20)
          : Colors.transparent,
      borderRadius: context.rMd,
      child: InkWell(
        borderRadius: context.rMd,
        onTap: () {
          option.onTap();
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sMd,
            vertical: context.sMd,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  option.label,
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: option.isSelected ? context.primary : null,
                  ),
                ),
              ),
              if (option.isSelected)
                Icon(Icons.check_rounded, color: context.primary, size: context.iMd),
            ],
          ),
        ),
      ),
    );
  }
}

/// The sign-out row: shows a spinner while signing out, a confirm dialog first.
class _SignOutRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return BlocBuilder<SignOutCubit, SignOutState>(
      buildWhen: (p, c) => p.isSigningOut != c.isSigningOut,
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: state.isSigningOut ? null : () => _confirm(context),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.sMd,
                vertical: context.sMd,
              ),
              child: Row(
                children: [
                  _IconBox(
                    icon: LucideIcons.logOut,
                    color: AppColorsHelper.destructive(context),
                  ),
                  context.hMd,
                  Expanded(
                    child: Text(
                      tr.sign_out,
                      style: context.text.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColorsHelper.destructive(context),
                      ),
                    ),
                  ),
                  if (state.isSigningOut)
                    SizedBox(
                      width: context.iSm,
                      height: context.iSm,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColorsHelper.destructive(context),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _confirm(BuildContext context) async {
    final tr = context.tr;
    final cubit = context.read<SignOutCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.sign_out_confirm_title),
        content: Text(tr.sign_out_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(tr.detail_cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(tr.sign_out),
          ),
        ],
      ),
    );
    if (confirmed == true) cubit.signOut();
  }
}

/// Small helper to keep accent colors out of the row call sites. Add more
/// accents here as settings rows grow.
class AppColorsHelper {
  static Color supplier(BuildContext context) =>
      context.isDark ? const Color(0xFF60A5FA) : const Color(0xFF2563EB);

  static Color theme(BuildContext context) =>
      context.isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706);

  static Color language(BuildContext context) =>
      context.isDark ? const Color(0xFF4FD1C5) : const Color(0xFF0D9488);

  static Color invoice(BuildContext context) =>
      context.isDark ? const Color(0xFFC084FC) : const Color(0xFF7C3AED);

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
