import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_cubit.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_detail/product_detail_state.dart';
import 'package:pharmacy_app/features/inventory/presentation/screens/add_batch_screen.dart';
import 'package:pharmacy_app/features/inventory/presentation/screens/remove_stock_screen.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/batches_tab.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/medical_info_tab.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/overview_tab.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/product_detail_app_bar.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/product_detail_shimmer.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/stock_movements_tab.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  ProductDetailCubit get _cubit => context.read<ProductDetailCubit>();

  void _openAddBatchSheet(int productId) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider<ProductDetailCubit>.value(
          value: _cubit,
          child: AddBatchScreen(productId: productId),
        ),
      ),
    );
  }

  void _openRemoveStockSheet(int productId) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider<ProductDetailCubit>.value(
          value: _cubit,
          child: RemoveStockScreen(productId: productId),
        ),
      ),
    );
  }

  void _confirmDeleteProduct() {
    final tr = context.tr;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.product_delete_title),
        content: Text(tr.product_delete_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(tr.detail_cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _cubit.deleteProduct(widget.productId);
            },
            child: Text(tr.detail_delete),
          ),
        ],
      ),
    );
  }

  void _confirmRestoreProduct() {
    final tr = context.tr;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.restore_product_title),
        content: Text(tr.product_restore_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(tr.detail_cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _cubit.restoreProduct(widget.productId);
            },
            child: Text(tr.product_restore),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteMedicalInfo() {
    final tr = context.tr;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.medical_info_delete_title),
        content: Text(tr.medical_info_delete_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(tr.detail_cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _cubit.deleteMedicalInfo(widget.productId);
            },
            child: Text(tr.detail_delete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return BlocListener<ProductDetailCubit, ProductDetailState>(
      listenWhen: (p, c) =>
          // Medical mutation outcomes.
          p.lastMedicalAction != c.lastMedicalAction ||
          p.medicalFailure != c.medicalFailure ||
          // Batch mutation outcomes.
          p.lastBatchAction != c.lastBatchAction ||
          p.batchFailure != c.batchFailure ||
          // Product delete outcome.
          (!p.isProductDeleted && c.isProductDeleted) ||
          // Product restore outcome.
          (!p.isProductRestored && c.isProductRestored) ||
          p.failure != c.failure,
      listener: (context, state) {
        // Product restored → pop back to inventory (list refreshes).
        if (state.isProductRestored) {
          AppSnackbar.success(message: tr.product_restored);
          _cubit.clearProductRestored();
          context.pop(true);
          return;
        }

        // Product deleted → pop back to inventory.
        if (state.isProductDeleted) {
          AppSnackbar.success(message: tr.product_deleted);
          _cubit.clearProductDeleted();
          context.pop(true);
          return;
        }

        // Batch mutation outcomes.
        if (state.lastBatchAction != null) {
          AppSnackbar.success(
            message: switch (state.lastBatchAction!) {
              BatchActionResult.added => tr.detail_batch_added,
              BatchActionResult.markedExpired => tr.detail_batch_marked_expired,
              BatchActionResult.removed => tr.stock_removed,
            },
          );
          _cubit.clearBatchAction();
          return;
        }
        if (state.batchFailure != null) {
          AppSnackbar.failure(
            message: state.batchFailure!.localizedMessage(context),
          );
          _cubit.clearBatchAction();
          return;
        }

        // Medical info outcomes.
        final action = state.lastMedicalAction;
        if (action != null) {
          AppSnackbar.success(
            message: action == MedicalActionResult.saved
                ? tr.medical_info_saved
                : tr.medical_info_deleted,
          );
          _cubit.clearMedicalAction();
          return;
        }
        if (state.medicalFailure != null) {
          AppSnackbar.failure(
            message: state.medicalFailure!.localizedMessage(context),
          );
          return;
        }

        // Hard failure (e.g. delete product failed, or load failed on retry).
        if (state.failure != null) {
          AppSnackbar.failure(
            message: state.failure!.localizedMessage(context),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              final product = state.product;

              // Initial load: shimmer.
              if (state.isInitialLoading && product == null) {
                return _DetailScaffold(
                  tabController: _tabController,
                  appBar: ProductDetailAppBar(
                    title: '',
                    subtitle: '',
                  ),
                  body: const ProductDetailShimmer(),
                );
              }

              // Hard load failure (no product).
              if (product == null && state.failure != null) {
                return _DetailScaffold(
                  tabController: _tabController,
                  appBar: ProductDetailAppBar(title: '', subtitle: ''),
                  body: _DetailError(
                    message: state.failure!.localizedMessage(context),
                    onRetry: () => _cubit.loadAll(widget.productId),
                  ),
                );
              }

              if (product == null) {
                return _DetailScaffold(
                  tabController: _tabController,
                  appBar: ProductDetailAppBar(title: '', subtitle: ''),
                  body: const SizedBox.shrink(),
                );
              }

              final subtitle = product.scientificName?.isNotEmpty == true
                  ? product.scientificName!
                  : product.category.name;

              return _DetailScaffold(
                tabController: _tabController,
                appBar: ProductDetailAppBar(
                  title: product.brandName,
                  subtitle: subtitle,
                  onRestore: product.isDeleted ? _confirmRestoreProduct : null,
                  onEdit: () async {
                    await context.push(
                      AppRoutesKeys.productEditWith(product.id),
                      extra: product,
                    );
                    // Refresh after returning from the edit form.
                    if (context.mounted) _cubit.loadAll(widget.productId);
                  },
                  onDelete: _confirmDeleteProduct,
                ),
                body: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: context.colors.outline.withAlpha(120),
                            width: 1,
                          ),
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: context.primary,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 3,
                        labelColor: context.primary,
                        unselectedLabelColor: context.muted,
                        labelStyle: context.text.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: context.text.titleSmall,
                        tabs: [
                          Tab(text: tr.detail_tab_overview),
                          Tab(text: tr.detail_tab_batches),
                          Tab(text: tr.detail_tab_medical),
                          Tab(text: tr.detail_tab_movements),
                        ],
                      ),
                    ),
                    context.vMd,
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          OverviewTab(product: product),
                          BatchesTab(
                            batches: state.batches,
                            mutatingBatchId: state.mutatingBatchId,
                            onAddBatch: () => _openAddBatchSheet(product.id),
                            onRemoveStock: () =>
                                _openRemoveStockSheet(product.id),
                            onMarkExpired: (batchId) =>
                                _cubit.markBatchExpired(batchId),
                          ),
                          MedicalInfoTab(
                            medicalInfo: state.medicalInfo,
                            onAdd: () async {
                              await context.push(
                                AppRoutesKeys.medicalInfoEditWith(product.id),
                                extra: state.medicalInfo,
                              );
                              if (context.mounted) {
                                _cubit.reloadMedicalInfo(widget.productId);
                              }
                            },
                            onEdit: () async {
                              await context.push(
                                AppRoutesKeys.medicalInfoEditWith(product.id),
                                extra: state.medicalInfo,
                              );
                              if (context.mounted) {
                                _cubit.reloadMedicalInfo(widget.productId);
                              }
                            },
                            onDelete: _confirmDeleteMedicalInfo,
                            isDeleting: state.isMedicalDeleting,
                          ),
                          StockMovementsTab(
                            movements: state.movements,
                            isLoading: state.isMovementsLoading,
                            onRetry: () =>
                                _cubit.reloadStockMovements(widget.productId),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Wraps the AppBar + body so loading/error states keep the same scaffold
/// shape (AppBar is shown even during shimmer for a stable layout).
class _DetailScaffold extends StatelessWidget {
  const _DetailScaffold({
    required this.tabController,
    required this.appBar,
    required this.body,
  });

  final TabController tabController;
  final Widget appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [appBar, Expanded(child: body)],
    );
  }
}

class _DetailError extends StatelessWidget {
  const _DetailError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.pHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            context.vMd,
            FilledButton(
              onPressed: onRetry,
              child: Text(context.tr.inventory_retry),
            ),
          ],
        ),
      ),
    );
  }
}
