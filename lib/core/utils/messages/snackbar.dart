import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/app/app_keys.dart';

class AppSnackbar {
  const AppSnackbar._();

  /// Generic snackbar.
  static void show({
    required String message,
    required Color color,
    Color backgroundColor = Colors.transparent,
    IconData? icon,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    final messenger = rootScaffoldMessengerKey.currentState;
    final context = rootScaffoldMessengerKey.currentContext;

    if (messenger == null || context == null) {
      return;
    }

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        elevation: 0,
        duration: duration,
        margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
        content: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withAlpha(150)
                    : Colors.white.withAlpha(200),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withAlpha(30)
                      : Colors.black.withAlpha(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    // Colored accent bar
                    Container(
                      width: 6,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Optional icon
                    if (icon != null) ...[
                      Icon(icon, color: color, size: 24),
                      const SizedBox(width: 12),
                    ],

                    // Title + message
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 4,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (title != null) ...[
                              Text(
                                title,
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: isDark ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                            ],
                            Text(
                              message,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: isDark ? Colors.white70 : Colors.black54,
                                fontWeight: title == null
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Close button
                    IconButton(
                      onPressed: messenger.hideCurrentSnackBar,
                      icon: Icon(
                        Icons.close,
                        size: 18,
                        color: isDark ? Colors.white38 : Colors.black26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Preconfigured success snackbar.
  static void success({
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      // title: title ?? 'Success',
      color: Colors.green,
      icon: LucideIcons.check,
      duration: duration,
    );
  }

  /// Preconfigured failure/error snackbar.
  static void failure({
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      //  title: title ?? 'Error',
      color: Colors.red,
      icon: LucideIcons.x,
      duration: duration,
    );
  }
}
