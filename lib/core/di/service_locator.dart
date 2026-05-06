import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/core/state/app_state_notifier.dart';
import 'package:pharmacy_app/core/repositories/auth/auth_repository.dart';
import 'package:pharmacy_app/core/repositories/auth/auth_repository_impl.dart';
import 'package:pharmacy_app/core/repositories/onboarding/onboarding_repository.dart';
import 'package:pharmacy_app/core/repositories/onboarding/onboarding_repository_impl.dart';
import 'package:pharmacy_app/core/state/auth/auth_cubit.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // --- 1. Services (External Tools) ----
  final sharedPrefsService = await SharedPrefsService().init();
  sl.registerSingleton<SharedPrefsService>(sharedPrefsService);
  sl.registerSingleton<SecureStorageService>(SecureStorageService());

  // --- 2. Global Repositories ---
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(secureStorageService: sl()),
  );

  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sharedPrefsService: sl()),
  );

  // --- 3. Global Cubits (Session Manager) ---

  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl<AuthRepository>()));

  // --- 4. App State Notifier (The Bridge) ---
  sl.registerLazySingleton<AppStateNotifier>(
    () => AppStateNotifier(
      authCubit: sl<AuthCubit>(),
      onboardingRepository: sl<OnboardingRepository>(),
    ),
  );
}
