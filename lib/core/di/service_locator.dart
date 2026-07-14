import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/core/app/session/session_cubit.dart';
import 'package:pharmacy_app/core/app/settings/locale_cubit.dart';
import 'package:pharmacy_app/core/app/settings/theme_cubit.dart';

import 'package:pharmacy_app/core/network/auth_interceptor.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/core/services/google_auth_service.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';
import 'package:pharmacy_app/core/token/token_store.dart';

import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository_impl.dart';

import 'package:pharmacy_app/features/dashboard/data/repo/dashboard_repository.dart';
import 'package:pharmacy_app/features/dashboard/data/repo/dashboard_repository_impl.dart';

import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository_impl.dart';
import 'package:pharmacy_app/features/inventory/data/repo/product_detail_repository.dart';
import 'package:pharmacy_app/features/inventory/data/repo/product_detail_repository_impl.dart';

import 'package:pharmacy_app/features/onboarding/data/repo/onboarding_repository.dart';
import 'package:pharmacy_app/features/onboarding/data/repo/onboarding_repository_impl.dart';

import 'package:pharmacy_app/features/suppliers/data/repo/supplier_repository.dart';
import 'package:pharmacy_app/features/suppliers/data/repo/supplier_repository_impl.dart';

import 'package:pharmacy_app/features/cash_boxes/data/repo/cash_box_repository.dart';
import 'package:pharmacy_app/features/cash_boxes/data/repo/cash_box_repository_impl.dart';

import 'package:pharmacy_app/features/supplier_debts/data/repo/supplier_debt_repository.dart';
import 'package:pharmacy_app/features/supplier_debts/data/repo/supplier_debt_repository_impl.dart';
import 'package:pharmacy_app/features/customer_debts/data/repo/customer_debt_repository.dart';
import 'package:pharmacy_app/features/customer_debts/data/repo/customer_debt_repository_impl.dart';

import 'package:pharmacy_app/features/stock_adjustments/data/repo/stock_adjustment_repository.dart';
import 'package:pharmacy_app/features/stock_adjustments/data/repo/stock_adjustment_repository_impl.dart';

import 'package:pharmacy_app/features/bulk_stock_adjustment/data/repo/bulk_stock_adjustment_repository.dart';
import 'package:pharmacy_app/features/bulk_stock_adjustment/data/repo/bulk_stock_adjustment_repository_impl.dart';

import 'package:pharmacy_app/features/purchase_invoices/data/repo/purchase_invoice_repository.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/repo/purchase_invoice_repository_impl.dart';

import 'package:pharmacy_app/features/customers/data/repo/customer_repository.dart';
import 'package:pharmacy_app/features/customers/data/repo/customer_repository_impl.dart';

import 'package:pharmacy_app/features/sales_invoices/data/repo/sales_invoice_repository.dart';
import 'package:pharmacy_app/features/sales_invoices/data/repo/sales_invoice_repository_impl.dart';

import 'package:pharmacy_app/features/customer_return_invoices/data/repo/customer_return_invoice_repository.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/repo/customer_return_invoice_repository_impl.dart';

import 'package:pharmacy_app/features/supplier_return_invoices/data/repo/supplier_return_invoice_repository.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/repo/supplier_return_invoice_repository_impl.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // ==========================================================
  // 1. SERVICES & STORAGE
  // ==========================================================

  // Initialize and register Shared Preferences
  final sharedPrefsService = await SharedPrefsService().init();
  sl.registerSingleton<SharedPrefsService>(sharedPrefsService);

  // Initialize and register  Google Auth Service
  final googleAuthService = GoogleAuthService();
  await googleAuthService.init();
  sl.registerSingleton<GoogleAuthService>(googleAuthService);

  // Register secure storage and token store
  sl.registerSingleton<SecureStorageService>(SecureStorageService());
  sl.registerSingleton<TokenStore>(TokenStore());

  // ==========================================================
  // 2. NETWORK CORE COMPONENTS
  // ==========================================================

  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(
      tokenStore: sl<TokenStore>(),
      secureStorage: sl<SecureStorageService>(),
    ),
  );

  sl.registerLazySingleton<DioApiHelper>(
    () => DioApiHelper(
      baseUrl: dotenv.env['BASE_URL']!,
      authInterceptor: sl<AuthInterceptor>(),
    ),
  );

  // ==========================================================
  // 3. REPOSITORIES
  // ==========================================================

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      api: sl<DioApiHelper>(),
      secureStorageService: sl<SecureStorageService>(),
      sharedPrefsService: sl<SharedPrefsService>(),
    ),
  );

  sl.registerLazySingleton<OnboardingRepository>(
    () =>
        OnboardingRepositoryImpl(sharedPrefsService: sl<SharedPrefsService>()),
  );

  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<ProductDetailRepository>(
    () => ProductDetailRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<SupplierRepository>(
    () => SupplierRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<CashBoxRepository>(
    () => CashBoxRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<SupplierDebtRepository>(
    () => SupplierDebtRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<CustomerDebtRepository>(
    () => CustomerDebtRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<StockAdjustmentRepository>(
    () => StockAdjustmentRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<BulkStockAdjustmentRepository>(
    () => BulkStockAdjustmentRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<PurchaseInvoiceRepository>(
    () => PurchaseInvoiceRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<SalesInvoiceRepository>(
    () => SalesInvoiceRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<CustomerReturnInvoiceRepository>(
    () => CustomerReturnInvoiceRepositoryImpl(api: sl<DioApiHelper>()),
  );

  sl.registerLazySingleton<SupplierReturnInvoiceRepository>(
    () => SupplierReturnInvoiceRepositoryImpl(api: sl<DioApiHelper>()),
  );

  //Session Cubit
  sl.registerLazySingleton(
    () => SessionCubit(authRepository: sl<AuthRepository>()),
  );

  // App settings cubits (theme + locale) — lazy so they can resolve the
  // SharedPrefsService singleton. Hydrated from prefs in main() before runApp.
  sl.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(prefs: sl<SharedPrefsService>()),
  );
  sl.registerLazySingleton<LocaleCubit>(
    () => LocaleCubit(prefs: sl<SharedPrefsService>()),
  );
}
