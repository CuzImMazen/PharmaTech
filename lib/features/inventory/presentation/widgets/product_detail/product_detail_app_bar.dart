import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

/// AppBar for the product detail screen.
///
/// - Leading: back arrow.
/// - Title: product brand name (bold) with a smaller subtitle below it
///   (scientific name, falling back to the category name).
/// - Actions: two circular icon buttons — edit (primary accent) and delete
///   (destructive red).
class ProductDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.onEdit,
    this.onDelete,
    this.onRestore,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  /// When non-null, the product is soft-deleted: a restore action replaces
  /// the edit/delete actions.
  final VoidCallback? onRestore;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.text.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            style: context.text.labelSmall?.copyWith(color: context.muted),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      actions: onRestore != null
          ? [
              _CircleActionButton(
                icon: Icons.restore_rounded,
                color: AppColors.primary,
                onTap: onRestore,
              ),
              SizedBox(width: context.sSm),
            ]
          : [
              _CircleActionButton(
                icon: Icons.edit_outlined,
                color: AppColors.primary,
                onTap: onEdit,
              ),
              context.hMd,
              _CircleActionButton(
                icon: Icons.delete_outline,
                color: AppColors.cozyRed,
                onTap: onDelete,
              ),
              SizedBox(width: context.sSm),
            ],
    );
  }
}

class _CircleActionButton extends StatelessWidget {
  const _CircleActionButton({
    required this.icon,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.mutedSurface,
      shape: CircleBorder(side: BorderSide(color: color.withAlpha(90))),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(context.sSm),
          child: Icon(icon, size: context.iSm, color: color),
        ),
      ),
    );
  }
}
