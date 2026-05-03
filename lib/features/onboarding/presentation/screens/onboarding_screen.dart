import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pharmacy_app/core/consts/strings/assets.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_footer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  int _currentIndex = 0;
  bool _isNavigating = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Logic: Precache images to prevent flickering on first swipe
    precacheImage(AssetImage(AppAssets.onboarding1), context);
    precacheImage(AssetImage(AppAssets.onboarding2), context);
    precacheImage(AssetImage(AppAssets.onboarding3), context);
  }

  // ---------- DECORATION ----------
  PageDecoration _pageDecoration(BuildContext context) {
    return PageDecoration(
      titleTextStyle: context.text.headlineMedium!,
      bodyTextStyle: context.text.bodyLarge!.copyWith(color: context.muted),
    );
  }

  // ---------- PAGES ----------
  List<PageViewModel> _pages(BuildContext context) => [
    _page(
      context,
      title: context.tr.onboarding_page1_title,
      body: context.tr.onboarding_page1_desc,
      image: AppAssets.onboarding1,
    ),
    _page(
      context,
      title: context.tr.onboarding_page2_title,
      body: context.tr.onboarding_page2_desc,
      image: AppAssets.onboarding2,
    ),
    _page(
      context,
      title: context.tr.onboarding_page3_title,
      body: context.tr.onboarding_page3_desc,
      image: AppAssets.onboarding3,
    ),
  ];

  PageViewModel _page(
    BuildContext context, {
    required String title,
    required String body,
    required String image,
  }) {
    return PageViewModel(
      decoration: _pageDecoration(context),
      title: title,
      body: body,
      image: Image.asset(image),
    );
  }

  // ---------- NAVIGATION ----------
  void _handleNext(bool isLast) {
    if (isLast) {
      _markOnboardingDoneAndGo();
    } else {
      _introKey.currentState?.next();
    }
  }

  void _handleBack() {
    _introKey.currentState?.previous();
  }

  Future<void> _markOnboardingDoneAndGo() async {
    // Logic: Guard against multiple clicks
    if (_isNavigating) return;
    setState(() => _isNavigating = true);

    try {
      await sl<SharedPrefsService>().setBool(PrefsKeys.isOnboardingSeen, true);
    } catch (e) {
      debugPrint('Failed to save onboarding state: $e');
    }

    if (!mounted) return;
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final pages = _pages(context);
    final isFirst = _currentIndex == 0;
    final isLast = _currentIndex == pages.length - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          if (!isLast)
            TextButton(
              onPressed: _markOnboardingDoneAndGo,
              child: Text(
                context.tr.onboarding_skip,
                style: context.text.labelLarge!.copyWith(
                  color: context.muted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: IntroductionScreen(
          key: _introKey,
          pages: pages,
          onChange: (index) => setState(() => _currentIndex = index),
          showDoneButton: false,
          showNextButton: false,
          showBackButton: false,
          globalFooter: OnboardingFooter(
            isFirst: isFirst,
            isLast: isLast,
            onNext: () => _handleNext(isLast),
            onBack: _handleBack,
          ),
          dotsDecorator: DotsDecorator(
            activeColor: context.primary,
            size: const Size(10, 10),
            activeSize: const Size(22, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
