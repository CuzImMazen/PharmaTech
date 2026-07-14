import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  final String infoValue;
  final String infoLabel;

  final Color color;
  final bool showArrow;
  final bool isPositiveTrend;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.infoValue,
    required this.infoLabel,
    required this.color,
    this.showArrow = false,
    this.isPositiveTrend = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withAlpha(38), color.withAlpha(13)],
        ),
        borderRadius: context.rLg,
        border: Border.all(color: color.withAlpha(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: context.iMd, color: color),
              ),
              context.vSm,
              Text(
                value,
                style: context.text.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              context.vXs,
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.bodyMedium?.copyWith(
                    color: context.colors.onSurface.withAlpha(140),
                  ),
                ),
              ),
            ],
          ),

          context.vSm,

          Row(
            children: [
              if (showArrow)
                Icon(
                  isPositiveTrend
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_downward_rounded,
                  size: 14,
                  color: color,
                ),

              if (showArrow) const SizedBox(width: 4),

              Text(
                infoValue,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),

              const SizedBox(width: 4),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  infoLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
