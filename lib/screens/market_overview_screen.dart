import 'package:flutter/material.dart';

class MarketOverviewScreen extends StatelessWidget {
  const MarketOverviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(title: Text('Heatmap (placeholder)')),
        ListTile(title: Text('Top Gainers / Losers (placeholder)')),
        ListTile(title: Text('Screener (placeholder)')),
      ],
    );
  }
}
