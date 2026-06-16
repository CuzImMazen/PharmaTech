import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

class NotificationRow extends StatelessWidget {
  const NotificationRow({super.key});

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
