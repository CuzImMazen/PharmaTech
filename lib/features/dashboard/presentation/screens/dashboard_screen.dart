import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/dashboard/presentation/widgets/header/dashboard_header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(top: false, child: Column(children: [DashboardHeader()])),
    );
  }
}
