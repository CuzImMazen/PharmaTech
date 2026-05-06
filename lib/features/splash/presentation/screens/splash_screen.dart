import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/appcolors.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/beaming_pulse.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/bouncing_pill.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/jumping_dots.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
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
