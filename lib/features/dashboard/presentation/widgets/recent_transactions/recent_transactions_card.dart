import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_state.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/recent_transactions/recent_transactions_item.dart';

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (p, c) =>
          p.recentTransactions != c.recentTransactions ||
          p.failure != c.failure,
      builder: (context, state) {
        final transactions = state.recentTransactions;
        final isFailure = state.failure != null && transactions.isEmpty;

        if (transactions.isEmpty) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: context.rMd,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withAlpha(38),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isFailure
                          ? context.tr.stock_alerts_error
                          : context.tr.no_recent_transactions,
                      style: context.text.bodyMedium?.copyWith(
                        color: context.muted,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (isFailure) ...[
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        onPressed: () =>
                            context.read<DashboardCubit>().refreshTransactions(),
                        icon: const Icon(Icons.refresh_rounded, size: 16),
                        label: Text(context.tr.inventory_retry),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: context.rMd,
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withAlpha(38),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(transactions.length, (index) {
                  final transaction = transactions[index];
                  final isLast = index == transactions.length - 1;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RecentTransactionsItem(transaction: transaction),
                      if (!isLast)
                        Divider(
                          color: Theme.of(
                            context,
                          ).colorScheme.outline.withAlpha(70),
                          height: 1,
                          thickness: 1,
                        ),
                    ],
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
