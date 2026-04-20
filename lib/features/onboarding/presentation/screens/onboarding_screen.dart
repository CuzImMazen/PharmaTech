import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/consts/sizes/screen_size.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/router/app_routes.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_helper.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
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
  late final PageController _controller;

  int _index = 0;

  late final List<OnboardingPageModel> _pages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pages = getOnboardingPages(context);
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_index < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finish();
    }
  }

  void _back() {
    if (_index > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finish() async {
    await SharedPrefsHelper.setBool(PrefsKeys.isOnboardingSeen, true);
    if (!mounted) return;
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final size = ScreenSize(context);
    final isTablet = size.width > 600;

    final isLast = _index == _pages.length - 1;
    final isFirst = _index == 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (!isLast)
            TextButton(
              onPressed: _finish,
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
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 32 : size.wp(0.08),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: _pages.length,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (context, i) =>
                          OnboardingPage(model: _pages[i]),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: _pages.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                      activeDotColor: context.colors.primary,
                      dotColor: context.colors.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  AppSpaces.vXl,
                  Row(
                    children: [
                      if (!isFirst)
                        SizedBox(
                          width: 110,
                          child: TextButton.icon(
                            onPressed: _back,
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 18,
                              color: Colors.grey,
                            ),
                            label: Text(
                              context.tr.onboarding_back,
                              style: context.text.bodyLarge?.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      AppSpaces.hMd,
                      Expanded(
                        child: OnboardingActionButton(
                          isLastPage: isLast,
                          onTap: _next,
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
    );
  }
}
