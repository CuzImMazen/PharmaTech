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
        final String rawUriStr = state.uri.toString();

        // Extract the path segment safely without query parameters
        String currentPath = state.uri.path;

        // Remove trailing slashes if present
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

        // Helper to match nested/sub-routes safely
        bool isOn(String route) =>
            currentPath == route || currentPath.startsWith('$route/');

        // -------------------------------------------------------------
        // ROUTES GROUPING
        // -------------------------------------------------------------
        final isSplash = currentPath == AppRoutesKeys.splash;
        final isLogin = currentPath == AppRoutesKeys.login;
        final isOnboarding = currentPath == AppRoutesKeys.onboarding;

        // CRITICAL FIX: If the raw text contains 'reset-password', it IS the reset route,
        // no matter how badly Dart's URI parser gets confused by host vs path slashes.
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
        // NAVIGATION GATES
        // -------------------------------------------------------------

        // GATE 1: INITIALIZATION
        if (!isInitialized) {
          // If we are on a reset link, force GoRouter to stick to the clean path
          // version with parameters, passing it safely through the initialization phase.
          if (isResetPassword) {
            return Uri(
              path: AppRoutesKeys.resetPassword,
              queryParameters: state.uri.queryParameters,
            ).toString();
          }
          return isSplash ? null : AppRoutesKeys.splash;
        }

        // GATE 2: ONBOARDING
        if (!onboardingSeen) {
          return isOnboarding ? null : AppRoutesKeys.onboarding;
        }

        // GATE 3: NOT AUTHENTICATED
        if (!isAuthenticated) {
          // If the parser misread the link as '/' on the second pass, but we know it's a
          // reset link via the raw string, explicitly redirect them to the proper path.
          if (isResetPassword && currentPath != AppRoutesKeys.resetPassword) {
            return Uri(
              path: AppRoutesKeys.resetPassword,
              queryParameters: state.uri.queryParameters,
            ).toString();
          }
          return isAuthRoute ? null : AppRoutesKeys.login;
        }

        // GATE 4: AUTHENTICATED USERS
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
