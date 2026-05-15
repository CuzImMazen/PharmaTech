class ApiRoutes {
  // ================= AUTH ================= //

  static const String register = '/register';
  static const String login = '/login';
  static const String refresh = '/refresh';

  static const String logout = '/logout';
  static const String logoutAll = '/logout-all';

  // ================= USER ================= //

  static const String user = '/user';

  // ================= DATA ================= //

  static const String governorates = '/governorates';
  static const String cities = '/cities';

  // ================= EMAIL ================= //

  static const String emailVerify = '/email/verify';
  // usage: /email/verify/{id}/{hash}

  static const String emailResend = '/email/resend';

  // ================= PASSWORD ================= //

  static const String forgotPassword = '/password/forgot';

  static const String resetPassword = '/password/reset';
}
