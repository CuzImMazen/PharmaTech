import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/features/authentication/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/email_verification/resend_email_verification_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/forget_password_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/login/login_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/resend_reset_password_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/reset_password_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/register/register_cubit.dart';
import 'package:pharmacy_app/features/authentication/data/models/login/deep_link_data_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/register/register_details_model.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/complete_profile/complete_profile_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/password_recovery/forget_password_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/password_recovery/password_reset_sent_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/register/register_credentials_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/register/register_details_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/password_recovery/reset_password_screen.dart';
import 'package:pharmacy_app/features/authentication/presentation/screens/email_verification/email_verification_sent_screen.dart';

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
      path: AppRoutesKeys.registerCredentials,
      builder: (context, state) {
        state.extra;
        return BlocProvider(
          create: (context) => RegisterCubit(authRepository: sl()),
          child: RegisterCredentialsScreen(
            registerDetailsModel: state.extra as RegisterDetailsModel,
          ),
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

      redirect: (context, state) {
        final token = state.uri.queryParameters['token'];

        final email = state.uri.queryParameters['email'];

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
  ];
}
