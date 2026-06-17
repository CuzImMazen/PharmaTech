import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/stock_alerts/stock_alert_item.dart';

class StockAlertsSection extends StatelessWidget {
  const StockAlertsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<StockAlertItem> stockAlertsItems = [
      StockAlertItem(
        name: 'Paracetamol',
        quantity: '2/50',
        type: StockAlertType.critical,
      ),
      StockAlertItem(
        name: 'Amoxicillin',
        quantity: '0/50',
        type: StockAlertType.out,
      ),
      StockAlertItem(
        name: 'Vitamin C',
        quantity: '9/20',
        type: StockAlertType.low,
      ),
      StockAlertItem(
        name: 'Azithromycin',
        quantity: '45/300',
        type: StockAlertType.low,
      ),
    ];
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: List.generate(
            stockAlertsItems.length,
            (index) => stockAlertsItems[index],
          ),
        ),
      ),
    );
  }
}
