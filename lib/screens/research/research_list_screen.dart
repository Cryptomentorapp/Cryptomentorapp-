
import 'package:flutter/material.dart';
class ResearchListScreen extends StatelessWidget {
  const ResearchListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final coins = const [
      ('BTC / Bitcoin', '\$2.20T · 24h -0.42%', '\$110K'),
      ('ETH / Ethereum', '\$515B · 24h -0.50%', '\$4.27K'),
      ('BNB / BNB', '\$120B · 24h 1.28%', '\$860'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Research Hub')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: coins.length,
        separatorBuilder: (_, __) => const Divider(height: 1, color: Colors.white12),
        itemBuilder: (ctx, i) {
          final c = coins[i];
          return ListTile(title: Text(c.$1, style: const TextStyle(fontSize: 20)), subtitle: Text(c.$2), trailing: Text(c.$3));
        },
      ),
    );
  }
}
