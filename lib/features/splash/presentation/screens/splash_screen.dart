import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/color/appcolors.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_helper.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/beaming_pulse.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/bouncing_pill.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/jumping_dots.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isOnboardingSeen = SharedPrefsHelper.getBool(
      PrefsKeys.isOnboardingSeen,
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      if (isOnboardingSeen) {
        context.go(AppRoutes.login);
      } else {
        context.go(AppRoutes.onboarding);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Background Container Gradient Color
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.splashGradient,
          ),
        ),
        child: Center(
          //Content of Splash Screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BouncingPill(),
              AppSpaces.vMd,
              BeamPulse(),
              AppSpaces.vMd,
              //Title (App Name)
              Text(
                'صيدليتي',
                style: context.text.headlineLarge!.copyWith(
                  color: context.colors.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpaces.vMd,
              //Subtitle
              Text(
                context.tr.splash_subtitle,
                style: context.text.bodyLarge!.copyWith(
                  color: context.colors.onPrimary,
                ),
              ),
              AppSpaces.vXl,
              JumpingDots(),
            ],
          ),
        ),
      ),
    );
  }
}
