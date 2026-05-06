class AppState {
  final bool onboardingSeen;
  final String? token;
  final bool rememberMe;

  AppState({
    required this.onboardingSeen,
    required this.token,
    required this.rememberMe,
  });

  bool get isLoggedIn => token != null && rememberMe;
}
