import 'dart:async';
import 'package:flutter/material.dart'; // Needed for GlobalKey and SnackBar
import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';

class DeepLinkService {
  // Pass the ScaffoldMessenger key into the constructor
  DeepLinkService(this._router);

  final GoRouter _router;

  final AppLinks _appLinks = AppLinks();

  StreamSubscription<Uri>? _subscription;

  Future<void> init() async {
    // 🔥 IMPORTANT: delay handling initial link to avoid router crash
    final initialUri = await _appLinks.getInitialLink();

    if (initialUri != null) {
      Future.microtask(() {
        _handleUri(initialUri);
      });
    }

    _subscription = _appLinks.uriLinkStream.listen((uri) {
      _handleUri(uri);
    });
  }

  void _handleUri(Uri uri) {
    if (uri.scheme != 'pharmacyapp') return;

    if (uri.host == 'reset-password') {
      final token = uri.queryParameters['token'];
      final email = uri.queryParameters['email'];

      if (token == null || email == null) return;

      _router.go('/reset-password', extra: {'token': token, 'email': email});

      return;
    }

    if (uri.host == 'email-verified') {
      // 1. Route the user to the login screen
      _router.go(AppRoutesKeys.login);

      final context = _router.routerDelegate.navigatorKey.currentContext;

      Snackbar.show(
        context: context!,
        message: context.tr.email_verification_success,
        color: Colors.green,
        icon: LucideIcons.check,
      );

      return;
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}
