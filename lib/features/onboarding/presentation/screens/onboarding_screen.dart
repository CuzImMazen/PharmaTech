import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/consts/assets.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/app/app_state_notifier.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_footer.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// This screen intentionally avoids Clean Architecture layers.
// It is purely UI-driven with no business logic, so adding
// abstraction (e.g., Bloc/UseCases) would be unnecessary.

// the above comments  are written by me not Ai ...

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //page controller for the pageview
  late final PageController _controller;
  // using ValueNotifier to track the current page index and update only  the effected UI
  final ValueNotifier<int> _pageIndex = ValueNotifier(0);
  //pages not final because they may change when app Localization changes and we need to update the text accordingly
  late List<OnBoardingPage> pages;
  // getter for the last page index to avoid hardcoding it in multiple places
  int get lastPageIndex => pages.length - 1;
  //
  bool _isImagePrecached = false;
  Locale? _lastLocale;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  // inializeing  static pages here because they depend on context
  // and precaching the images to avoid jank when swiping between pages for the first time
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);

    if (_lastLocale != locale) {
      _lastLocale = locale;
      debugPrint("pages built");
      pages = [
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

    if (!_isImagePrecached) {
      for (var page in pages) {
        precacheImage(AssetImage(page.image), context);
      }
      _isImagePrecached = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageIndex.dispose();
    super.dispose();
  }

  void _next() {
    if (_pageIndex.value == lastPageIndex) {
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

  void _finish() {
    context.read<AppStateNotifier>().completeOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (_pageIndex.value > 0) {
          _back();
        }
      },
      child: Scaffold(
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
                    physics: const BouncingScrollPhysics(),
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
                      onNext: _next,
                      onBack: _back,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// This screen intentionally avoids Clean Architecture layers.
// It is purely UI-driven with almost no business logic, so adding
// abstraction (e.g., Bloc/UseCases) would be unnecessary.

// the above comments  are written by me not Ai ...
