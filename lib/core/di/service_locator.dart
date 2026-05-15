import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'package:pharmacy_app/core/network/auth_interceptor.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';
import 'package:pharmacy_app/core/token/token_store.dart';

import 'package:pharmacy_app/features/auth/data/repo/auth_repository.dart';
import 'package:pharmacy_app/features/auth/data/repo/auth_repository_impl.dart';

import 'package:pharmacy_app/features/onboarding/data/repo/onboarding_repository.dart';
import 'package:pharmacy_app/features/onboarding/data/repo/onboarding_repository_impl.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // ==========================================================
  // 1. SERVICES & STORAGE
  // ==========================================================

  final sharedPrefsService = await SharedPrefsService().init();

  sl.registerSingleton<SharedPrefsService>(sharedPrefsService);
  sl.registerSingleton<SecureStorageService>(SecureStorageService());
  sl.registerSingleton<TokenStore>(TokenStore());

  // ==========================================================
  // 2. NETWORK CORE COMPONENTS
  // ==========================================================

  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(
      tokenStore: sl<TokenStore>(),
      secureStorage: sl<SecureStorageService>(),
    ),
  );

  sl.registerLazySingleton<DioApiHelper>(
    () => DioApiHelper(
      baseUrl: dotenv.env['BASE_URL']!,
      authInterceptor: sl<AuthInterceptor>(),
    ),
  );

  // ==========================================================
  // 3. REPOSITORIES
  // ==========================================================

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      api: sl<DioApiHelper>(),
      secureStorageService: sl<SecureStorageService>(),
    ),
  );

  sl.registerLazySingleton<OnboardingRepository>(
    () =>
        OnboardingRepositoryImpl(sharedPrefsService: sl<SharedPrefsService>()),
  );
}
