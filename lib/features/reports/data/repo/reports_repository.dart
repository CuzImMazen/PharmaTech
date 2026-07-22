import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/reports/data/models/inventory_value_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/profit_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/sales_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/stock_health_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/supplier_prices_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/top_products_report_model.dart';

/// Data source for the pharmacy reporting endpoints.
abstract class ReportsRepository {
  Future<Either<Failure, SalesReportModel>> fetchSalesReport({
    required String period,
    required String dateFrom,
    required String dateTo,
  });

  Future<Either<Failure, TopProductsReportModel>> fetchTopProductsReport({
    required String dateFrom,
    required String dateTo,
    int? limit,
  });

  Future<Either<Failure, ProfitReportModel>> fetchProfitReport({
    required String dateFrom,
    required String dateTo,
  });

  Future<Either<Failure, SupplierPricesReportModel>> fetchSupplierPricesReport({
    int? productId,
    String? dateFrom,
    String? dateTo,
  });

  Future<Either<Failure, InventoryValueReportModel>> fetchInventoryValueReport();

  Future<Either<Failure, StockHealthReportModel>> fetchStockHealthReport({
    required int expiryDays,
  });
}
