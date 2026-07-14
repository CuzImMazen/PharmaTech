import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_state.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stock_alerts/stock_alert_item.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';

/// Real low-stock alerts driven by [DashboardCubit]. Maps each low-stock
/// [ProductCardModel] to a [StockAlertItem] (deriving severity client-side),
/// with empty/error states. Tapping an item opens its product detail screen.
///
/// This widget does not show a loading indicator because the dashboard screen
/// already shows a unified shimmer while [DashboardState.isInitialLoading] is
/// true.
class StockAlertsSection extends StatelessWidget {
  const StockAlertsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (p, c) =>
          p.lowStockProducts != c.lowStockProducts ||
          (p.failure != c.failure && c.lowStockProducts.isEmpty),
      builder: (context, state) {
        final products = state.lowStockProducts;

        if (products.isEmpty && state.failure != null) {
          return SliverToBoxAdapter(
            child: _StockAlertsError(
              onRetry: () => context.read<DashboardCubit>().refreshLowStock(),
            ),
          );
        }

        if (products.isEmpty) {
          return const SliverToBoxAdapter(child: _StockAlertsEmpty());
        }

        final cubit = context.read<DashboardCubit>();
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                for (final product in products)
                  _alertFromProduct(context, cubit, product),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _alertFromProduct(
    BuildContext context,
    DashboardCubit cubit,
    ProductCardModel product,
  ) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final name = isAr && product.arName.isNotEmpty
        ? product.arName
        : product.name;
    return StockAlertItem(
      name: name,
      quantity: '${product.quantity}/${product.minStock}',
      type: cubit.severityFor(product),
      onTap: () => context.push(AppRoutesKeys.productDetailWith(product.id)),
    );
  }
}

class _StockAlertsError extends StatelessWidget {
  const _StockAlertsError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.tr.stock_alerts_error,
            textAlign: TextAlign.center,
            style: context.text.bodyMedium?.copyWith(color: context.muted),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: onRetry,
            child: Text(context.tr.inventory_retry),
          ),
        ],
      ),
    );
  }
}

class _StockAlertsEmpty extends StatelessWidget {
  const _StockAlertsEmpty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              size: context.iXl,
              color: context.muted,
            ),
            const SizedBox(height: 8),
            Text(
              context.tr.stock_alerts_empty,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
