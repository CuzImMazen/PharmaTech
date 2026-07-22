import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_state.dart';
import 'package:pharmacy_app/features/reports/data/models/inventory_value_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/profit_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/sales_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/stock_health_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/supplier_prices_report_model.dart';
import 'package:pharmacy_app/features/reports/data/models/top_products_report_model.dart';
import 'package:pharmacy_app/features/reports/data/repo/reports_repository.dart';

/// Drives the Reports hub. Each report is loaded independently and cached in its
/// own [AsyncReport] slot so tab switches are instant after the first load.
class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit({
    required this.reportsRepository,
    required this.inventoryRepository,
  }) : super(
          ReportsState(
            dateRange: DateTimeRange(
              start: DateTime.now().subtract(const Duration(days: 30)),
              end: DateTime.now(),
            ),
          ),
        );

  final ReportsRepository reportsRepository;
  final InventoryRepository inventoryRepository;

  String? get _dateFrom => _toApiDate(state.dateRange?.start);
  String? get _dateTo => _toApiDate(state.dateRange?.end);

  static String? _toApiDate(DateTime? date) {
    if (date == null) return null;
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

  /// Loads the report that matches [state.selectedType].
  /// If the report already has data and [refresh] is false, this is a no-op.
  Future<void> loadSelectedReport({bool refresh = false}) async {
    if (isClosed) return;

    switch (state.selectedType) {
      case ReportType.sales:
        return loadSalesReport(refresh: refresh);
      case ReportType.topProducts:
        return loadTopProductsReport(refresh: refresh);
      case ReportType.profit:
        return loadProfitReport(refresh: refresh);
      case ReportType.supplierPrices:
        return loadSupplierPricesReport(refresh: refresh);
      case ReportType.inventoryValue:
        return loadInventoryValueReport(refresh: refresh);
      case ReportType.stockHealth:
        return loadStockHealthReport(refresh: refresh);
    }
  }

  void selectReportType(ReportType type) {
    if (isClosed || state.selectedType == type) return;
    emit(state.copyWith(selectedType: type));
    loadSelectedReport();
  }

  void setSalesPeriod(SalesPeriod period) {
    if (isClosed || state.salesPeriod == period) return;
    emit(state.copyWith(salesPeriod: period));
    loadSalesReport();
  }

  void setDateRange(DateTimeRange? range) {
    if (isClosed || state.dateRange == range) return;
    emit(state.copyWith(dateRange: range));
    loadSelectedReport();
  }

  void clearDateRange() => setDateRange(null);

  void setTopProductsLimit(int limit) {
    if (isClosed || state.topProductsLimit == limit) return;
    emit(state.copyWith(topProductsLimit: limit));
    loadTopProductsReport();
  }

  void setSupplierPricesProduct(int? productId) {
    if (isClosed || state.supplierPricesProductId == productId) return;
    emit(state.copyWith(supplierPricesProductId: productId));
    loadSupplierPricesReport();
  }

  void setStockHealthExpiryDays(int days) {
    if (isClosed || state.stockHealthExpiryDays == days) return;
    emit(state.copyWith(stockHealthExpiryDays: days));
    loadStockHealthReport();
  }

  void clearFailure() {
    if (isClosed) return;
    emit(
      state.copyWith(
        sales: state.sales.copyWith(failure: null),
        topProducts: state.topProducts.copyWith(failure: null),
        profit: state.profit.copyWith(failure: null),
        supplierPrices: state.supplierPrices.copyWith(failure: null),
        inventoryValue: state.inventoryValue.copyWith(failure: null),
        stockHealth: state.stockHealth.copyWith(failure: null),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Sales
  // ---------------------------------------------------------------------------

  Future<void> loadSalesReport({bool refresh = false}) async {
    if (isClosed) return;
    final current = state.sales;
    if (!refresh && current.data != null && !current.isLoading) return;

    final dateFrom = _dateFrom;
    final dateTo = _dateTo;
    if (dateFrom == null || dateTo == null) return;

    _setSales(loading: !refresh, refreshing: refresh);

    final result = await reportsRepository.fetchSalesReport(
      period: state.salesPeriod.backendValue,
      dateFrom: dateFrom,
      dateTo: dateTo,
    );

    if (isClosed) return;
    _resolve<SalesReportModel>(
      result,
      (data) => state.sales.copyWith(data: data),
      _setSales,
    );
  }

  void _setSales({
    bool? loading,
    bool? refreshing,
    Failure? failure,
    SalesReportModel? data,
  }) {
    emit(
      state.copyWith(
        sales: state.sales.copyWith(
          isLoading: loading ?? state.sales.isLoading,
          isRefreshing: refreshing ?? state.sales.isRefreshing,
          failure: failure,
          data: data,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Top Products
  // ---------------------------------------------------------------------------

  Future<void> loadTopProductsReport({bool refresh = false}) async {
    if (isClosed) return;
    final current = state.topProducts;
    if (!refresh && current.data != null && !current.isLoading) return;

    final dateFrom = _dateFrom;
    final dateTo = _dateTo;
    if (dateFrom == null || dateTo == null) return;

    _setTopProducts(loading: !refresh, refreshing: refresh);

    final result = await reportsRepository.fetchTopProductsReport(
      dateFrom: dateFrom,
      dateTo: dateTo,
      limit: state.topProductsLimit,
    );

    if (isClosed) return;
    _resolve<TopProductsReportModel>(
      result,
      (data) => state.topProducts.copyWith(data: data),
      _setTopProducts,
    );
  }

  void _setTopProducts({
    bool? loading,
    bool? refreshing,
    Failure? failure,
    TopProductsReportModel? data,
  }) {
    emit(
      state.copyWith(
        topProducts: state.topProducts.copyWith(
          isLoading: loading ?? state.topProducts.isLoading,
          isRefreshing: refreshing ?? state.topProducts.isRefreshing,
          failure: failure,
          data: data,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Profit
  // ---------------------------------------------------------------------------

  Future<void> loadProfitReport({bool refresh = false}) async {
    if (isClosed) return;
    final current = state.profit;
    if (!refresh && current.data != null && !current.isLoading) return;

    final dateFrom = _dateFrom;
    final dateTo = _dateTo;
    if (dateFrom == null || dateTo == null) return;

    _setProfit(loading: !refresh, refreshing: refresh);

    final result = await reportsRepository.fetchProfitReport(
      dateFrom: dateFrom,
      dateTo: dateTo,
    );

    if (isClosed) return;
    _resolve<ProfitReportModel>(
      result,
      (data) => state.profit.copyWith(data: data),
      _setProfit,
    );
  }

  void _setProfit({
    bool? loading,
    bool? refreshing,
    Failure? failure,
    ProfitReportModel? data,
  }) {
    emit(
      state.copyWith(
        profit: state.profit.copyWith(
          isLoading: loading ?? state.profit.isLoading,
          isRefreshing: refreshing ?? state.profit.isRefreshing,
          failure: failure,
          data: data,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Supplier Prices
  // ---------------------------------------------------------------------------

  Future<void> loadSupplierPricesReport({bool refresh = false}) async {
    if (isClosed) return;
    final current = state.supplierPrices;
    if (!refresh && current.data != null && !current.isLoading) return;

    _setSupplierPrices(loading: !refresh, refreshing: refresh);

    final result = await reportsRepository.fetchSupplierPricesReport(
      productId: state.supplierPricesProductId,
      dateFrom: _dateFrom,
      dateTo: _dateTo,
    );

    if (isClosed) return;
    _resolve<SupplierPricesReportModel>(
      result,
      (data) => state.supplierPrices.copyWith(data: data),
      _setSupplierPrices,
    );
  }

  void _setSupplierPrices({
    bool? loading,
    bool? refreshing,
    Failure? failure,
    SupplierPricesReportModel? data,
  }) {
    emit(
      state.copyWith(
        supplierPrices: state.supplierPrices.copyWith(
          isLoading: loading ?? state.supplierPrices.isLoading,
          isRefreshing: refreshing ?? state.supplierPrices.isRefreshing,
          failure: failure,
          data: data,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Inventory Value
  // ---------------------------------------------------------------------------

  Future<void> loadInventoryValueReport({bool refresh = false}) async {
    if (isClosed) return;
    final current = state.inventoryValue;
    if (!refresh && current.data != null && !current.isLoading) return;

    _setInventoryValue(loading: !refresh, refreshing: refresh);

    final result = await reportsRepository.fetchInventoryValueReport();

    if (isClosed) return;
    _resolve<InventoryValueReportModel>(
      result,
      (data) => state.inventoryValue.copyWith(data: data),
      _setInventoryValue,
    );
  }

  void _setInventoryValue({
    bool? loading,
    bool? refreshing,
    Failure? failure,
    InventoryValueReportModel? data,
  }) {
    emit(
      state.copyWith(
        inventoryValue: state.inventoryValue.copyWith(
          isLoading: loading ?? state.inventoryValue.isLoading,
          isRefreshing: refreshing ?? state.inventoryValue.isRefreshing,
          failure: failure,
          data: data,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Stock Health
  // ---------------------------------------------------------------------------

  Future<void> loadStockHealthReport({bool refresh = false}) async {
    if (isClosed) return;
    final current = state.stockHealth;
    if (!refresh && current.data != null && !current.isLoading) return;

    _setStockHealth(loading: !refresh, refreshing: refresh);

    final result = await reportsRepository.fetchStockHealthReport(
      expiryDays: state.stockHealthExpiryDays,
    );

    if (isClosed) return;
    _resolve<StockHealthReportModel>(
      result,
      (data) => state.stockHealth.copyWith(data: data),
      _setStockHealth,
    );
  }

  void _setStockHealth({
    bool? loading,
    bool? refreshing,
    Failure? failure,
    StockHealthReportModel? data,
  }) {
    emit(
      state.copyWith(
        stockHealth: state.stockHealth.copyWith(
          isLoading: loading ?? state.stockHealth.isLoading,
          isRefreshing: refreshing ?? state.stockHealth.isRefreshing,
          failure: failure,
          data: data,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  void _resolve<T>(
    Either<Failure, T> result,
    AsyncReport<T> Function(T data) dataMapper,
    void Function({bool? loading, bool? refreshing, Failure? failure, T? data})
        setter, {
    Failure? Function(Failure failure)? transformFailure,
  }) {
    result.fold(
      (Failure failure) => setter(
        loading: false,
        refreshing: false,
        failure: transformFailure?.call(failure) ?? failure,
      ),
      (T data) => setter(
        loading: false,
        refreshing: false,
        data: data,
      ),
    );
  }
}
