import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/stock_adjustments/cubit/stock_adjustment_cubit.dart';
import 'package:pharmacy_app/features/stock_adjustments/cubit/stock_adjustment_state.dart';
import 'package:pharmacy_app/features/stock_adjustments/presentation/widgets/stock_adjustments_shimmer.dart';
import 'package:pharmacy_app/features/stock_adjustments/presentation/widgets/stock_adjustment_tile.dart';

/// Stock Adjustments log: a pharmacy-wide, paginated list of manual stock
/// corrections (add/remove). Read-only — reached from
/// Settings → Operations → Stock Adjustments.
class StockAdjustmentsScreen extends StatefulWidget {
  const StockAdjustmentsScreen({super.key});

  @override
  State<StockAdjustmentsScreen> createState() => _StockAdjustmentsScreenState();
}

class _StockAdjustmentsScreenState extends State<StockAdjustmentsScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.extentAfter < 320) {
      context.read<StockAdjustmentCubit>().loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<StockAdjustmentCubit>();

    return Scaffold(
      appBar: AppBar(title: Text(tr.stock_adjustments_title)),
      body: SafeArea(
        child: BlocBuilder<StockAdjustmentCubit, StockAdjustmentState>(
          builder: (context, state) {
            final showInlineLoading =
                state.isRefreshing && state.adjustments.isNotEmpty;

            if (state.isInitialLoading && state.adjustments.isEmpty) {
              return const StockAdjustmentsShimmer();
            }

            if (state.failure != null && state.adjustments.isEmpty) {
              return _ErrorState(
                message: state.failure!.localizedMessage(context),
                onRetry: cubit.refresh,
              );
            }

            if (state.adjustments.isEmpty) {
              return const _EmptyState();
            }

            return Column(
              children: [
                if (showInlineLoading) const LinearProgressIndicator(),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => cubit.refresh(),
                    child: ListView.separated(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: context.pHorizontal,
                      itemCount:
                          state.adjustments.length +
                          (state.isLoadingMore ? 1 : 0),
                      separatorBuilder: (context, index) => context.vMd,
                      itemBuilder: (context, index) {
                        if (index >= state.adjustments.length) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return StockAdjustmentTile(
                          movement: state.adjustments[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.pAllLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.swap_vert_rounded,
              size: context.iHuge,
              color: context.muted,
            ),
            context.vLg,
            Text(
              context.tr.stock_adjustments_empty,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            context.vSm,
            Text(
              context.tr.stock_adjustments_empty_hint,
              style: context.text.bodyMedium?.copyWith(color: context.muted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

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
