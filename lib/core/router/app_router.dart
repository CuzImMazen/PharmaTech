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
      initialLocation: AppRoutesKeys.resetPassword,
      refreshListenable: appStateNotifier,

      redirect: (context, state) {
        final isInitialized = appStateNotifier.isInitialized;
        final isAuthenticated = appStateNotifier.isAuthenticated;
        final onboardingSeen = appStateNotifier.onboardingSeen;

        final location = state.matchedLocation;

        debugPrint("LOCATION: $location");

        bool isOn(String route) => location.startsWith(route);

        // -----------------------------
        // ROUTES GROUPING (IMPORTANT FIX)
        // -----------------------------
        final isSplash = isOn(AppRoutesKeys.splash);
        final isLogin = isOn(AppRoutesKeys.login);
        final isOnboarding = isOn(AppRoutesKeys.onboarding);

        final isRegister =
            isOn(AppRoutesKeys.registerCredentials) ||
            isOn(AppRoutesKeys.registerDetails) ||
            isOn(AppRoutesKeys.verificationSent) ||
            isOn(AppRoutesKeys.resetPasswordSent) ||
            isOn(AppRoutesKeys.forgetPassword) ||
            isOn(AppRoutesKeys.resetPassword);

        final isAuthRoute = isLogin || isRegister;

        // -----------------------------
        // GATE 1: INITIALIZATION
        // -----------------------------
        if (!isInitialized) {
          return isSplash ? null : AppRoutesKeys.splash;
        }

        // -----------------------------
        // GATE 2: ONBOARDING
        // -----------------------------
        if (!onboardingSeen) {
          return isOnboarding ? null : AppRoutesKeys.onboarding;
        }

        // -----------------------------
        // GATE 3: NOT AUTHENTICATED
        // -----------------------------
        if (!isAuthenticated) {
          return isAuthRoute ? null : AppRoutesKeys.login;
        }

        // -----------------------------
        // GATE 4: AUTHENTICATED USERS
        // -----------------------------
        if (isAuthenticated) {
          if (isLogin || isOnboarding || isSplash) {
            return AppRoutesKeys.home;
          }
        }

        return null;
      },
      routes: AppRoutes.routes,
    );
  }
}
