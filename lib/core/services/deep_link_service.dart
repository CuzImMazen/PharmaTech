import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';

class DeepLinkService {
  DeepLinkService(this._router);

  final GoRouter _router;
  final AppLinks _appLinks = AppLinks();

  StreamSubscription<Uri>? _subscription;

  Future<void> init() async {
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _handleUri(initialUri);
    }

    _subscription = _appLinks.uriLinkStream.listen((uri) {
      _handleUri(uri);
    });
  }

  void _handleUri(Uri uri) {
    if (uri.scheme != 'pharmacyapp') return;
    if (uri.host != 'reset-password') return;

    final token = uri.queryParameters['token'];
    final email = uri.queryParameters['email'];

    if (token == null || email == null) return;

    _router.go('/reset-password', extra: {'token': token, 'email': email});
  }

  void dispose() {
    _subscription?.cancel();
  }
}
