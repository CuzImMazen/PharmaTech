import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stats_grid/stat_card.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_cubit.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_state.dart';
import 'package:pharmacy_app/features/reports/data/models/sales_report_model.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/date_range_filter.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_empty_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_error_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/reports_shimmer.dart';

class SalesReportView extends StatefulWidget {
  const SalesReportView({super.key});

  @override
  State<SalesReportView> createState() => _SalesReportViewState();
}

class _SalesReportViewState extends State<SalesReportView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<ReportsCubit, ReportsState>(
      buildWhen: (p, c) =>
          p.selectedType != c.selectedType ||
          p.salesPeriod != c.salesPeriod ||
          p.dateRange != c.dateRange ||
          p.sales != c.sales,
      builder: (context, state) {
        final async = state.sales;
        final report = async.data;

        if (async.isLoading && report == null) {
          return const ReportsShimmer();
        }

        if (async.failure != null && report == null) {
          return ReportErrorState(
            failure: async.failure!,
            onRetry: () =>
                context.read<ReportsCubit>().loadSalesReport(refresh: true),
          );
        }

        if (report == null) return const ReportEmptyState();

        final summary = report.summary;
        final currencyFormatter = _currencyFormatter;

        return RefreshIndicator(
          onRefresh: () =>
              context.read<ReportsCubit>().loadSalesReport(refresh: true),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverToBoxAdapter(
                  child: _FilterHeader(
                    period: state.salesPeriod,
                    range: state.dateRange,
                    onPeriodChanged: (p) =>
                        context.read<ReportsCubit>().setSalesPeriod(p),
                    onRangeChanged: (r) =>
                        context.read<ReportsCubit>().setDateRange(r),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: context.vMd),
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.95,
                  ),
                  delegate: SliverChildListDelegate.fixed([
                    StatCard(
                      icon: Icons.trending_up_rounded,
                      value: currencyFormatter(summary.totalRevenue),
                      label: context.tr.reports_total_revenue,
                      infoValue: '${summary.totalInvoices}',
                      infoLabel: context.tr.reports_total_invoices,
                      color: AppColors.cozyEmerald,
                    ),
                    StatCard(
                      icon: Icons.shopping_cart_outlined,
                      value: '${summary.unitsSold}',
                      label: context.tr.reports_units_sold,
                      infoValue: currencyFormatter(summary.avgInvoiceValue),
                      infoLabel: context.tr.reports_avg_invoice,
                      color: AppColors.cozyBlue,
                    ),
                    StatCard(
                      icon: Icons.payments_outlined,
                      value: currencyFormatter(summary.totalCollected),
                      label: context.tr.reports_total_collected,
                      infoValue: currencyFormatter(summary.totalOutstanding),
                      infoLabel: context.tr.reports_total_outstanding,
                      color: AppColors.cozyPurple,
                    ),
                    StatCard(
                      icon: Icons.discount_outlined,
                      value: currencyFormatter(summary.totalTax),
                      label: context.tr.invoice_tax_total,
                      infoValue: currencyFormatter(summary.totalDiscount),
                      infoLabel: context.tr.invoice_discount_total,
                      color: AppColors.cozyAmber,
                    ),
                  ]),
                ),
              ),
              SliverToBoxAdapter(child: context.vMd),
              if (report.breakdown.isNotEmpty)
                SliverPadding(
                  padding: context.pHorizontal,
                  sliver: SliverToBoxAdapter(
                    child: _BreakdownChart(
                      breakdown: report.breakdown,
                      period: report.period,
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

  String _currencyFormatter(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(value >= 10000 ? 0 : 1)}k';
    }
    return value.toStringAsFixed(value % 1 == 0 ? 0 : 1);
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader({
    required this.period,
    required this.range,
    required this.onPeriodChanged,
    required this.onRangeChanged,
  });

  final SalesPeriod period;
  final DateTimeRange? range;
  final ValueChanged<SalesPeriod> onPeriodChanged;
  final ValueChanged<DateTimeRange?> onRangeChanged;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.reports_period, style: context.text.titleSmall),
        context.vXs,
        SegmentedButton<SalesPeriod>(
          segments: [
            ButtonSegment(
              value: SalesPeriod.daily,
              label: Text(tr.reports_period_daily),
            ),
            ButtonSegment(
              value: SalesPeriod.weekly,
              label: Text(tr.reports_period_weekly),
            ),
            ButtonSegment(
              value: SalesPeriod.monthly,
              label: Text(tr.reports_period_monthly),
            ),
          ],
          selected: {period},
          onSelectionChanged: (set) => onPeriodChanged(set.first),
        ),
        context.vMd,
        Text(tr.reports_date_range, style: context.text.titleSmall),
        context.vXs,
        DateRangeFilter(range: range, onChanged: onRangeChanged),
      ],
    );
  }
}

class _BreakdownChart extends StatelessWidget {
  const _BreakdownChart({required this.breakdown, required this.period});

  final List<SalesBreakdownPoint> breakdown;
  final String period;

  @override
  Widget build(BuildContext context) {
    final maxRevenue =
        breakdown.map((b) => b.revenue).reduce(math.max).clamp(1.0, double.infinity);
    final safeMax = maxRevenue == 0 ? 1.0 : maxRevenue;

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
            context.tr.reports_total_revenue,
            style: context.text.titleMedium,
          ),
          context.vMd,
          SizedBox(
            height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: breakdown.map((point) {
                final ratio = point.revenue / safeMax;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _formatRevenue(point.revenue),
                          style: TextStyle(
                            fontSize: 8,
                            color: context.colors.onSurface.withAlpha(115),
                          ),
                        ),
                        context.vXs,
                        Container(
                          height: 80 * ratio,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                          ),
                        ),
                        context.vXs,
                        Text(
                          _labelFor(point.periodLabel),
                          style: TextStyle(
                            fontSize: 8,
                            color: context.colors.onSurface.withAlpha(115),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  String _formatRevenue(double revenue) {
    if (revenue >= 1000) {
      return '${(revenue / 1000).toStringAsFixed(revenue >= 10000 ? 0 : 1)}k';
    }
    return revenue.toStringAsFixed(revenue % 1 == 0 ? 0 : 1);
  }

  String _labelFor(String raw) {
    // Keep labels short: weekly -> "W01", monthly -> "Jan", daily -> day only.
    final dateOnly = DateFormatter.toDateOnly(raw);
    if (dateOnly != null) {
      final parts = dateOnly.split('-');
      if (parts.length == 3) return '${parts[2]}/${parts[1]}';
    }
    if (raw.contains('-W')) return raw.substring(raw.indexOf('W'));
    return raw;
  }
}
