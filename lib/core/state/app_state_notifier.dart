import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/state/auth/auth_cubit.dart';
import 'package:pharmacy_app/core/state/auth/auth_state.dart';
import 'package:pharmacy_app/core/repositories/onboarding/onboarding_repository.dart';

class AppStateNotifier extends ChangeNotifier {
  final AuthCubit _authCubit;
  final OnboardingRepository _onboardingRepository;

  late StreamSubscription _authSubscription;

  bool _isInitialized = false;
  bool _onboardingSeen = false;
  AuthState _authState = const AuthState.initial();

  AppStateNotifier({
    required AuthCubit authCubit,
    required OnboardingRepository onboardingRepository,
  }) : _authCubit = authCubit,
       _onboardingRepository = onboardingRepository {
    _init();
  }

  /// Handles the async startup logic for the application state
  Future<void> _init() async {
    try {
      // This ensures the splash lasts AT LEAST 2 seconds, but longer if the data takes longer
      final results = await Future.wait([
        _onboardingRepository.hasSeenOnboarding(),
        Future.delayed(
          const Duration(seconds: 3),
        ), // The mandatory 2-second delay
      ]);

      // Result of the first future is our onboarding status
      _onboardingSeen = results[0] as bool;
      // 2. Capture the current state of the AuthCubit immediately
      _authState = _authCubit.state;

      // 3. Listen to the AuthCubit stream for future changes (Login/Logout)
      _authSubscription = _authCubit.stream.listen((state) {
        _authState = state;
        _isInitialized = true;
        notifyListeners(); // This triggers GoRouter to re-evaluate the redirect logic
      });

      // 4. Mark as initialized and notify listeners for the first time
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      // Handle potential initialization errors here
      debugPrint('AppStateNotifier Initialization Error: $e');
      _isInitialized = true;
      notifyListeners();
    }
  }

  // ***************** GETTERS FOR GOROUTER ***************** //

  /// Tells GoRouter if we are still loading initial data (Show Splash)
  bool get isInitialized => _isInitialized;

  /// Tells GoRouter if the user has completed the onboarding flow
  bool get onboardingSeen => _onboardingSeen;

  /// Maps the AuthState to a simple boolean for navigation logic
  bool get isAuthenticated =>
      _authState.maybeWhen(authenticated: (_) => true, orElse: () => false);

  // ***************** ACTIONS ***************** //

  /// Called from the OnboardingScreen when the user clicks 'Get Started'
  void completeOnboarding() {
    debugPrint("1. UI called completeOnboarding");
    _onboardingSeen = true;

    notifyListeners();
    debugPrint("2. notifyListeners() executed");
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}
