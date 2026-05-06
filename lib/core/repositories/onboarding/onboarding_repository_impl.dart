import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final SharedPrefsService sharedPrefsService;

  OnboardingRepositoryImpl({required this.sharedPrefsService});

  @override
  Future<bool> hasSeenOnboarding() async {
    return await sharedPrefsService.getBool(PrefsKeys.hasSeenOnboarding) ??
        false;
  }

  @override
  Future<void> setOnboardingSeen() {
    return sharedPrefsService.setBool(PrefsKeys.hasSeenOnboarding, true);
  }
}
