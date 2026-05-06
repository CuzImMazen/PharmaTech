import 'package:pharmacy_app/core/storage/prefs/shared_prefs_keys.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/repositories/onboarding/onboarding_repository.dart';
import 'package:flutter/foundation.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final SharedPrefsService sharedPrefsService;

  OnboardingRepositoryImpl({required this.sharedPrefsService});

  @override
  Future<bool> hasSeenOnboarding() async {
    try {
      final value = await sharedPrefsService.getBool(
        PrefsKeys.hasSeenOnboarding,
      );
      return value ?? false;
    } catch (e) {
      debugPrint('OnboardingRepo: Error reading onboarding state: $e');
      // Default to false so they see onboarding if storage fails
      return false;
    }
  }

  @override
  Future<void> setOnboardingSeen() async {
    try {
      await sharedPrefsService.setBool(PrefsKeys.hasSeenOnboarding, true);
    } catch (e) {
      debugPrint('OnboardingRepo: Error saving onboarding state: $e');
    }
  }
}
