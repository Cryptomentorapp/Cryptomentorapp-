
import 'package:flutter/material.dart';
class WhalesScreen extends StatelessWidget{
  const WhalesScreen({super.key});
  @override Widget build(BuildContext c){
    final tx = const [
      ('0xWhaleA', 'Buy 1,200 BTC', '5m ago'),
      ('0xWhaleB', 'Sell 20,000 ETH', '18m ago'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Whales Tracker')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: tx.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (ctx, i) => ListTile(title: Text(tx[i].$1), subtitle: Text(tx[i].$2), trailing: Text(tx[i].$3)),
      ),
    );
  }
}
