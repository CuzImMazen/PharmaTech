import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/app/app_state_notifier.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';

class AppRouter {
  AppRouter._();

  static GoRouter? _router;

  static GoRouter get router {
    if (_router == null) {
      throw Exception(
        'AppRouter not initialized. Call AppRouter.init() first.',
      );
    }

    return _router!;
  }

  static void init(AppStateNotifier appStateNotifier) {
    _router = GoRouter(
      debugLogDiagnostics: true,

      refreshListenable: appStateNotifier,

      redirect: (context, state) {
        final uri = state.uri;

        String currentPath = uri.path;

        if (currentPath.endsWith('/') && currentPath.length > 1) {
          currentPath = currentPath.substring(0, currentPath.length - 1);
        }

        debugPrint('----------------------------------------');
        debugPrint('FULL URI: ${uri.toString()}');
        debugPrint('PATH: $currentPath');
        debugPrint('SCHEME: ${uri.scheme}');
        debugPrint('HOST: ${uri.host}');
        debugPrint('----------------------------------------');

        final isInitialized = appStateNotifier.isInitialized;
        final isAuthenticated = appStateNotifier.isAuthenticated;
        final onboardingSeen = appStateNotifier.onboardingSeen;

        // =========================================================
        // DEEP LINKS
        // =========================================================

        final isCustomScheme = uri.scheme == 'pharmatech';

        if (isCustomScheme && uri.host == 'email-verified') {
          final status = uri.queryParameters['status'];

          return Uri(
            path: AppRoutesKeys.login,
            queryParameters: {'verified': status},
          ).toString();
        }

        if (isCustomScheme && uri.host == 'reset-password') {
          final token = uri.queryParameters['token'];
          final email = uri.queryParameters['email'];

          if (token == null ||
              token.trim().isEmpty ||
              email == null ||
              email.trim().isEmpty) {
            return AppRoutesKeys.login;
          }

          return Uri(
            path: AppRoutesKeys.resetPassword,
            queryParameters: {'token': token, 'email': email},
          ).toString();
        }

        // =========================================================
        // ROUTE HELPERS
        // =========================================================

        bool isOn(String route) =>
            currentPath == route || currentPath.startsWith('$route/');

        final isSplash = currentPath == AppRoutesKeys.splash;

        final isLogin = currentPath == AppRoutesKeys.login;

        final isOnboarding = currentPath == AppRoutesKeys.onboarding;

        final isResetPassword = currentPath == AppRoutesKeys.resetPassword;

        final isRegister =
            isOn(AppRoutesKeys.registerCredentials) ||
            isOn(AppRoutesKeys.registerDetails) ||
            isOn(AppRoutesKeys.verificationSent) ||
            isOn(AppRoutesKeys.resetPasswordSent) ||
            isOn(AppRoutesKeys.forgetPassword) ||
            isOn(AppRoutesKeys.completeProfile) ||
            isResetPassword;

        final isAuthRoute = isLogin || isRegister;

        // =========================================================
        // GATE 1 — INITIALIZATION
        // =========================================================

        if (!isInitialized) {
          // Check if the current state contains our deep link params
          final comingFromDeepLink =
              uri.queryParameters.containsKey('verified') ||
              uri.queryParameters.containsKey('token');

          // Dont Show Splash
          if (comingFromDeepLink) {
            return null;
          }

          // Normal cold boot (no deep link) -> go to splash
          return isSplash ? null : AppRoutesKeys.splash;
        }

        // =========================================================
        // GATE 2 — ONBOARDING
        // =========================================================

        if (!onboardingSeen) {
          return isOnboarding ? null : AppRoutesKeys.onboarding;
        }
        // =========================================================
        // GATE 3 — NOT AUTHENTICATED
        // =========================================================

        if (!isAuthenticated) {
          if (isAuthRoute) {
            return null;
          }

          return AppRoutesKeys.login;
        }

        // =========================================================
        // GATE 4 — AUTHENTICATED USERS
        // =========================================================

        if (isAuthenticated) {
          if (isSplash || isLogin || isOnboarding || isRegister) {
            return AppRoutesKeys.home;
          }
        }

        return null;
      },

      routes: AppRoutes.routes,
    );
  }
}
