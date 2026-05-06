import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/bootstrap/app_state_notifier.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/login_screen.dart';
import 'package:pharmacy_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pharmacy_app/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  static late final GoRouter router;

  static void init(AppStateNotifier appStateNotifier) {
    router = GoRouter(
      initialLocation: AppRoutes.splash,
      refreshListenable: appStateNotifier,

      redirect: (context, state) {
        final app = appStateNotifier.state;
        final location = state.matchedLocation;

        // 1. Always block navigation until app is ready
        if (!appStateNotifier.ready || app == null) {
          return location == AppRoutes.splash ? null : AppRoutes.splash;
        }

        final bool onSplash = location == AppRoutes.splash;
        final bool onOnboarding = location == AppRoutes.onboarding;
        final bool onLogin = location == AppRoutes.login;

        // 2. Decide target route ONCE (single source of truth)
        String targetRoute;

        if (!app.onboardingSeen) {
          targetRoute = AppRoutes.onboarding;
        } else if (!app.isLoggedIn) {
          targetRoute = AppRoutes.login;
        } else {
          targetRoute = AppRoutes.home;
        }

        // 3. If we're on splash, move to correct destination
        if (onSplash) {
          return targetRoute;
        }

        // 4. Prevent visiting auth/onboarding screens when already past them
        if (app.isLoggedIn && (onLogin || onOnboarding)) {
          return AppRoutes.home;
        }

        if (!app.isLoggedIn && app.onboardingSeen && onOnboarding) {
          return AppRoutes.login;
        }

        // 5. Let valid states continue
        return null;
      },

      routes: [
        GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
      ],
    );
  }
}
