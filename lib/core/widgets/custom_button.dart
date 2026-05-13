import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    this.text,
    this.child,
    this.height,
  }) : assert(
         text != null || child != null,
         'Either text or child must be provided.',
       ),
       assert(
         !(text != null && child != null),
         'Provide either text or child, not both.',
       );

  final VoidCallback? onTap;
  final String? text;
  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return SizedBox(
      width: double.infinity,
      height: height ?? context.btnLg,
      child: ElevatedButton(
        onPressed: onTap,
        style:
            ElevatedButton.styleFrom(
              elevation: isDisabled ? 0 : 4,
              shape: RoundedRectangleBorder(borderRadius: context.rXl),
              padding: EdgeInsets.zero,
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return context.colors.primary.withValues(alpha: 0.4);
                }
                return Colors.transparent;
              }),
              shadowColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.transparent;
                }
                return context.colors.primary.withValues(alpha: 0.3);
              }),
            ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: context.rXl,
            gradient: isDisabled
                ? null
                : LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      context.colors.primary,
                      context.colors.primary.withValues(alpha: 0.85),
                    ],
                  ),
          ),
          child: Center(
            child:
                child ??
                Text(
                  text!,
                  style: context.text.labelLarge?.copyWith(
                    color: context.colors.onPrimary,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
