import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/widgets/settings_section.dart';

/// The finance hub — the Sales nav tab. A grouped list of every
/// day-to-day operation (sales, purchasing, cash & stock), each row pushing
/// its screen over the nav shell. Mirrors the Settings screen's section style
/// via the shared [SettingsSection] / [SettingsRow] / [SectionHeader] widgets.
class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          tr.finance_title,
          style: context.text.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: context.pScreen,
          children: [
            // Sales section.
            _SectionHeader(label: tr.finance_sales),
            SettingsSection(
              children: [
                SettingsRow(
                  icon: LucideIcons.receiptText,
                  iconColor: AppColorsHelper.sale(context),
                  label: tr.settings_sales_invoices,
                  onTap: () => context.push(AppRoutesKeys.salesInvoicesList),
                ),
                SettingsRow(
                  icon: LucideIcons.users,
                  iconColor: AppColorsHelper.customer(context),
                  label: tr.settings_customers,
                  onTap: () => context.push(AppRoutesKeys.customersList),
                ),
                SettingsRow(
                  icon: LucideIcons.handCoins,
                  iconColor: AppColorsHelper.debt(context),
                  label: tr.settings_customer_debts,
                  onTap: () => context.push(AppRoutesKeys.customerDebtsList),
                ),
              ],
            ),

            // Purchasing section.
            context.vLg,
            _SectionHeader(label: tr.finance_purchasing),
            SettingsSection(
              children: [
                SettingsRow(
                  icon: LucideIcons.receipt,
                  iconColor: AppColorsHelper.invoice(context),
                  label: tr.settings_purchase_invoices,
                  onTap: () => context.push(AppRoutesKeys.invoicesList),
                ),
                SettingsRow(
                  icon: LucideIcons.truck,
                  iconColor: AppColorsHelper.supplier(context),
                  label: tr.settings_suppliers,
                  onTap: () => context.push(AppRoutesKeys.suppliersList),
                ),
                SettingsRow(
                  icon: LucideIcons.landmark,
                  iconColor: AppColorsHelper.debt(context),
                  label: tr.settings_supplier_debts,
                  onTap: () => context.push(AppRoutesKeys.debtsList),
                ),
              ],
            ),

            // Cash & Stock section.
            context.vLg,
            _SectionHeader(label: tr.finance_cash_box),
            SettingsSection(
              children: [
                SettingsRow(
                  icon: LucideIcons.wallet,
                  iconColor: AppColorsHelper.cashBox(context),
                  label: tr.settings_cash_box,
                  onTap: () => context.push(AppRoutesKeys.cashBox),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Local alias for the shared [SectionHeader] so call sites read naturally
/// within this feature file.
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => SectionHeader(label: label);
}
