import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/core/bootstrap/app_state_notifier.dart';
import 'package:pharmacy_app/core/repositories/auth/auth_repository.dart';
import 'package:pharmacy_app/core/repositories/auth/auth_repository_impl.dart';
import 'package:pharmacy_app/core/repositories/onboarding/onboarding_repository.dart';
import 'package:pharmacy_app/core/repositories/onboarding/onboarding_repository_impl.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // *************** Shared Preferences Service ****************//

  // 1. Create the instance
  sl.registerSingleton<SharedPrefsService>(await SharedPrefsService().init());

  //***** Secure Storage Service ****************//

  sl.registerSingleton<SecureStorageService>(SecureStorageService());

  //*************** App State Notifier ****************/
  sl.registerLazySingleton<AppStateNotifier>(
    () => AppStateNotifier(
      authRepository: sl<AuthRepository>(),
      onboardingRepository: sl<OnboardingRepository>(),
    ),
  );

  //*************** Global Repositories ****************/
  /// Auth Repository
  sl.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      secureStorageService: sl<SecureStorageService>(),
      sharedPrefsService: sl<SharedPrefsService>(),
    ),
  );

  // Onboarding Repository
  sl.registerFactory<OnboardingRepository>(
    () =>
        OnboardingRepositoryImpl(sharedPrefsService: sl<SharedPrefsService>()),
  );
}
