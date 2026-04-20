import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:pharmacy_app/features/onboarding/data/pages/onboarding_pages.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:pharmacy_app/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  late List<OnboardingPageModel> _pages;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    _pages = getOnboardingPages(context);
    _initialized = true;
  }

  @override
  void dispose() {
    _pageController.dispose();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  void _handleNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  Future<void> _finishOnboarding() async {
    // TODO: Add your Local Storage logic here (SharedPreferences, Hive, etc.)
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _pages.length - 1;
    final isFirstPage = _currentPage == 0;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (!isFirstPage) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            if (!isLastPage)
              TextButton(
                onPressed: _finishOnboarding,
                child: Text(
                  context.tr.onboarding_skip,
                  style: context.text.bodyLarge?.copyWith(
                    color: context.colors.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.common),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (context, index) =>
                      OnboardingPage(model: _pages[index]),
                ),
              ),

              SmoothPageIndicator(
                controller: _pageController,
                count: _pages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 3,
                  activeDotColor: context.colors.primary,
                  dotColor: context.colors.primary.withValues(alpha: 0.2),
                ),
              ),

              AppSpaces.vXl,

              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.common),
                  child: Row(
                    children: [
                      if (!isFirstPage)
                        Expanded(flex: 2, child: _buildBackButton()),

                      if (!isFirstPage) AppSpaces.hMd,

                      Expanded(
                        flex: 3,
                        child: OnboardingActionButton(
                          isLastPage: isLastPage,
                          onTap: _handleNext,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppSpaces.vLg,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return TextButton.icon(
      onPressed: () {
        if (_pageController.hasClients) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      icon: const Icon(Icons.arrow_back, color: Colors.grey, size: 20),
      label: Text(
        context.tr.onboarding_back,
        style: context.text.bodyLarge?.copyWith(color: Colors.grey),
      ),
    );
  }
}
