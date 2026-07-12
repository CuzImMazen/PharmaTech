import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';

/// A single customer row in the Customers list. Mirrors the app's card style
/// (16-radius bordered `surfaceContainer` + `pAllMd`): name, an optional phone
/// line, optional notes, and an action row — edit + delete normally, or a
/// single Restore action when the customer is soft-deleted.
class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.customer,
    required this.isMutating,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.onRestore,
  });

  final CustomerModel customer;
  final bool isMutating;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onRestore;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final deleted = customer.isDeleted;

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
                    customer.fullName,
                    style: context.text.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: deleted ? TextDecoration.lineThrough : null,
                      color: deleted ? context.muted : null,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (customer.phone != null && customer.phone!.isNotEmpty) ...[
              context.vSm,
              _IconText(icon: Icons.phone_outlined, text: customer.phone!),
            ],
            if (customer.notes != null && customer.notes!.isNotEmpty) ...[
              context.vSm,
              _IconText(
                icon: Icons.notes_outlined,
                text: customer.notes!,
                maxLines: 2,
              ),
            ],
            context.vMd,
            // Action row.
            if (deleted)
              _RestoreAction(
                isMutating: isMutating,
                label: tr.customer_restore,
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

class _IconText extends StatelessWidget {
  const _IconText({required this.icon, required this.text, this.maxLines = 1});

  final IconData icon;
  final String text;
  final int maxLines;

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
            maxLines: maxLines,
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
