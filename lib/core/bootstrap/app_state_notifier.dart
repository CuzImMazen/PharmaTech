import 'package:flutter/foundation.dart';
import 'package:pharmacy_app/core/repositories/auth/auth_repository.dart';
import 'package:pharmacy_app/core/repositories/onboarding/onboarding_repository.dart';
import 'app_state.dart';

class AppStateNotifier extends ChangeNotifier {
  final AuthRepository authRepository;
  final OnboardingRepository onboardingRepository;

  AppState? _state;
  AppState? get state => _state;
  bool _ready = false;
  bool get ready => _ready;
  AppStateNotifier({
    required this.authRepository,
    required this.onboardingRepository,
  });

  Future<void> init() async {
    try {
      final onboardingSeen = await onboardingRepository.hasSeenOnboarding();
      final token = await authRepository.getToken();
      final rememberMe = await authRepository.getRememberMe();

      _state = AppState(
        onboardingSeen: onboardingSeen,
        token: token,
        rememberMe: rememberMe,
      );
    } catch (e) {
      debugPrint("Failed to load app state: $e");

      _state = AppState(onboardingSeen: false, token: null, rememberMe: false);
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      _ready = true;
      notifyListeners();
    }
  }
}
