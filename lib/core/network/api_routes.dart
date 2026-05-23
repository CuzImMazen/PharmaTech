class ApiRoutes {
  // ================= AUTH ================= //

  static const String register = '/register';
  static const String login = '/login';
  static const String googleLogin = '/auth/google';
  static const String completeProfile = 'auth/google/complete-profile';
  static const String refresh = '/refresh';

  static const String logout = '/logout';
  static const String logoutAll = '/logout-all';

  // ================= USER ================= //

  static const String user = '/user';

  // ================= DATA ================= //

  static const String governorates = '/governorates';
  static const String cities = '/cities';
  static const String governorateWithCities = '/governorates-cities';

  // ================= EMAIL Veriication ================= //

  static const String emailResend = '/email/resend';

  // ================= PASSWORD  Recovery ================= //

  static const String forgotPassword = '/password/forgot';

  static const String resetPassword = '/password/reset';
}
