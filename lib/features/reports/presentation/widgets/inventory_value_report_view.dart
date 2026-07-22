import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stats_grid/stat_card.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_cubit.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_state.dart';
import 'package:pharmacy_app/features/reports/data/models/inventory_value_report_model.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_empty_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_error_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/reports_shimmer.dart';

class InventoryValueReportView extends StatefulWidget {
  const InventoryValueReportView({super.key});

  @override
  State<InventoryValueReportView> createState() =>
      _InventoryValueReportViewState();
}

class _InventoryValueReportViewState extends State<InventoryValueReportView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<ReportsCubit, ReportsState>(
      buildWhen: (p, c) => p.inventoryValue != c.inventoryValue,
      builder: (context, state) {
        final async = state.inventoryValue;
        final report = async.data;

        if (async.isLoading && report == null) {
          return const ReportsShimmer();
        }

        if (async.failure != null && report == null) {
          return ReportErrorState(
            failure: async.failure!,
            onRetry: () => context
                .read<ReportsCubit>()
                .loadInventoryValueReport(refresh: true),
          );
        }

        if (report == null || report.products.isEmpty) {
          return const ReportEmptyState();
        }

        final summary = report.summary;

        return RefreshIndicator(
          onRefresh: () => context
              .read<ReportsCubit>()
              .loadInventoryValueReport(refresh: true),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
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
                      icon: Icons.inventory_2_outlined,
                      value: _format(summary.totalCostValue),
                      label: context.tr.reports_cost_value,
                      infoValue: _format(summary.totalSellingValue),
                      infoLabel: context.tr.reports_selling_value,
                      color: AppColors.cozyBlue,
                    ),
                    StatCard(
                      icon: Icons.trending_up_rounded,
                      value: _format(summary.totalPotentialProfit),
                      label: context.tr.reports_potential_profit,
                      infoValue: '${summary.overallMargin.toStringAsFixed(1)}%',
                      infoLabel: context.tr.reports_overall_margin,
                      color: AppColors.cozyEmerald,
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

  final InventoryValueProduct product;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: context.rMd,
        border: Border.all(color: context.colors.outline.withAlpha(38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.brandName,
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          context.vXs,
          Text(
            '${tr.reports_category}: ${product.category} · ${tr.reports_quantity}: ${product.totalQuantity}',
            style: context.text.bodySmall?.copyWith(color: context.muted),
          ),
          context.vSm,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MiniValue(
                label: tr.reports_cost_value,
                value: '${product.costValue.toStringAsFixed(0)} ${tr.sp}',
              ),
              _MiniValue(
                label: tr.reports_selling_value,
                value: '${product.sellingValue.toStringAsFixed(0)} ${tr.sp}',
              ),
              _MiniValue(
                label: tr.reports_potential_profit,
                value: '${product.potentialProfit.toStringAsFixed(0)} ${tr.sp}',
                color: AppColors.cozyEmerald,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniValue extends StatelessWidget {
  const _MiniValue({
    required this.label,
    required this.value,
    this.color,
  });

  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.text.labelSmall?.copyWith(color: context.muted),
        ),
        Text(
          value,
          style: context.text.bodySmall?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
