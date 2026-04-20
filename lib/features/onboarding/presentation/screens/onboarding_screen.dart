import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/sizes/screen_size.dart';
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
  List<OnboardingPageModel>? _pages;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _pages ??= getOnboardingPages(context);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_pages == null) return;

    if (_currentPage < _pages!.length - 1) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else {
      _finishOnboarding();
    }
  }

  Future<void> _finishOnboarding() async {
    if (!mounted) return;
    // context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    if (_pages == null) return const Scaffold();

    final size = ScreenSize(context);

    final isTablet = size.width > 600;
    final horizontalPadding = isTablet ? 32.0 : size.wp(0.08);

    final isLastPage = _currentPage == _pages!.length - 1;
    final isFirstPage = _currentPage == 0;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (!isFirstPage && _pageController.hasClients) {
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
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ), // Limits width on wide screens
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _pages!.length,
                        onPageChanged: (index) =>
                            setState(() => _currentPage = index),
                        itemBuilder: (context, index) =>
                            OnboardingPage(model: _pages![index]),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _pages!.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 3,
                        activeDotColor: context.colors.primary,
                        dotColor: context.colors.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    AppSpaces.vXl,
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: isFirstPage ? 0.0 : 1.0,
                            child: IgnorePointer(
                              ignoring: isFirstPage,
                              child: _buildBackButton(),
                            ),
                          ),
                        ),
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
                    AppSpaces.vLg,
                  ],
                ),
              ),
            ),
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
