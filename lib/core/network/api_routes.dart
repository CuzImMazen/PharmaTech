class ApiRoutes {
  // ================= AUTH ================= //

  static const String register = '/register';
  static const String login = '/login';
  static const String googleLogin = '/auth/google';
  static const String completeProfile = '/auth/google/complete-profile';
  static const String refresh = '/refresh';

  static const String logout = '/logout';
  static const String logoutAll = '/logout-all';

  // ================= USER ================= //

  static const String user = '/user';

  // ================= DATA ================= //

  static const String products = '/products';
  static const String lowStockProducts = '/products/low-stock';
  static const String categories = '/categories';
  static const String units = '/units';
  static const String companies = '/companies';

  // ---- Product detail (path-parameter builders) ----
  static String productDetail(int id) => '$products/$id';
  static String productBatches(int id) => '$products/$id/batches/available';
  static String productMedicalInfo(int id) => '$products/$id/medical-info';

  // All stock batches (any status) for a product — `?product_id={id}`.
  static const String stockBatches = '/stock-batches';
  static String markBatchExpired(int id) => '$stockBatches/$id/mark-expired';

  // Stock movements history — `?product_id={id}`.
  static const String stockMovements = '/stock-movements';

  // Manual stock adjustments (add/remove a batch) — POST.
  static const String stockAdjustments = '/stock-adjustments';

  static const String governorates = '/governorates';
  static const String cities = '/cities';
  static const String governorateWithCities = '/governorates-cities';

  // ================= EMAIL Veriication ================= //

  static const String emailResend = '/email/resend';

  // ================= PASSWORD  Recovery ================= //

  static const String forgotPassword = '/password/forgot';

  static const String resetPassword = '/password/reset';

  // ================= SUPPLIERS ================= //

  static const String suppliers = '/suppliers';
  static String supplierDetail(int id) => '$suppliers/$id';
  static String supplierRestore(int id) => '$suppliers/$id/restore';

  // ================= PURCHASE INVOICES ================= //

  static const String purchaseInvoices = '/purchase-invoices';
  static String purchaseInvoiceDetail(int id) => '$purchaseInvoices/$id';
  static String purchaseInvoiceCancel(int id) =>
      '$purchaseInvoices/$id/cancel';

  // ================= SUPPLIER DEBTS ================= //

  static const String supplierDebts = '/supplier-debts';
  static String supplierDebtDetail(int id) => '$supplierDebts/$id';

  // ================= CASH BOXES ================= //

  /// Singular — the pharmacy's single cash box (404 when none exists yet).
  static const String cashBoxes = '/cash-boxes';
  static const String cashBoxTransactions = '/cash-boxes/transactions';
}
