import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';

class DeepLinkService {
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
      _router.go(AppRoutesKeys.login);

      return;
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}
