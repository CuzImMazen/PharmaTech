import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/router/app_router.dart';
import 'package:pharmacy_app/core/theme/app_theme.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(PharmacyApp());
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

      //  themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,

      // device config
      //useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      //Localization
      supportedLocales: const [Locale('en'), Locale('ar')],
      //locale: const Locale('ar'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
