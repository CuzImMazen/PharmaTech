import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/features/auth/cubit/login_cubit.dart';
import 'package:pharmacy_app/features/auth/data/models/email_sent_screen_data.dart';
import 'package:pharmacy_app/features/auth/data/models/register_details_model.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/email_sent_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/login_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/register_credentials_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/register_details_screen.dart';

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
        create: (context) => LoginCubit(),
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
      path: AppRoutesKeys.emailSent,
      builder: (context, state) =>
          EmailSentScreen(data: state.extra as EmailSentScreenData),
    ),

    GoRoute(
      path: AppRoutesKeys.forgetPassword,
      builder: (context, state) => ForgetPasswordScreen(),
    ),
  ];
}
