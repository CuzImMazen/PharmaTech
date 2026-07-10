import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/detail_key_value_row.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/detail_section_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/detail_status_badge.dart';

/// Tab 1 — Overview: a status badge at the top-trailing edge followed by
/// three section cards (Product Information, Pricing, Inventory).
class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key, required this.product});

  final ProductDetailModel product;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final na = tr.detail_not_available;
    final status = product.computedStatus;

    return ListView(
      padding: context.pScreen,
      children: [
        // Header: name (start) + status badge (trailing). Using a Row with the
        // badge in the trailing slot mirrors correctly in RTL.
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brandName,
                    style: context.text.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (product.arName != null && product.arName!.isNotEmpty)
                    Text(
                      product.arName!,
                      style: context.text.bodyMedium?.copyWith(
                        color: context.muted,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        // Status badge aligned to the trailing edge on its own line for
        // predictable RTL behavior.
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: DetailStatusBadge(status: status),
        ),
        context.vLg,

        DetailSectionCard(
          icon: Icons.medication_outlined,
          title: tr.detail_section_product_info,
          children: [
            DetailKeyValueRow(
              label: tr.detail_barcode,
              value: product.barcode,
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_scientific_name,
              value: product.scientificName ?? na,
            ),
            DetailKeyValueRow(
              label: tr.detail_strength,
              value: product.strength ?? na,
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_company,
              value: product.company?.name ?? na,
            ),
            DetailKeyValueRow(
              label: tr.detail_category,
              value: product.category.name,
            ),
            DetailKeyValueRow(
              label: tr.detail_shelf,
              value: product.shelf ?? na,
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_prescription,
              value: product.prescriptionRequired
                  ? tr.detail_yes
                  : tr.detail_no,
            ),
          ],
        ),
        context.vLg,

        DetailSectionCard(
          icon: Icons.payments_outlined,
          title: tr.detail_section_pricing,
          children: [
            DetailKeyValueRow(
              label: tr.detail_buying_price,
              value: '${product.buyingPrice} ${tr.sp}',
              accent: false,
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_selling_price,
              value: '${product.sellingPrice} ${tr.sp}',
              accent: true,
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_tax,
              value: '${product.taxRate}%',
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_discount,
              value: '${product.discountRate}%',
              ltrValue: true,
            ),
          ],
        ),
        context.vLg,

        DetailSectionCard(
          icon: Icons.inventory_2_outlined,
          title: tr.detail_section_inventory,
          children: [
            DetailKeyValueRow(
              label: tr.detail_total_quantity,
              value:
                  '${product.totalQuantity} ${product.baseUnit?.name ?? ''}'.trim(),
              accent: true,
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_min_stock,
              value: '${product.minStock}',
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_units_per_base,
              value: '${product.unitsPerBase}',
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_nearest_expiry,
              value: product.nearestExpiry ?? na,
              ltrValue: true,
            ),
            DetailKeyValueRow(
              label: tr.detail_allow_partial_selling,
              value: product.allowPartialSelling
                  ? tr.detail_yes
                  : tr.detail_no,
            ),
          ],
        ),
        context.vLg,
      ],
    );
  }
}
