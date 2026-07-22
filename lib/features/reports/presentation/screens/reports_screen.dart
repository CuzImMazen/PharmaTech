import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_cubit.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/inventory_value_report_view.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/profit_report_view.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/sales_report_view.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/stock_health_report_view.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/supplier_prices_report_view.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/top_products_report_view.dart';

/// The Reports hub — replaces the placeholder Reports tab. Provides six report
/// types via a top tab bar, each with independent loading/error/data states and
/// pull-to-refresh.
class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  static const _tabs = <(ReportType, IconData)>[
    (ReportType.sales, LucideIcons.trendingUp),
    (ReportType.topProducts, LucideIcons.award),
    (ReportType.profit, LucideIcons.piggyBank),
    (ReportType.supplierPrices, LucideIcons.truck),
    (ReportType.inventoryValue, LucideIcons.package),
    (ReportType.stockHealth, LucideIcons.heartPulse),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) return;
    final type = _tabs[_tabController.index].$1;
    context.read<ReportsCubit>().selectReportType(type);
  }

  void _showFailureSnackbar(BuildContext context, ReportsState state) {
    final failure = _firstFailure(state);
    if (failure == null) return;
    AppSnackbar.failure(message: failure.localizedMessage(context));
    context.read<ReportsCubit>().clearFailure();
  }

  Failure? _firstFailure(ReportsState state) {
    return state.sales.failure ??
        state.topProducts.failure ??
        state.profit.failure ??
        state.supplierPrices.failure ??
        state.inventoryValue.failure ??
        state.stockHealth.failure;
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.reports_title),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: _tabs.map((tab) {
            return Tab(
              icon: Icon(tab.$2),
              text: _labelFor(tab.$1, tr),
            );
          }).toList(),
        ),
      ),
      body: SafeArea(
        child: BlocListener<ReportsCubit, ReportsState>(
          listenWhen: (p, c) => _firstFailure(p) != _firstFailure(c),
          listener: _showFailureSnackbar,
          child: BlocBuilder<ReportsCubit, ReportsState>(
            buildWhen: (p, c) => p.selectedType != c.selectedType,
            builder: (context, state) {
              _tabController.index = _tabs.indexWhere(
                (t) => t.$1 == state.selectedType,
              );

              return TabBarView(
                controller: _tabController,
                children: const [
                  SalesReportView(),
                  TopProductsReportView(),
                  ProfitReportView(),
                  SupplierPricesReportView(),
                  InventoryValueReportView(),
                  StockHealthReportView(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String _labelFor(ReportType type, AppLocalizations tr) {
    return switch (type) {
      ReportType.sales => tr.reports_sales,
      ReportType.topProducts => tr.reports_top_products,
      ReportType.profit => tr.reports_profit,
      ReportType.supplierPrices => tr.reports_supplier_prices,
      ReportType.inventoryValue => tr.reports_inventory_value,
      ReportType.stockHealth => tr.reports_stock_health,
    };
  }
}
