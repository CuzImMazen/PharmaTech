import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/core/token/token_store.dart';
import 'package:pharmacy_app/features/auth/data/repo/auth_repository.dart';
import 'package:pharmacy_app/features/auth/data/repo/auth_repository_impl.dart';
import 'package:pharmacy_app/features/onboarding/data/repo/onboarding_repository.dart';
import 'package:pharmacy_app/features/onboarding/data/repo/onboarding_repository_impl.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // --- 1. Services (External Tools) ----
  final sharedPrefsService = await SharedPrefsService().init();
  sl.registerSingleton<SharedPrefsService>(sharedPrefsService);
  sl.registerSingleton<SecureStorageService>(SecureStorageService());
  sl.registerSingleton<TokenStore>(TokenStore());

  // --- 2. Global Repositories ---
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(secureStorageService: sl()),
  );

  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sharedPrefsService: sl()),
  );
}
