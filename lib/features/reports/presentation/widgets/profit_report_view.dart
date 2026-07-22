import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stats_grid/stat_card.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_cubit.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_state.dart';
import 'package:pharmacy_app/features/reports/data/models/profit_report_model.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/date_range_filter.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_empty_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_error_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/reports_shimmer.dart';

class ProfitReportView extends StatefulWidget {
  const ProfitReportView({super.key});

  @override
  State<ProfitReportView> createState() => _ProfitReportViewState();
}

class _ProfitReportViewState extends State<ProfitReportView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<ReportsCubit, ReportsState>(
      buildWhen: (p, c) =>
          p.dateRange != c.dateRange || p.profit != c.profit,
      builder: (context, state) {
        final async = state.profit;
        final report = async.data;

        if (async.isLoading && report == null) {
          return const ReportsShimmer();
        }

        if (async.failure != null && report == null) {
          return ReportErrorState(
            failure: async.failure!,
            onRetry: () =>
                context.read<ReportsCubit>().loadProfitReport(refresh: true),
          );
        }

        if (report == null || report.products.isEmpty) {
          return const ReportEmptyState();
        }

        final summary = report.summary;

        return RefreshIndicator(
          onRefresh: () =>
              context.read<ReportsCubit>().loadProfitReport(refresh: true),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr.reports_date_range,
                        style: context.text.titleSmall,
                      ),
                      context.vXs,
                      DateRangeFilter(
                        range: state.dateRange,
                        onChanged: (r) =>
                            context.read<ReportsCubit>().setDateRange(r),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: context.vMd),
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverGrid(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.95,
                  ),
                  delegate: SliverChildListDelegate.fixed([
                    StatCard(
                      icon: Icons.trending_up_rounded,
                      value: _format(summary.totalRevenue),
                      label: context.tr.reports_total_revenue,
                      infoValue: _format(summary.totalCost),
                      infoLabel: context.tr.reports_total_cost,
                      color: AppColors.cozyEmerald,
                    ),
                    StatCard(
                      icon: Icons.account_balance_wallet_outlined,
                      value: _format(summary.totalProfit),
                      label: context.tr.reports_total_profit,
                      infoValue: '${summary.overallMargin.toStringAsFixed(1)}%',
                      infoLabel: context.tr.reports_overall_margin,
                      color: AppColors.cozyBlue,
                    ),
                  ]),
                ),
              ),
              SliverToBoxAdapter(child: context.vMd),
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverList.builder(
                  itemCount: report.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: context.sSm),
                      child: _ProductCard(product: report.products[index]),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(child: context.vLg),
            ],
          ),
        );
      },
    );
  }

  String _format(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(value >= 10000 ? 0 : 1)}k';
    }
    return value.toStringAsFixed(value % 1 == 0 ? 0 : 1);
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final ProfitProductItem product;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final marginColor = product.profitMargin >= 0
        ? AppColors.cozyEmerald
        : AppColors.cozyRed;

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
                Text(
                  '${tr.reports_quantity}: ${product.totalUnitsSold} · ${tr.reports_category}: ${product.category}',
                  style: context.text.bodySmall?.copyWith(color: context.muted),
                ),
                context.vXs,
                Text(
                  '${tr.reports_buying_price}: ${_format(product.avgCostPrice)} ${tr.sp} · '
                  '${tr.reports_selling_price}: ${_format(product.sellingPrice)} ${tr.sp}',
                  style: context.text.bodySmall,
                ),
              ],
            ),
          ),
          context.hSm,
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.sMd,
              vertical: context.sXs,
            ),
            decoration: BoxDecoration(
              color: marginColor.withAlpha(25),
              borderRadius: context.rMd,
            ),
            child: Text(
              '${product.profitMargin.toStringAsFixed(1)}%',
              style: context.text.labelLarge?.copyWith(
                color: marginColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _format(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(value >= 10000 ? 0 : 1)}k';
    }
    return value.toStringAsFixed(value % 1 == 0 ? 0 : 2);
  }
}
