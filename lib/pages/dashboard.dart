import 'package:flutter/material.dart';
import '../widgets/cm_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        CMCard(title: 'Balance', subtitle: 'Equity & PnL', leading: Icon(Icons.account_balance_wallet_outlined)),
        SizedBox(height: 12),
        CMCard(title: 'Market Overview', subtitle: 'BTC/ETH/CMT snapshot', leading: Icon(Icons.show_chart)),
        SizedBox(height: 12),
        CMCard(title: 'Latest Signals', subtitle: 'Valid / Late / Invalid', leading: Icon(Icons.notifications_active_outlined)),
      ],
    );
  }
}