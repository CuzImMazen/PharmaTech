import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/widgets/dot.dart';

class StockAlertItem extends StatelessWidget {
  const StockAlertItem({
    super.key,
    required this.name,
    required this.quantity,
    required this.type,
    this.onTap,
  });
  final String name;
  final String quantity;
  final StockAlertType type;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    String alertText;
    Color alertColor;

    switch (type) {
      case StockAlertType.critical:
        alertColor = AppColors.cozyAmber;
        alertText = context.tr.critical;
        break;
      case StockAlertType.out:
        alertColor = AppColors.cozyRed;
        alertText = context.tr.out;
        break;
      case StockAlertType.low:
        alertColor = AppColors.cozyEmerald;
        alertText = context.tr.low;
        break;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: context.rLg,
        child: Container(
          padding: const EdgeInsets.all(14.0),
          margin: const EdgeInsets.only(bottom: 14.0),
          decoration: BoxDecoration(
            border: Border.all(color: alertColor.withAlpha(60)),
            borderRadius: context.rLg,
            color: alertColor.withAlpha(25),
          ),
          child: Row(
            children: [
              Dot(color: alertColor),
              context.hMd,

              // 1. NAME
              Expanded(
                flex: 6,
                child: Text(
                  name,
                  style: context.text.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              context.hMd,

              // 2. QUANTITY
              Expanded(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    quantity,
                    style: context.text.bodyMedium,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),

              context.hMd,

              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: context.rMd,
                    color: alertColor.withAlpha(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      alertText,
                      style: context.text.labelSmall?.copyWith(
                        color: alertColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
