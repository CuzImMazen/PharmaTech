import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/appcolors.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/beaming_pulse.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/bouncing_pill.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/jumping_dots.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.sharedPrefsService});
  final SharedPrefsService sharedPrefsService;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final isOnboardingSeen = widget.sharedPrefsService.getBool(
      PrefsKeys.isOnboardingSeen,
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) {
        return;
      }
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
              context.vMd,
              BeamPulse(),
              context.vMd,
              //Title (App Name)
              Text(
                'Pharma Tech',
                style: context.text.displayLarge!.copyWith(
                  color: context.colors.onPrimary,
                ),
              ),
              context.vMd,
              //Subtitle
              Text(
                context.tr.splash_subtitle,
                style: context.text.bodyLarge!.copyWith(
                  color: context.colors.onPrimary,
                ),
              ),
              context.vXl,
              JumpingDots(),
            ],
          ),
        ),
      ),
    );
  }
}
