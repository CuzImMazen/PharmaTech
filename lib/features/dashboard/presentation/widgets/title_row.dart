import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key, required this.title, required this.actionText});
  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(title, style: context.text.titleLarge),
            Spacer(),
            InkWell(
              splashColor: AppColors.primary.withAlpha(70),
              borderRadius: BorderRadius.circular(8),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      actionText,
                      style: context.text.labelMedium?.copyWith(
                        color: context.colors.primary,
                      ),
                    ),
                    context.hSm,
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.colors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
