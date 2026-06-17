// Refactored Card using SliverList instead of a nested ListView
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/recent_transactions/recent_transactions_item.dart';

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const List<RecentTransactionsItem> recentTransactions = [
      RecentTransactionsItem(),
      RecentTransactionsItem(),
      RecentTransactionsItem(),
      RecentTransactionsItem(),
      RecentTransactionsItem(),
    ];

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
            children: List.generate(recentTransactions.length, (index) {
              final isLast = index == recentTransactions.length - 1;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  recentTransactions[index],
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
  }
}
