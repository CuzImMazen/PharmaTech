import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stats_grid/stat_card.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_cubit.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_state.dart';
import 'package:pharmacy_app/features/reports/data/models/stock_health_report_model.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_empty_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_error_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/reports_shimmer.dart';

class StockHealthReportView extends StatefulWidget {
  const StockHealthReportView({super.key});

  @override
  State<StockHealthReportView> createState() => _StockHealthReportViewState();
}

class _StockHealthReportViewState extends State<StockHealthReportView>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<ReportsCubit, ReportsState>(
      buildWhen: (p, c) =>
          p.stockHealthExpiryDays != c.stockHealthExpiryDays ||
          p.stockHealth != c.stockHealth,
      builder: (context, state) {
        final async = state.stockHealth;
        final report = async.data;

        if (async.isLoading && report == null) {
          return const ReportsShimmer();
        }

        if (async.failure != null && report == null) {
          return ReportErrorState(
            failure: async.failure!,
            onRetry: () => context
                .read<ReportsCubit>()
                .loadStockHealthReport(refresh: true),
          );
        }

        if (report == null) {
          return const ReportEmptyState();
        }

        final summary = report.summary;
        final expiringSoon = report.expiringSoon;
        final lowStock = report.lowStock;
        final deadStock = report.deadStock;

        return RefreshIndicator(
          onRefresh: () => context
              .read<ReportsCubit>()
              .loadStockHealthReport(refresh: true),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: context.vMd),
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverGrid(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.0,
                  ),
                  delegate: SliverChildListDelegate.fixed([
                    StatCard(
                      icon: LucideIcons.calendarClock,
                      value: '${summary.expiringSoonCount}',
                      label: context.tr.reports_expiring_soon,
                      infoValue: '',
                      infoLabel: '',
                      color: AppColors.cozyAmber,
                    ),
                    StatCard(
                      icon: LucideIcons.triangleAlert,
                      value: '${summary.lowStockCount}',
                      label: context.tr.reports_low_stock,
                      infoValue: '',
                      infoLabel: '',
                      color: AppColors.cozyRed,
                    ),
                    StatCard(
                      icon: LucideIcons.packageX,
                      value: '${summary.deadStockCount}',
                      label: context.tr.reports_dead_stock,
                      infoValue: '',
                      infoLabel: '',
                      color: AppColors.cozyPurple,
                    ),
                  ]),
                ),
              ),
              SliverToBoxAdapter(child: context.vMd),
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverToBoxAdapter(
                  child: _ExpiryChips(
                    selectedDays: state.stockHealthExpiryDays,
                    onChanged: (days) => context
                        .read<ReportsCubit>()
                        .setStockHealthExpiryDays(days),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: context.vMd),
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverToBoxAdapter(
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      Tab(text: '${context.tr.reports_expiring_soon} (${expiringSoon.length})'),
                      Tab(text: '${context.tr.reports_low_stock} (${lowStock.length})'),
                      Tab(text: '${context.tr.reports_dead_stock} (${deadStock.length})'),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 420,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _ProductList(products: expiringSoon, type: _HealthType.expiring),
                        _ProductList(products: lowStock, type: _HealthType.lowStock),
                        _ProductList(products: deadStock, type: _HealthType.deadStock),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: context.vLg),
            ],
          ),
        );
      },
    );
  }
}

class _ExpiryChips extends StatelessWidget {
  const _ExpiryChips({
    required this.selectedDays,
    required this.onChanged,
  });

  final int selectedDays;
  final ValueChanged<int> onChanged;

  static final _options = [7, 30, 60, 90, 180];

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.reports_expiry_days, style: context.text.titleSmall),
        context.vXs,
        Wrap(
          spacing: 8,
          children: _options.map((days) {
            final selected = days == selectedDays;
            return ChoiceChip(
              label: Text('$days'),
              selected: selected,
              onSelected: (_) => onChanged(days),
            );
          }).toList(),
        ),
      ],
    );
  }
}

enum _HealthType { expiring, lowStock, deadStock }

class _ProductList extends StatelessWidget {
  const _ProductList({required this.products, required this.type});

  final List<StockHealthProduct> products;
  final _HealthType type;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const ReportEmptyState();
    }

    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: context.sSm),
          child: _HealthCard(product: products[index], type: type),
        );
      },
    );
  }
}

class _HealthCard extends StatelessWidget {
  const _HealthCard({required this.product, required this.type});

  final StockHealthProduct product;
  final _HealthType type;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    final (color, badgeText) = switch (type) {
      _HealthType.expiring => (
          AppColors.cozyAmber,
          '${product.daysUntilExpiry ?? '-'} ${tr.reports_expiry_days}',
        ),
      _HealthType.lowStock => (
          product.currentStock == 0 ? AppColors.cozyRed : AppColors.cozyAmber,
          product.currentStock == 0
              ? tr.stock_status_out
              : tr.stock_status_low,
        ),
      _HealthType.deadStock => (AppColors.cozyPurple, tr.reports_dead_stock),
    };

    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: context.rMd,
        border: Border.all(color: context.colors.outline.withAlpha(38)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.brandName,
                  style: context.text.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                context.vXs,
                if (product.category != null)
                  Text(
                    product.category!,
                    style: context.text.bodySmall?.copyWith(color: context.muted),
                  ),
                if (type == _HealthType.expiring) ...[
                  context.vXs,
                  Text(
                    '${tr.detail_expiry}: ${DateFormatter.toDateOnly(product.expiryDate) ?? product.expiryDate ?? '-'}',
                    style: context.text.bodySmall,
                  ),
                ],
              ],
            ),
          ),
          context.hSm,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.sMd,
                  vertical: context.sXs,
                ),
                decoration: BoxDecoration(
                  color: color.withAlpha(25),
                  borderRadius: context.rMd,
                ),
                child: Text(
                  badgeText,
                  style: context.text.labelLarge?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              context.vXs,
              Text(
                '${tr.reports_quantity}: ${product.quantityOnHand ?? product.currentStock ?? '-'}',
                style: context.text.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
