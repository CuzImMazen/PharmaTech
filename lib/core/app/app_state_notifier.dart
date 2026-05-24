import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/app/session/session_cubit.dart';
import 'package:pharmacy_app/features/onboarding/data/repo/onboarding_repository.dart';

class AppStateNotifier extends ChangeNotifier {
  final SessionCubit _sessionCubit;
  final OnboardingRepository _onboardingRepository;

  late final StreamSubscription _authSubscription;

  bool _isInitialized = false;
  bool _onboardingSeen = false;

  AppStateNotifier({
    required SessionCubit sessionCubit,
    required OnboardingRepository onboardingRepository,
  }) : _sessionCubit = sessionCubit,
       _onboardingRepository = onboardingRepository {
    _init();
  }

  Future<void> _init() async {
    try {
      final results = await Future.wait([
        _onboardingRepository.hasSeenOnboarding(),
        Future.delayed(const Duration(seconds: 3)),
      ]);

      _onboardingSeen = results[0] as bool;

      _authSubscription = _sessionCubit.stream.listen((_) {
        notifyListeners();
      });

      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('AppStateNotifier error: $e');
      _isInitialized = true;
      notifyListeners();
    }
  }
  // Future<void> _init() async {
  //   debugPrint("INIT STARTED");

  //   try {
  //     final seen = await _onboardingRepository.hasSeenOnboarding();

  //     debugPrint("ONBOARDING RESULT: $seen");

  //     _onboardingSeen = seen;

  //     _authSubscription = _sessionCubit.stream.listen((_) {
  //       debugPrint("SESSION CHANGED");
  //       notifyListeners();
  //     });

  //     _isInitialized = true;

  //     debugPrint("INIT DONE = TRUE");

  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint("INIT ERROR: $e");

  //     _isInitialized = true;
  //     notifyListeners();
  //   }
  // }

  // ---------------- GETTERS ---------------- //

  bool get isInitialized => _isInitialized;

  bool get onboardingSeen => _onboardingSeen;

  bool get isAuthenticated => _sessionCubit.state.maybeWhen(
    authenticated: (_) => true,
    orElse: () => false,
  );

  // ---------------- ACTIONS ---------------- //

  // Call this when user completes onboarding
  void completeOnboarding() {
    _onboardingSeen = true;
    notifyListeners();
    _onboardingRepository.saveOnboardingSeen();
  }

  /// ---------------- DISPOSE ---------------- ///
  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}
