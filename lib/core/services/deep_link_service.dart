import 'dart:async';
// Needed for GlobalKey and SnackBar
import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/app/app_keys.dart';
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
      // 1. Extract the token and email from the query parameters
      final token = uri.queryParameters['token'];
      final email = uri.queryParameters['email'];

      if (token == null || email == null) return;
      // 2. Route the user to the reset password screen with the token and email as parameters
      _router.go('/reset-password', extra: {'token': token, 'email': email});

      return;
    }

    if (uri.host == 'email-verified') {
      // 1. Route the user to the login screen

      _router.go(AppRoutesKeys.login);

      // 2. Show snackbar
      AppSnackbar.success(
        message: rootScaffoldMessengerKey
            .currentContext!
            .tr
            .email_verification_success,
      );

      return;
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}
