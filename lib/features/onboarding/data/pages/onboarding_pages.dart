import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/theme/appcolors.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/features/onboarding/data/models/onboarding_page_model.dart';

List<OnboardingPageModel> getOnboardingPages(BuildContext context) {
  return [
    OnboardingPageModel(
      title: context.tr.onboarding_page1_title,
      description: context.tr.onboarding_page1_desc,
      color: context.colors.primary,
      icon: LucideIcons.box,
    ),
    OnboardingPageModel(
      title: context.tr.onboarding_page2_title,
      description: context.tr.onboarding_page2_desc,
      color: AppColors.cozyBlue,
      icon: LucideIcons.shoppingCart,
    ),
    OnboardingPageModel(
      title: context.tr.onboarding_page3_title,
      description: context.tr.onboarding_page3_desc,
      color: AppColors.cozyPurple,
      icon: LucideIcons.chartColumn,
    ),
  ];
}
