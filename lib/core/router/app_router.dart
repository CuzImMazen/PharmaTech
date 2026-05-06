import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/state/app_state_notifier.dart';

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
        debugPrint(
          "3. GoRouter Redirect triggered. OnboardingSeen: ${appStateNotifier.onboardingSeen}",
        );
        // 1. Get the current status from the Notifier
        final bool isInitialized = appStateNotifier.isInitialized;
        final bool isAuthenticated = appStateNotifier.isAuthenticated;
        final bool onboardingSeen = appStateNotifier.onboardingSeen;

        // 2. Get the current location
        final String currentLocation = state.matchedLocation;

        // Helpers to check where we are
        final bool onSplash = currentLocation == AppRoutesKeys.splash;
        final bool onLogin = currentLocation == AppRoutesKeys.login;
        final bool onOnboarding = currentLocation == AppRoutesKeys.onboarding;

        // --- GATE 1: INITIALIZATION ---
        // If we haven't checked storage/auth yet, stay on Splash
        if (!isInitialized) {
          return onSplash ? null : AppRoutesKeys.splash;
        }

        // --- GATE 2: ONBOARDING ---
        // If onboarding isn't done, force them there
        if (!onboardingSeen) {
          return onOnboarding ? null : AppRoutesKeys.onboarding;
        }

        // --- GATE 3: AUTHENTICATION ---
        // If not logged in, they must go to Login
        // (Unless they are already on Login or Onboarding)
        if (!isAuthenticated) {
          // If we are on Login, stay there.
          if (onLogin) return null;

          // If we are on Onboarding but we've already seen it
          // or if we are anywhere else (like Splash), go to Login!
          return AppRoutesKeys.login;
        }

        // --- GATE 4: AUTHENTICATED USERS ---
        // If they ARE logged in, don't let them see Login, Onboarding, or Splash
        if (isAuthenticated) {
          if (onLogin || onOnboarding || onSplash) {
            return AppRoutesKeys.home;
          }
        }

        // No redirect needed, let them go to their intended destination
        return null;
      },

      routes: AppRoutes.routes,
    );
  }
}
