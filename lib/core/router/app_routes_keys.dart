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

  // Suppliers — pushed over the nav shell (no bottom nav).
  static const String suppliersList = '/suppliers';
  static const String supplierAdd = '/suppliers/add';
  static const String supplierEdit = '/suppliers/:id/edit';

  // Cash Box — single screen (one box per pharmacy).
  static const String cashBox = '/cash-box';

  // Supplier Debts — pushed over the nav shell (no bottom nav).
  static const String debtsList = '/supplier-debts';
  static const String debtDetail = '/supplier-debts/:id';

  // Purchase Invoices — pushed over the nav shell (no bottom nav).
  static const String invoicesList = '/purchase-invoices';
  static const String invoiceAdd = '/purchase-invoices/add';
  static const String invoiceDetail = '/purchase-invoices/:id';

  /// Builds a detail route for a specific supplier debt id.
  static String debtDetailWith(int id) => '/supplier-debts/$id';

  /// Builds a detail route for a specific purchase invoice id.
  static String invoiceDetailWith(int id) => '/purchase-invoices/$id';

  /// Builds an edit route for a specific product id.
  static String productEditWith(int id) => '/product/$id/edit';

  /// Builds a medical-info edit route for a specific product id.
  static String medicalInfoEditWith(int id) => '/product/$id/medical-info/edit';

  /// Builds a product detail route for a specific product id.
  static String productDetailWith(int id) => '/product/$id';

  /// Builds an edit route for a specific supplier id.
  static String supplierEditWith(int id) => '/suppliers/$id/edit';
}
