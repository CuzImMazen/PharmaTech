class AppRoutesKeys {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String registerCredentials = '/register_credentials';
  static const String registerDetails = '/register_details';
  static const String verificationSent = '/verification_sent';
  static const String resetPasswordSent = '/reset_password_sent';
  static const String forgetPassword = '/forget_password';
  static const String resetPassword = '/reset-password';
  static const String completeProfile = '/complete_profile';
  static const String dashboard = '/dashboard';
  static const String inventory = '/inventory';
  static const String sales = '/sales';
  static const String reports = '/reports';

  static const String settings = '/settings';
  static const String productDetail = '/product/:id';
  static const String productAdd = '/product/add';
  static const String productEdit = '/product/:id/edit';
  static const String medicalInfoEdit = '/product/:id/medical-info/edit';

  /// Builds an edit route for a specific product id.
  static String productEditWith(int id) => '/product/$id/edit';

  /// Builds a medical-info edit route for a specific product id.
  static String medicalInfoEditWith(int id) => '/product/$id/medical-info/edit';

  /// Builds a product detail route for a specific product id.
  static String productDetailWith(int id) => '/product/$id';
}
