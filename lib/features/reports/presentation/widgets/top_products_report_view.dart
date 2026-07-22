import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_cubit.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_state.dart';
import 'package:pharmacy_app/features/reports/data/models/top_products_report_model.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/date_range_filter.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_empty_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_error_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/reports_shimmer.dart';

class TopProductsReportView extends StatefulWidget {
  const TopProductsReportView({super.key});

  @override
  State<TopProductsReportView> createState() => _TopProductsReportViewState();
}

class _TopProductsReportViewState extends State<TopProductsReportView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  static const _limitOptions = [5, 10, 20, 50];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<ReportsCubit, ReportsState>(
      buildWhen: (p, c) =>
          p.dateRange != c.dateRange ||
          p.topProductsLimit != c.topProductsLimit ||
          p.topProducts != c.topProducts,
      builder: (context, state) {
        final async = state.topProducts;
        final report = async.data;

        if (async.isLoading && report == null) {
          return const ReportsShimmer();
        }

        if (async.failure != null && report == null) {
          return ReportErrorState(
            failure: async.failure!,
            onRetry: () =>
                context.read<ReportsCubit>().loadTopProductsReport(refresh: true),
          );
        }

        if (report == null || report.products.isEmpty) {
          return const ReportEmptyState();
        }

        return RefreshIndicator(
          onRefresh: () =>
              context.read<ReportsCubit>().loadTopProductsReport(refresh: true),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverToBoxAdapter(
                  child: _FilterHeader(
                    range: state.dateRange,
                    limit: state.topProductsLimit,
                    onRangeChanged: (r) =>
                        context.read<ReportsCubit>().setDateRange(r),
                    onLimitChanged: (l) =>
                        context.read<ReportsCubit>().setTopProductsLimit(l),
                  ),
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
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader({
    required this.range,
    required this.limit,
    required this.onRangeChanged,
    required this.onLimitChanged,
  });

  final DateTimeRange? range;
  final int limit;
  final ValueChanged<DateTimeRange?> onRangeChanged;
  final ValueChanged<int> onLimitChanged;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.reports_date_range, style: context.text.titleSmall),
        context.vXs,
        DateRangeFilter(range: range, onChanged: onRangeChanged),
        context.vMd,
        Row(
          children: [
            Text(tr.reports_limit, style: context.text.titleSmall),
            context.hMd,
            DropdownButton<int>(
              value: limit,
              isDense: true,
              underline: const SizedBox.shrink(),
              items: _TopProductsReportViewState._limitOptions
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text('$value'),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) onLimitChanged(value);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final TopProductItem product;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final rankColor = switch (product.rank) {
      1 => AppColors.cozyAmber,
      2 => AppColors.cozyBlue,
      3 => AppColors.cozyPurple,
      _ => context.muted,
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
          _RankBadge(rank: product.rank, color: rankColor),
          context.hMd,
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
                  product.category,
                  style: context.text.bodySmall?.copyWith(color: context.muted),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${product.totalUnitsSold} ${tr.reports_units_sold}',
                style: context.text.titleSmall?.copyWith(
                  color: AppColors.cozyEmerald,
                  fontWeight: FontWeight.bold,
                ),
              ),
              context.vXs,
              Text(
                '${product.totalRevenue.toStringAsFixed(0)} ${tr.sp}',
                style: context.text.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RankBadge extends StatelessWidget {
  const _RankBadge({required this.rank, required this.color});

  final int rank;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.iLg,
      height: context.iLg,
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: rank <= 3
            ? Icon(LucideIcons.trophy, size: context.iMd, color: color)
            : Text(
                '$rank',
                style: context.text.titleSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
