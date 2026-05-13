import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  }) : assert(currentStep >= 1),
       assert(totalSteps >= 1),
       assert(currentStep <= totalSteps);

  /// 1-based active step index.
  final int currentStep;

  /// Total number of steps.
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: context.pHorizontal,
        child: Row(
          children: List.generate(totalSteps, (index) {
            final isActive = index < currentStep;

            return Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  end: index == totalSteps - 1 ? 0 : 8,
                ),
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: isActive
                        ? context.colors.primary
                        : context.muted.withAlpha(75),
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
