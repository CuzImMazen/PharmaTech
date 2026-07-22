import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/reports/data/models/inventory_value_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/profit_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/sales_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/stock_health_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/supplier_prices_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/top_products_report_model.dart';

part 'reports_state.freezed.dart';

/// The report tab currently visible to the user.
enum ReportType {
  sales,
  topProducts,
  profit,
  supplierPrices,
  inventoryValue,
  stockHealth,
}

/// Period granularity for the sales report.
enum SalesPeriod { daily, weekly, monthly }

extension SalesPeriodX on SalesPeriod {
  String get backendValue => switch (this) {
    SalesPeriod.daily => 'daily',
    SalesPeriod.weekly => 'weekly',
    SalesPeriod.monthly => 'monthly',
  };
}

/// A generic wrapper around any report response so every report tab can have
/// its own loading, error, and data lifecycle without duplicating fields.
@freezed
abstract class AsyncReport<T> with _$AsyncReport<T> {
  const AsyncReport._();

  const factory AsyncReport({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    Failure? failure,
    T? data,
  }) = _AsyncReport<T>;

  bool get hasData => data != null;
  bool get hasError => failure != null;
  bool get isInitial =>
      !isLoading && !isRefreshing && data == null && failure == null;
}

/// State for the Reports hub.
@freezed
abstract class ReportsState with _$ReportsState {
  const ReportsState._();

  const factory ReportsState({
    @Default(ReportType.sales) ReportType selectedType,
    @Default(SalesPeriod.daily) SalesPeriod salesPeriod,
    DateTimeRange? dateRange,
    @Default(10) int topProductsLimit,
    @Default(90) int stockHealthExpiryDays,
    int? supplierPricesProductId,
    @Default(AsyncReport()) AsyncReport<SalesReportModel> sales,
    @Default(AsyncReport()) AsyncReport<TopProductsReportModel> topProducts,
    @Default(AsyncReport()) AsyncReport<ProfitReportModel> profit,
    @Default(AsyncReport())
    AsyncReport<SupplierPricesReportModel> supplierPrices,
    @Default(AsyncReport())
    AsyncReport<InventoryValueReportModel> inventoryValue,
    @Default(AsyncReport()) AsyncReport<StockHealthReportModel> stockHealth,
  }) = _ReportsState;
}
