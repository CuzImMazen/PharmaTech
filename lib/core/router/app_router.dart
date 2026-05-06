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

        // 🔥 1. WAIT until app is ready → show splash
        if (!appStateNotifier.ready) {
          return AppRoutes.splash;
        }

        if (app == null) return AppRoutes.splash;

        // 🔥 2. onboarding FIRST priority
        if (!app.onboardingSeen && location != AppRoutes.onboarding) {
          return AppRoutes.onboarding;
        }

        // 🔥 3. auth check
        if (!app.isLoggedIn &&
            location != AppRoutes.login &&
            location != AppRoutes.onboarding) {
          return AppRoutes.login;
        }

        // 🔥 4. prevent splash revisit
        if (location == AppRoutes.splash) {
          return app.isLoggedIn ? AppRoutes.home : AppRoutes.login;
        }

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
