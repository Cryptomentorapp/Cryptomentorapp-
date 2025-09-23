import 'package:flutter/material.dart';
import '../widgets/cm_card.dart';
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        CMCard(title: 'Balance', subtitle: 'Equity & PnL', leading: const Icon(Icons.account_balance_wallet_outlined)),
        const SizedBox(height: 12),
        CMCard(title: 'Market Overview', subtitle: 'BTC/ETH/CMT snapshot', leading: const Icon(Icons.show_chart)),
        const SizedBox(height: 12),
        CMCard(title: 'Latest Signals', subtitle: 'Valid / Late / Invalid', leading: const Icon(Icons.notifications_active_outlined)),
      ],
    );
  }
}