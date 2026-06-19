import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';

// Cubits
import 'package:pharmacy_app/features/authentication/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/email_verification/resend_email_verification_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/forget_password_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/login/login_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/resend_reset_password_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/reset_password_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/register/register_cubit.dart';

// Models
import 'package:pharmacy_app/features/authentication/data/models/login/deep_link_data_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/register/register_details_model.dart';

// Screens
import 'package:pharmacy_app/features/authentication/presentation/screens/complete_profile/complete_profile_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/password_recovery/forget_password_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/password_recovery/password_reset_sent_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/register/register_credentials_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/register/register_details_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/password_recovery/reset_password_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/email_verification/email_verification_sent_screen.dart';
import 'package:pharmacy_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:pharmacy_app/features/inventory/presentation/screens/inventory_screen.dart';
import 'package:pharmacy_app/features/layout/presentation/screen/layout_screen.dart';
import 'package:pharmacy_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pharmacy_app/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static final List<RouteBase> routes = [
    // =========================================================================
    // 1. INITIALIZATION & ONBOARDING ROUTES
    // =========================================================================
    GoRoute(
      path: AppRoutesKeys.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: AppRoutesKeys.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),

    // =========================================================================
    // 2. AUTHENTICATION GATES & ACCOUNT RECOVERY
    // =========================================================================
    GoRoute(
      path: AppRoutesKeys.login,
      builder: (context, state) {
        final status = state.uri.queryParameters['status'];
        final email = state.uri.queryParameters['email'];
        final t = state.uri.queryParameters['t'];

        final deepLinkData = DeepLinkData(
          status: status,
          email: email,
          timeStamp: t,
        );

        return BlocProvider(
          create: (context) => LoginCubit(
            authRepository: sl(),
            tokenStore: sl(),
            googleAuthService: sl(),
          ),
          child: LoginScreen(deepLinkData: deepLinkData),
        );
      },
    ),

    GoRoute(
      path: AppRoutesKeys.registerDetails,
      builder: (context, state) => const RegisterDetailsScreen(),
    ),

    GoRoute(
      path: AppRoutesKeys.registerCredentials,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => RegisterCubit(authRepository: sl()),
          child: RegisterCredentialsScreen(
            registerDetailsModel: state.extra as RegisterDetailsModel,
          ),
        );
      },
    ),

    GoRoute(
      path: AppRoutesKeys.completeProfile,
      builder: (context, state) {
        final args = state.extra as Map<String?, String?>?;
        final firstName = args?['firstName'];
        final lastName = args?['lastName'];

        return BlocProvider(
          create: (context) => CompleteProfileCubit(authRepository: sl()),
          child: CompleteProfileScreen(
            firstName: firstName,
            lastName: lastName,
          ),
        );
      },
    ),

    GoRoute(
      path: AppRoutesKeys.verificationSent,
      builder: (context, state) {
        final email = state.extra as String;
        return BlocProvider(
          create: (context) =>
              ResendEmailVerificationCubit(authRepository: sl()),
          child: VerificationSentScreen(email: email),
        );
      },
    ),

    // =========================================================================
    // 3. PASSWORD RECOVERY ROUTES
    // =========================================================================
    GoRoute(
      path: AppRoutesKeys.forgetPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => ForgetPasswordCubit(authRepository: sl()),
        child: const ForgetPasswordScreen(),
      ),
    ),

    GoRoute(
      path: AppRoutesKeys.resetPassword,
      redirect: (context, state) {
        final token = state.uri.queryParameters['token'];
        final email = state.uri.queryParameters['email'];

        // Guard against direct deep-link access with missing tokens
        if (token == null ||
            token.trim().isEmpty ||
            email == null ||
            email.trim().isEmpty) {
          return AppRoutesKeys.login;
        }
        return null;
      },
      builder: (context, state) {
        final token = state.uri.queryParameters['token']!;
        final email = state.uri.queryParameters['email']!;

        return BlocProvider(
          create: (context) => ResetPasswordCubit(authRepository: sl()),
          child: ResetPasswordScreen(token: token, email: email),
        );
      },
    ),

    GoRoute(
      path: AppRoutesKeys.resetPasswordSent,
      builder: (context, state) {
        final email = state.extra as String;
        return BlocProvider(
          create: (context) => ResendResetPasswordCubit(authRepository: sl()),
          child: PasswordResetSentScreen(email: email),
        );
      },
    ),

    // =========================================================================
    // 4. MAIN APPLICATION CORE (PERSISTENT NAV BAR SHELL)
    // =========================================================================
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // LayoutScreen wraps the persistent bottom navigation bar frame
        return LayoutScreen(navigationShell: navigationShell);
      },
      branches: [
        // --- Branch 1: Dashboard Tab ---
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesKeys.dashboard,
              builder: (context, state) => DashboardScreen(),
              routes: const [
                // Add nested routes for the Home tab here if needed
              ],
            ),
          ],
        ),

        // --- Branch 2: Inventory Tab ---
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesKeys.inventory,
              builder: (context, state) => InventoryScreen(),
              routes: const [
                // Add nested routes for the Inventory tab here if needed
              ],
            ),
          ],
        ),

        // --- Branch 3: Sales Tab ---
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesKeys.sales,
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Sales Screen'))),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesKeys.reports,
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Reports Screen'))),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesKeys.settings,
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Settings Screen'))),
            ),
          ],
        ),
      ],
    ),
  ];
}
