import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';

/// A single supplier row in the Suppliers list. Mirrors the app's card style
/// (16-radius bordered `surfaceContainer` + `pAllMd`): name + company pill,
/// a contact line (phone/email with icons), and an action row — edit + delete
/// normally, or a single Restore action when the supplier is soft-deleted.
class SupplierCard extends StatelessWidget {
  const SupplierCard({
    super.key,
    required this.supplier,
    required this.isMutating,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.onRestore,
  });

  final SupplierModel supplier;
  final bool isMutating;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onRestore;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final deleted = supplier.isDeleted;

    return GestureDetector(
      onTap: deleted ? null : onTap,
      child: Container(
        padding: context.pAllMd,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1.5,
            color: context.colors.outline.withAlpha(deleted ? 100 : 170),
          ),
          color: context.colors.surfaceContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: name (left) + status pill (right).
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    supplier.name,
                    style: context.text.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: deleted ? TextDecoration.lineThrough : null,
                      color: deleted ? context.muted : null,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (supplier.company != null) ...[
                  context.hSm,
                  _CompanyPill(label: supplier.company!.name),
                ],
              ],
            ),
            if (supplier.phone != null || supplier.email != null) ...[
              context.vMd,
              _ContactLine(phone: supplier.phone, email: supplier.email),
            ],
            if (supplier.address != null && supplier.address!.isNotEmpty) ...[
              context.vSm,
              _IconText(
                icon: Icons.location_on_outlined,
                text: supplier.address!,
              ),
            ],
            context.vMd,
            // Action row.
            if (deleted)
              _RestoreAction(
                isMutating: isMutating,
                label: tr.supplier_restore,
                onTap: onRestore,
              )
            else
              Row(
                children: [
                  _IconAction(
                    icon: Icons.edit_outlined,
                    color: context.primary,
                    isMutating: false,
                    onTap: onEdit,
                  ),
                  context.hSm,
                  _IconAction(
                    icon: Icons.delete_outline,
                    color: context.colors.error,
                    isMutating: isMutating,
                    onTap: onDelete,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _CompanyPill extends StatelessWidget {
  const _CompanyPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: context.rMd,
        color: context.primary.withAlpha(25),
        border: Border.all(color: context.primary.withAlpha(60), width: 1),
      ),
      child: Text(
        label,
        style: context.text.labelSmall?.copyWith(
          color: context.primary,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  const _ContactLine({this.phone, this.email});

  final String? phone;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: context.sMd,
      runSpacing: context.sXs,
      children: [
        if (phone != null && phone!.isNotEmpty)
          _IconText(icon: Icons.phone_outlined, text: phone!),
        if (email != null && email!.isNotEmpty)
          _IconText(icon: Icons.mail_outline, text: email!),
      ],
    );
  }
}

class _IconText extends StatelessWidget {
  const _IconText({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: context.iSm, color: context.muted),
        SizedBox(width: context.sXs),
        Flexible(
          child: Text(
            text,
            style: context.text.bodySmall?.copyWith(color: context.muted),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _IconAction extends StatelessWidget {
  const _IconAction({
    required this.icon,
    required this.color,
    required this.isMutating,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final bool isMutating;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.iLg,
      height: context.iLg,
      child: Material(
        color: color.withAlpha(20),
        shape: RoundedRectangleBorder(borderRadius: context.rMd),
        child: InkWell(
          borderRadius: context.rMd,
          onTap: isMutating ? null : onTap,
          child: isMutating
              ? Padding(
                  padding: EdgeInsets.all(context.sSm),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: color,
                  ),
                )
              : Icon(icon, size: context.iSm, color: color),
        ),
      ),
    );
  }
}

class _RestoreAction extends StatelessWidget {
  const _RestoreAction({
    required this.isMutating,
    required this.label,
    required this.onTap,
  });

  final bool isMutating;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _IconAction(
          icon: Icons.restore_rounded,
          color: context.primary,
          isMutating: isMutating,
          onTap: onTap,
        ),
        context.hSm,
        Text(
          label,
          style: context.text.labelLarge?.copyWith(
            color: context.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
