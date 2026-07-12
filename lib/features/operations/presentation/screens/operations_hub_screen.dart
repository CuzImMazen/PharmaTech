import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/widgets/settings_section.dart';

/// The Operations hub — the Sales nav tab. A grouped list of every
/// day-to-day operation (sales, purchasing, cash & stock), each row pushing
/// its screen over the nav shell. Mirrors the Settings screen's section style
/// via the shared [SettingsSection] / [SettingsRow] / [SectionHeader] widgets.
class OperationsHubScreen extends StatelessWidget {
  const OperationsHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Scaffold(
      appBar: AppBar(title: Text(tr.operations_title)),
      body: SafeArea(
        child: ListView(
          padding: context.pScreen,
          children: [
            // Sales section.
            _SectionHeader(label: tr.operations_sales),
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
              ],
            ),

            // Purchasing section.
            context.vLg,
            _SectionHeader(label: tr.operations_purchasing),
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
            _SectionHeader(label: tr.operations_cash_and_stock),
            SettingsSection(
              children: [
                SettingsRow(
                  icon: LucideIcons.wallet,
                  iconColor: AppColorsHelper.cashBox(context),
                  label: tr.settings_cash_box,
                  onTap: () => context.push(AppRoutesKeys.cashBox),
                ),
                SettingsRow(
                  icon: LucideIcons.slidersHorizontal,
                  iconColor: AppColorsHelper.adjustment(context),
                  label: tr.settings_stock_adjustments,
                  onTap: () => context.push(AppRoutesKeys.adjustmentsList),
                ),
                SettingsRow(
                  icon: LucideIcons.layers,
                  iconColor: AppColorsHelper.adjustment(context),
                  label: tr.settings_bulk_adjustment,
                  onTap: () => context.push(AppRoutesKeys.bulkStockAdjustment),
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
