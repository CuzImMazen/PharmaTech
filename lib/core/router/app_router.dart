import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/app/app_state_notifier.dart';

class AppRouter {
  AppRouter._();

  static GoRouter? _router;

  static GoRouter get router {
    if (_router == null) {
      throw Exception(
        'AppRouter not initialized. Call AppRouter.init() in main first.',
      );
    }
    return _router!;
  }

  static void init(AppStateNotifier appStateNotifier) {
    _router = GoRouter(
      initialLocation: AppRoutesKeys.splash,
      refreshListenable: appStateNotifier,

      redirect: (context, state) {
        final uri = state.uri;
        final rawUriStr = uri.toString();

        String currentPath = uri.path;

        if (currentPath.endsWith('/') && currentPath.length > 1) {
          currentPath = currentPath.substring(0, currentPath.length - 1);
        }

        debugPrint("----------------------------------------");
        debugPrint("INCOMING URI PATH: $currentPath");
        debugPrint("FULL URI RECORDED: $rawUriStr");
        debugPrint("MATCHED LOCATION: ${state.matchedLocation}");
        debugPrint("----------------------------------------");

        final isInitialized = appStateNotifier.isInitialized;
        final isAuthenticated = appStateNotifier.isAuthenticated;
        final onboardingSeen = appStateNotifier.onboardingSeen;

        final isCustomScheme = uri.scheme == 'pharmacyapp';

        if (isCustomScheme && uri.host == 'email-verified') {
          return AppRoutesKeys.login;
        }

        if (isCustomScheme && uri.host == 'reset-password') {
          final token = uri.queryParameters['token'];
          final email = uri.queryParameters['email'];

          if (token == null || email == null) {
            return AppRoutesKeys.login;
          }

          final encodedToken = Uri.encodeComponent(token);
          final encodedEmail = Uri.encodeComponent(email);
          return '${AppRoutesKeys.resetPassword}?token=$encodedToken&email=$encodedEmail';
        }

        bool isOn(String route) =>
            currentPath == route || currentPath.startsWith('$route/');

        // -------------------------------------------------------------
        // ROUTES
        // -------------------------------------------------------------
        final isSplash = currentPath == AppRoutesKeys.splash;
        final isLogin = currentPath == AppRoutesKeys.login;
        final isOnboarding = currentPath == AppRoutesKeys.onboarding;

        final isResetPassword =
            currentPath == AppRoutesKeys.resetPassword ||
            rawUriStr.contains('reset-password');

        final isRegister =
            isOn(AppRoutesKeys.registerCredentials) ||
            isOn(AppRoutesKeys.registerDetails) ||
            isOn(AppRoutesKeys.verificationSent) ||
            isOn(AppRoutesKeys.resetPasswordSent) ||
            isOn(AppRoutesKeys.forgetPassword) ||
            isResetPassword;

        final isAuthRoute = isLogin || isRegister;

        // -------------------------------------------------------------
        // GATE 1: INIT
        // -------------------------------------------------------------
        if (!isInitialized) {
          return isSplash ? null : AppRoutesKeys.splash;
        }

        // -------------------------------------------------------------
        // GATE 2: ONBOARDING
        // -------------------------------------------------------------
        if (!onboardingSeen) {
          return isOnboarding ? null : AppRoutesKeys.onboarding;
        }

        // -------------------------------------------------------------
        // GATE 3: NOT AUTHENTICATED
        // -------------------------------------------------------------
        if (!isAuthenticated) {
          // Allow login to receive deep link navigation (via extra)
          if (state.extra is Map && (state.extra as Map).containsKey('type')) {
            return null;
          }

          if (isAuthRoute) return null;

          return AppRoutesKeys.login;
        }

        // -------------------------------------------------------------
        // GATE 4: AUTHENTICATED USERS
        // -------------------------------------------------------------
        if (isAuthenticated) {
          if (isLogin || isOnboarding || isSplash || isRegister) {
            return AppRoutesKeys.home;
          }
        }

        return null;
      },

      routes: AppRoutes.routes,
    );
  }
}
