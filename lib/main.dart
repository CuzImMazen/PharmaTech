import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmacy_app/core/router/app_router.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_helper.dart';
import 'package:pharmacy_app/core/theme/app_theme.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  runApp(const PharmacyApp());
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy App',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,

      //Localization
      supportedLocales: const [Locale('en'), Locale('ar')],
      locale: const Locale('ar'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
