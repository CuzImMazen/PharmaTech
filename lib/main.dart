import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmacy_app/core/bootstrap/app_state_notifier.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/router/app_router.dart';
import 'package:pharmacy_app/core/theme/app_theme.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Setup DI
  await setupLocator();

  // 2. Get AppStateNotifier
  final appState = sl<AppStateNotifier>();

  // 3. Load initial app state (auth, onboarding, etc.)
  appState.init();

  // 4. Build router using state
  AppRouter.init(appState);

  runApp(
    PharmacyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const PharmacyApp(),
    // ),
  );
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
      builder: kReleaseMode ? null : DevicePreview.appBuilder,

      //********** Localization Section **********//
      locale: kReleaseMode ? null : DevicePreview.locale(context),

      // this callback is used to determine which locale to use when the app starts
      // it checks if the device locale is supported by the app and returns it, otherwise it
      // this doesnt work while device preview is enabled because it overrides the device locale with the one selected in the device preview settings, so we need to check if the device preview is enabled and return the selected locale from the device preview settings instead of the device locale
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      // App Supported Locales
      supportedLocales: const [Locale('ar'), Locale('en')],
      // Localization Delegates
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
