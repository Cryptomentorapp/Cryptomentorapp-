
import 'package:flutter/material.dart';
import 'signals_list_screen.dart';
class SignalDetailScreen extends StatelessWidget {
  final SignalItem item;
  const SignalDetailScreen({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${item.symbol} • ${item.side}')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _kv('Entry', item.entry.toStringAsFixed(2)),
          _kv('Take Profit', item.tp.toStringAsFixed(2)),
          _kv('Stop Loss', item.sl.toStringAsFixed(2)),
          _kv('Generated at', item.time.toIso8601String()),
          const SizedBox(height: 16),
          const Text('Strategy reasoning (demo)', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          const SizedBox(height: 6),
          const Text('EMA(9/21) crossover + RSI confirmation. Replace with backend analysis soon.'),
        ],
      ),
    );
  }
  Widget _kv(String k, String v) => Card(child: ListTile(title: Text(k), trailing: Text(v, style: const TextStyle(fontWeight: FontWeight.bold))));
}
