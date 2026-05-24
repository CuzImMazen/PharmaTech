// ignore_for_file: unused_import

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmacy_app/core/app/app_keys.dart';
import 'package:pharmacy_app/core/app/app_state_notifier.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/router/app_router.dart';
import 'package:pharmacy_app/core/app/session/session_cubit.dart';
import 'package:pharmacy_app/core/services/deep_link_service.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/token/token_store.dart';
import 'package:pharmacy_app/core/theme/app_theme.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';
import 'package:pharmacy_app/l10n/locations/location_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupLocator();

  final authRepository = sl<AuthRepository>();
  final tokenStore = sl<TokenStore>();
  final sessionCubit = sl<SessionCubit>();

  /// 1: Restore BOTH tokens from storage (if user checked remember me)
  final accessToken = await authRepository.getAccessToken();
  final refreshToken = await authRepository.getRefreshToken();
  final cachedUser = await authRepository.getCachedUser();

  if (accessToken != null && refreshToken != null && cachedUser != null) {
    // put in-memory TokenStore for the interceptor
    tokenStore.set(accessToken: accessToken, refreshToken: refreshToken);

    // Pass the  tokens to  session cubit for initial validation/app state
    sessionCubit.setAuthenticated(cachedUser);
  } else {
    // If either token is missing, force a clean state
    tokenStore.clear();
    sessionCubit.setUnauthenticated();
  }

  // Inilize App state notifier with session cubit and onboarding repository
  final appState = AppStateNotifier(
    sessionCubit: sessionCubit,
    onboardingRepository: sl(),
  );

  // Initialize the router with the app state notifier
  AppRouter.init(appState);
  // Initialize deep link service with the router
  final deepLinkService = DeepLinkService(AppRouter.router);
  await deepLinkService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appState),
        BlocProvider.value(value: sessionCubit),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const PharmacyApp(),
      ),
    ),
  );
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
      builder: kReleaseMode ? null : DevicePreview.appBuilder,

      //********** Localization Section **********//
      locale: kReleaseMode ? null : DevicePreview.locale(context),

      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        LocationLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
