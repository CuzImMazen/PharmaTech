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
  static String productRestore(int id) => '$products/$id/restore';
  static String productByBarcode(String barcode) =>
      '$products/barcode/${Uri.encodeComponent(barcode)}';

  // All stock batches (any status) for a product — `?product_id={id}`.
  static const String stockBatches = '/stock-batches';
  static String markBatchExpired(int id) => '$stockBatches/$id/mark-expired';

  // Stock movements history — `?product_id={id}`.
  static const String stockMovements = '/stock-movements';

  // Manual stock adjustments (add/remove a batch) — POST.
  static const String stockAdjustments = '/stock-adjustments';

  // Bulk stock adjustments — POST a single body `{items: [...]}`; the backend
  // applies every item atomically in one transaction (all-or-nothing).
  static const String stockAdjustmentsBulk = '/stock-adjustments/bulk';

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
  static String supplierDebtPay(int id) => '$supplierDebts/$id/pay';

  // ================= CUSTOMER DEBTS ================= //

  static const String customerDebts = '/customer-debts';
  static String customerDebtDetail(int id) => '$customerDebts/$id';
  static String customerDebtPay(int id) => '$customerDebts/$id/pay';

  // ================= CUSTOMERS ================= //

  static const String customers = '/customers';
  static String customerDetail(int id) => '$customers/$id';
  static String customerRestore(int id) => '$customers/$id/restore';

  // ================= SALES INVOICES ================= //

  static const String salesInvoices = '/sales-invoices';
  static String salesInvoiceDetail(int id) => '$salesInvoices/$id';
  static String salesInvoiceCancel(int id) => '$salesInvoices/$id/cancel';

  // ================= CUSTOMER RETURN INVOICES ================= //

  static const String customerReturnInvoices = '/customer-return-invoices';
  static String customerReturnInvoiceDetail(int id) =>
      '$customerReturnInvoices/$id';
  static String customerReturnInvoiceCancel(int id) =>
      '$customerReturnInvoices/$id/cancel';

  // ================= SUPPLIER RETURN INVOICES ================= //

  static const String supplierReturnInvoices = '/supplier-return-invoices';
  static String supplierReturnInvoiceDetail(int id) =>
      '$supplierReturnInvoices/$id';
  static String supplierReturnInvoiceCancel(int id) =>
      '$supplierReturnInvoices/$id/cancel';

  // ================= CASH BOXES ================= //

  /// Singular — the pharmacy's single cash box (404 when none exists yet).
  static const String cashBoxes = '/cash-boxes';
  static const String cashBoxTransactions = '/cash-boxes/transactions';
  static const String cashBoxStatistics = '/cash-boxes/statistics';

  // ================= DASHBOARD ================= //

  static const String dashboardHeader = '/dashboard/header';
  static const String dashboardCards = '/dashboard/cards';
  static const String dashboardWeeklyRevenue = '/dashboard/weekly-revenue';
  static const String dashboardTransactions = '/dashboard/transactions';

  // ================= REPORTS =================

  static const String reportsSales = '/reports/sales';
  static const String reportsTopProducts = '/reports/top-products';
  static const String reportsProfit = '/reports/profit';
  static const String reportsSupplierPrices = '/reports/supplier-prices';
  static const String reportsInventoryValue = '/reports/inventory-value';
  static const String reportsStockHealth = '/reports/stock-health';
}
