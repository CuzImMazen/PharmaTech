import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
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

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  late List<PageViewModel> _pages;

  int _currentIndex = 0;
  bool _isNavigating = false;
  bool _didCacheImages = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Cache images once
    if (!_didCacheImages) {
      for (final img in _imageAssets) {
        precacheImage(AssetImage(img), context);
      }
      _didCacheImages = true;
    }

    // Build pages once per dependency change (for localization/theme)
    _pages = _buildPages(context);
  }

  // ---------- CONSTANTS ----------
  static const List<String> _imageAssets = [
    AppAssets.onboarding1,
    AppAssets.onboarding2,
    AppAssets.onboarding3,
  ];

  // ---------- DECORATION ----------
  PageDecoration _pageDecoration(BuildContext context) {
    return PageDecoration(
      titleTextStyle: context.text.headlineMedium!,
      bodyTextStyle: context.text.bodyLarge!.copyWith(color: context.muted),
    );
  }

  // ---------- PAGES ----------
  List<PageViewModel> _buildPages(BuildContext context) {
    return [
      _page(
        context,
        title: context.tr.onboarding_page1_title,
        body: context.tr.onboarding_page1_desc,
        image: _imageAssets[0],
      ),
      _page(
        context,
        title: context.tr.onboarding_page2_title,
        body: context.tr.onboarding_page2_desc,
        image: _imageAssets[1],
      ),
      _page(
        context,
        title: context.tr.onboarding_page3_title,
        body: context.tr.onboarding_page3_desc,
        image: _imageAssets[2],
      ),
    ];
  }

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
      image: Image.asset(image, fit: BoxFit.contain),
    );
  }

  // ---------- NAVIGATION ----------
  void _handleBack() {
    if (_currentIndex > 0) {
      _introKey.currentState?.previous();
    }
  }

  void _handleNext() {
    final isLast = _currentIndex == _pages.length - 1;

    if (isLast) {
      _finish();
    } else {
      _introKey.currentState?.next();
    }
  }

  Future<void> _finish() async {
    if (_isNavigating) return;

    setState(() => _isNavigating = true);

    try {
      await sl<SharedPrefsService>().setBool(PrefsKeys.isOnboardingSeen, true);
    } catch (e) {
      debugPrint('Onboarding Storage Error (Non-fatal): $e');
    }

    if (!mounted) return;

    context.go(AppRoutes.login);
  }

  // ---------- BUILD ----------
  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == _pages.length - 1;
    final isFirst = _currentIndex == 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (!isLast)
            TextButton(
              onPressed: _isNavigating ? null : _finish,
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
        minimum: context.pScreen,
        child: IntroductionScreen(
          key: _introKey,
          pages: _pages,

          onChange: (index) {
            if (_currentIndex != index) {
              setState(() => _currentIndex = index);
            }
          },

          showDoneButton: false,
          showNextButton: false,
          showBackButton: false,

          globalFooter: OnboardingFooter(
            isFirst: isFirst,
            isLast: isLast,
            onNext: _handleNext,
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
