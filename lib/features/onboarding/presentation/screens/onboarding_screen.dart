import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/consts/assets.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_footer.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// this Screen doesnt follow Clean Architecture
// because its only responsible for showing the onboarding pages and navigating to the next screen
// it doesn't have any  complex business logic or data manipulation, so we can keep it simple
// without adding unnecessary layers of abstraction.

// the above comments  are written by me not Ai ...

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;
  final ValueNotifier<int> _pageIndex = ValueNotifier(0);

  List<OnBoardingPage> _buildPages(BuildContext context) {
    return [
      OnBoardingPage(
        image: AppAssets.onboarding1,
        title: context.tr.onboarding_page1_title,
        description: context.tr.onboarding_page1_desc,
      ),
      OnBoardingPage(
        image: AppAssets.onboarding2,
        title: context.tr.onboarding_page2_title,
        description: context.tr.onboarding_page2_desc,
      ),
      OnBoardingPage(
        image: AppAssets.onboarding3,
        title: context.tr.onboarding_page3_title,
        description: context.tr.onboarding_page3_desc,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageIndex.dispose();
    super.dispose();
  }

  void _next(int lastIndex) {
    if (_pageIndex.value == lastIndex) {
      _finish();
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _back() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _finish() async {
    try {
      await sl<SharedPrefsService>().setBool(PrefsKeys.isOnboardingSeen, true);
    } catch (e) {
      debugPrint('Onboarding Storage Error: $e');
    }

    if (!mounted) return;
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages(context);
    final lastPageIndex = pages.length - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: _pageIndex,
            builder: (_, index, _) {
              final isLast = index == lastPageIndex;
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isLast ? 0 : 1,
                child: IgnorePointer(
                  ignoring: isLast,
                  child: TextButton(
                    onPressed: _finish,
                    child: Text(
                      context.tr.onboarding_skip,
                      style: context.text.labelLarge?.copyWith(
                        color: context.muted,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: context.pScreen,
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (i) => _pageIndex.value = i,
                  children: pages,
                ),
              ),
              context.vMd,
              SmoothPageIndicator(
                controller: _controller,
                count: pages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 2,
                  spacing: 6,
                  activeDotColor: context.primary,
                  dotColor: context.muted.withValues(alpha: 0.4),
                ),
              ),
              context.vMd,
              ValueListenableBuilder<int>(
                valueListenable: _pageIndex,
                builder: (_, index, _) {
                  return OnboardingFooter(
                    isFirst: index == 0,
                    isLast: index == lastPageIndex,
                    onNext: () => _next(lastPageIndex),
                    onBack: _back,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// this Screen doesnt follow Clean Architecture
// because its only responsible for showing the onboarding pages and navigating to the next screen
// it doesn't have any  complex business logic or data manipulation, so we can keep it simple 
// without adding unnecessary layers of abstraction.

// the above comments  are written by me not Ai ...

