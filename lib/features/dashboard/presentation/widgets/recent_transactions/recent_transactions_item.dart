import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

class RecentTransactionsItem extends StatelessWidget {
  const RecentTransactionsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          //Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(26),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                LucideIcons.shoppingBag,
                size: context.iXs,
                color: AppColors.primary,
              ),
            ),
          ),
          //Name
          context.hMd,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transaction Name', style: context.text.titleSmall),
              context.vXs,
              Text('Transaction Description', style: context.text.bodySmall),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('265 SP', style: context.text.titleSmall),
              context.vXs,
              Text('45m ago', style: context.text.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
