import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/shared/barcode/barcode_flow.dart';

class NotificationRow extends StatelessWidget {
  const NotificationRow({super.key});

  Future<void> _onScanTapped(BuildContext context) async {
    final product = await BarcodeFlow.start(context);
    if (!context.mounted || product == null) return;
    await _showScanChoiceSheet(context, product);
  }

  Future<void> _showScanChoiceSheet(
    BuildContext context,
    ProductDetailModel product,
  ) {
    final tr = context.tr;
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        final name = Localizations.localeOf(sheetContext).languageCode == 'ar'
            ? (product.arName ?? product.brandName)
            : product.brandName;
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.scan_action_title,
                            style: context.text.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            name,
                            style: context.text.bodyMedium?.copyWith(
                              color: context.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _ChoiceTile(
                icon: LucideIcons.eye,
                label: tr.scan_action_view,
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  context.push(AppRoutesKeys.productDetailWith(product.id));
                },
              ),
              _ChoiceTile(
                icon: LucideIcons.receipt,
                label: tr.scan_action_add_sale,
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  context.push(
                    AppRoutesKeys.salesInvoiceAdd,
                    extra: {'product': product},
                  );
                },
              ),
              _ChoiceTile(
                icon: LucideIcons.truck,
                label: tr.scan_action_add_purchase,
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  context.push(
                    AppRoutesKeys.invoiceAdd,
                    extra: {'product': product},
                  );
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String currentLanguage = Localizations.localeOf(context).languageCode;
    final String locale = (currentLanguage == 'ar') ? 'ar_EG' : currentLanguage;
    String formattedDate = DateFormat(
      'EEEE, d MMMM yyyy',
      locale,
    ).format(DateTime.now());
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "PHARMATECH",
              style: context.text.titleSmall?.copyWith(
                fontSize: 14,
                color: Colors.white.withAlpha(153),
              ),
            ),
            context.vSm,
            Text(
              formattedDate,
              style: context.text.titleSmall?.copyWith(
                fontSize: 14,
                color: Colors.white.withAlpha(200),
              ),
            ),
          ],
        ),
        Spacer(),
        // Scan icon — opens the barcode scan flow.
        GestureDetector(
          onTap: () => _onScanTapped(context),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(38),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              LucideIcons.scanLine,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        context.hSm,
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(38),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(LucideIcons.bell, color: Colors.white, size: 20),
              Positioned(
                top: -4,
                right: -5,
                child: Container(
                  width: 6.5,
                  height: 6.5,
                  decoration: BoxDecoration(
                    color: AppColors.cozyAmber,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: context.primary, size: 22),
      title: Text(label, style: context.text.bodyLarge),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: context.muted.withValues(alpha: 0.6),
      ),
      onTap: onTap,
    );
  }
}
