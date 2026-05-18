import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

/// Reusable row for prompts like:
/// - "Don't have an account? Create account"
/// - "Already have an account? Sign in"
/// - "Forgot your password? Reset password"
class AuthPromptRow extends StatelessWidget {
  const AuthPromptRow({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onPressed,
  });

  /// Static text shown before the action.
  final String promptText;

  /// Clickable action text.
  final String actionText;

  /// Callback executed when the action text is tapped.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$promptText ',
          style: context.text.bodyMedium!.copyWith(color: context.muted),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            actionText,
            style: context.text.bodyMedium!.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
