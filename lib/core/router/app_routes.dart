import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/features/auth/cubit/forget_password_cubit.dart';
import 'package:pharmacy_app/features/auth/cubit/login_cubit.dart';
import 'package:pharmacy_app/features/auth/cubit/reset_password_cubit.dart';
import 'package:pharmacy_app/features/auth/data/models/register_details_model.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/login_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/password_reset_sent_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/register_credentials_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/register_details_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/verification_sent_screen.dart';

import 'package:pharmacy_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pharmacy_app/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutesKeys.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutesKeys.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRoutesKeys.login,
      builder: (context, state) => BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(authRepository: sl(), tokenStore: sl()),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutesKeys.registerCredentials,
      builder: (context, state) {
        state.extra;
        return RegisterCredentialsScreen(
          registerDetailsModel: state.extra as RegisterDetailsModel,
        );
      },
    ),
    GoRoute(
      path: AppRoutesKeys.registerDetails,
      builder: (context, state) => const RegisterDetailsScreen(),
    ),

    GoRoute(
      path: AppRoutesKeys.forgetPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => ForgetPasswordCubit(authRepository: sl()),
        child: ForgetPasswordScreen(),
      ),
    ),

    GoRoute(
      path: AppRoutesKeys.resetPassword,
      // -------------------------------------------------------------
      // ROUTE GATING: Block entry if token or email are missing
      // -------------------------------------------------------------
      redirect: (context, state) {
        String? token;
        String? email;

        if (state.extra != null && state.extra is Map<String, String>) {
          final data = state.extra as Map<String, String>;
          token = data['token'];
          email = data['email'];
        } else {
          token = state.uri.queryParameters['token'];
          email = state.uri.queryParameters['email'];
        }

        // If either the token or email is null, completely empty, or whitespace, bounce them to login
        if (token == null ||
            token.trim().isEmpty ||
            email == null ||
            email.trim().isEmpty) {
          debugPrint(
            "⛔ ACCESS DENIED: Missing token or email. Redirecting to login.",
          );
          return AppRoutesKeys.login;
        }

        return null; // Token and email are valid, proceed to the page
      },

      // -------------------------------------------------------------
      // BUILDER: Safe to assume tokens exist because of the redirect above
      // -------------------------------------------------------------
      builder: (context, state) {
        String? token;
        String? email;

        if (state.extra != null && state.extra is Map<String, String>) {
          final data = state.extra as Map<String, String>;
          token = data['token'];
          email = data['email'];
        } else {
          token = state.uri.queryParameters['token'];
          email = state.uri.queryParameters['email'];
        }

        return BlocProvider(
          create: (context) => ResetPasswordCubit(authRepository: sl()),
          child: ResetPasswordScreen(token: token!, email: email!),
        );
      },
    ),

    GoRoute(
      path: AppRoutesKeys.verificationSent,
      builder: (context, state) {
        final email = state.extra as String;
        return VerificationSentScreen(email: email);
      },
    ),
    GoRoute(
      path: AppRoutesKeys.resetPasswordSent,
      builder: (context, state) {
        final email = state.extra as String;
        return PasswordResetSentScreen(email: email);
      },
    ),
  ];
}
