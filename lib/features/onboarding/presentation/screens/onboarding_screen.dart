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

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;
  final ValueNotifier<int> _currentPageIndex = ValueNotifier(0);
  late List<OnBoardingPage> _pages;

  @override
  void initState() {
    _controller = PageController();
    _pages = const [];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(AppAssets.onboarding1), context);
    precacheImage(AssetImage(AppAssets.onboarding2), context);
    precacheImage(AssetImage(AppAssets.onboarding3), context);
    _pages = [
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
  void dispose() {
    _controller.dispose();
    _currentPageIndex.dispose();
    super.dispose();
  }

  void _nextPage() {
    final int lastPageIndex = _pages.length - 1;
    if (_currentPageIndex.value == lastPageIndex) {
      _finish();
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _finish() async {
    try {
      await sl<SharedPrefsService>().setBool(PrefsKeys.isOnboardingSeen, true);
    } catch (e) {
      debugPrint('Onboarding Storage Error (Non-fatal): $e');
    }

    if (!mounted) return;
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = _pages.length;
    final int lastPageIndex = totalPages - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: _currentPageIndex,
            builder: (context, pageIndex, _) {
              final isLastPage = pageIndex == lastPageIndex;

              return AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isLastPage ? 0.0 : 1.0,
                child: IgnorePointer(
                  ignoring: isLastPage,
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
                  onPageChanged: (index) => _currentPageIndex.value = index,
                  children: _pages,
                ),
              ),
              context.vMd,
              SmoothPageIndicator(
                controller: _controller,
                count: totalPages,
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
                valueListenable: _currentPageIndex,
                builder: (context, pageIndex, _) {
                  return OnboardingFooter(
                    isFirst: pageIndex == 0,
                    isLast: pageIndex == lastPageIndex,
                    onNext: _nextPage,
                    onBack: _previousPage,
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
