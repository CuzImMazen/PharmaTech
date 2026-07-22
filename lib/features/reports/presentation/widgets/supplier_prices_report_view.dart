import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/helpers/date_formatter.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_cubit.dart';
import 'package:pharmacy_app/features/reports/cubit/reports_state.dart';
import 'package:pharmacy_app/features/reports/data/models/supplier_prices_report_model.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/date_range_filter.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_empty_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/report_error_state.dart';
import 'package:pharmacy_app/features/reports/presentation/widgets/reports_shimmer.dart';

class SupplierPricesReportView extends StatefulWidget {
  const SupplierPricesReportView({super.key});

  @override
  State<SupplierPricesReportView> createState() =>
      _SupplierPricesReportViewState();
}

class _SupplierPricesReportViewState extends State<SupplierPricesReportView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<ProductCardModel> _products = [];
  bool _loadingProducts = false;
  bool _productsError = false;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    if (_loadingProducts) return;
    setState(() {
      _loadingProducts = true;
      _productsError = false;
    });

    final cubit = context.read<ReportsCubit>();
    final result = await cubit.inventoryRepository.fetchProducts(perPage: 200);

    if (!mounted) return;
    result.fold(
      (_) => setState(() {
        _productsError = true;
        _loadingProducts = false;
      }),
      (page) => setState(() {
        _products = page.products;
        _loadingProducts = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final tr = context.tr;

    return BlocBuilder<ReportsCubit, ReportsState>(
      buildWhen: (p, c) =>
          p.dateRange != c.dateRange ||
          p.supplierPricesProductId != c.supplierPricesProductId ||
          p.supplierPrices != c.supplierPrices,
      builder: (context, state) {
        final async = state.supplierPrices;
        final report = async.data;

        if (async.isLoading && report == null) {
          return const ReportsShimmer();
        }

        if (async.failure != null && report == null) {
          return ReportErrorState(
            failure: async.failure!,
            onRetry: () => context
                .read<ReportsCubit>()
                .loadSupplierPricesReport(refresh: true),
          );
        }

        final selectedProduct = _products.cast<ProductCardModel?>().firstWhere(
              (p) => p?.id == state.supplierPricesProductId,
              orElse: () => null,
            );

        if (selectedProduct == null) {
          return _ProductSelector(
            products: _products,
            isLoading: _loadingProducts,
            hasError: _productsError,
            selectedId: state.supplierPricesProductId,
            onRetry: _loadProducts,
            onSelected: (id) =>
                context.read<ReportsCubit>().setSupplierPricesProduct(id),
          );
        }

        final product = report?.products.firstWhere(
          (p) => p.productId == selectedProduct.id,
          orElse: () => SupplierPriceProduct(
            productId: selectedProduct.id,
            brandName: selectedProduct.name,
            arName: selectedProduct.arName,
            category: selectedProduct.category.name,
            minCost: 0,
            maxCost: 0,
            avgCost: 0,
            purchases: const [],
          ),
        );

        return RefreshIndicator(
          onRefresh: () => context
              .read<ReportsCubit>()
              .loadSupplierPricesReport(refresh: true),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: context.pHorizontal,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProductSelector(
                        products: _products,
                        isLoading: _loadingProducts,
                        hasError: _productsError,
                        selectedId: state.supplierPricesProductId,
                        onRetry: _loadProducts,
                        onSelected: (id) => context
                            .read<ReportsCubit>()
                            .setSupplierPricesProduct(id),
                      ),
                      context.vMd,
                      Text(
                        tr.reports_date_range,
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
              if (product != null)
                SliverPadding(
                  padding: context.pHorizontal,
                  sliver: SliverToBoxAdapter(
                    child: _ProductSummary(product: product),
                  ),
                ),
              SliverToBoxAdapter(child: context.vMd),
              if (product != null && product.purchases.isEmpty)
                const SliverFillRemaining(
                  child: ReportEmptyState(),
                )
              else if (product != null)
                SliverPadding(
                  padding: context.pHorizontal,
                  sliver: SliverList.builder(
                    itemCount: product.purchases.length,
                    itemBuilder: (context, index) {
                      final purchase = product.purchases[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: context.sSm),
                        child: _PurchaseRow(purchase: purchase),
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

class _ProductSelector extends StatelessWidget {
  const _ProductSelector({
    required this.products,
    required this.isLoading,
    required this.hasError,
    this.selectedId,
    required this.onRetry,
    required this.onSelected,
  });

  final List<ProductCardModel> products;
  final bool isLoading;
  final bool hasError;
  final int? selectedId;
  final VoidCallback onRetry;
  final ValueChanged<int?> onSelected;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    if (isLoading && products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (hasError && products.isEmpty) {
      return ReportErrorState(
        failure: const UnknownFailure(),
        onRetry: onRetry,
      );
    }

    return DropdownButtonFormField<int?>(
      isExpanded: true,
      initialValue: selectedId,
      decoration: InputDecoration(
        labelText: tr.reports_select_product,
        border: OutlineInputBorder(borderRadius: context.rMd),
      ),
      items: [
        DropdownMenuItem<int?>(
          value: null,
          child: Text(tr.reports_select_product),
        ),
        ...products.map(
          (product) => DropdownMenuItem<int?>(
            value: product.id,
            child: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
      onChanged: onSelected,
    );
  }
}

class _ProductSummary extends StatelessWidget {
  const _ProductSummary({required this.product});

  final SupplierPriceProduct product;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(15),
        borderRadius: context.rMd,
        border: Border.all(color: AppColors.primary.withAlpha(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.brandName,
            style: context.text.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          context.vXs,
          Text(
            '${tr.reports_category}: ${product.category}',
            style: context.text.bodySmall?.copyWith(color: context.muted),
          ),
          context.vSm,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MiniStat(
                label: tr.reports_buying_price,
                value: '${product.minCost.toStringAsFixed(0)} ${tr.sp}',
              ),
              _MiniStat(
                label: tr.reports_buying_price,
                value: '${product.maxCost.toStringAsFixed(0)} ${tr.sp}',
              ),
              _MiniStat(
                label: tr.reports_avg_invoice,
                value: '${product.avgCost.toStringAsFixed(0)} ${tr.sp}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value});

  final String label;
  final String value;

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
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _PurchaseRow extends StatelessWidget {
  const _PurchaseRow({required this.purchase});

  final SupplierPurchaseRow purchase;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  purchase.supplierName,
                  style: context.text.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (purchase.invoiceNumber != null)
                Text(
                  purchase.invoiceNumber!,
                  style: context.text.bodySmall?.copyWith(color: context.muted),
                ),
            ],
          ),
          context.vXs,
          if (purchase.batchNumber != null)
            Text(
              '${tr.reports_batch_number}: ${purchase.batchNumber}',
              style: context.text.bodySmall?.copyWith(color: context.muted),
            ),
          context.vXs,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MiniValue(
                label: tr.reports_buying_price,
                value: '${purchase.unitCost.toStringAsFixed(0)} ${tr.sp}',
              ),
              _MiniValue(
                label: tr.reports_selling_price,
                value: '${purchase.unitSellingPrice.toStringAsFixed(0)} ${tr.sp}',
              ),
              _MiniValue(
                label: tr.reports_margin,
                value: '${purchase.margin.toStringAsFixed(1)}%',
                color: purchase.margin >= 0
                    ? AppColors.cozyEmerald
                    : AppColors.cozyRed,
              ),
            ],
          ),
          if (purchase.invoiceDate != null) ...[
            context.vXs,
            Text(
              '${tr.reports_invoice_date}: ${DateFormatter.toDateOnly(purchase.invoiceDate) ?? purchase.invoiceDate}',
              style: context.text.bodySmall?.copyWith(color: context.muted),
            ),
          ],
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
