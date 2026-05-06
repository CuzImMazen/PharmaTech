import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/bootstrap/app_state_notifier.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/login_screen.dart';
import 'package:pharmacy_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pharmacy_app/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static late final GoRouter router;

  static void init(AppStateNotifier appStateNotifier) {
    router = GoRouter(
      initialLocation: AppRoutes.splash,
      refreshListenable: appStateNotifier,

      redirect: (context, state) {
        final bool isReady = appStateNotifier.ready;
        final location = state.matchedLocation;

        final bool onSplash = location == AppRoutes.splash;
        final bool onLogin = location == AppRoutes.login;
        final bool onOnboarding = location == AppRoutes.onboarding;

        // 1. Block everything until app is ready
        if (!isReady) {
          return onSplash ? null : AppRoutes.splash;
        }

        final app = appStateNotifier.state!;

        // 2. Handle leaving splash (single entry decision)
        if (onSplash) {
          if (!app.onboardingSeen) return AppRoutes.onboarding;
          if (!app.isLoggedIn) return AppRoutes.login;
          return AppRoutes.home;
        }

        // 3. Enforce onboarding (cannot skip)
        if (!app.onboardingSeen) {
          return onOnboarding ? null : AppRoutes.onboarding;
        }

        // 4. Enforce authentication
        if (!app.isLoggedIn) {
          return onLogin ? null : AppRoutes.login;
        }

        // 5. Prevent going back to auth/onboarding after login
        if (app.isLoggedIn && (onLogin || onOnboarding)) {
          return AppRoutes.home;
        }

        // 6. Allow everything else
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

        // GoRoute(
        //   path: AppRoutes.home,
        //   builder: (context, state) => const HomeScreen(),
        // ),
      ],
    );
  }
}
