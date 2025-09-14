
import 'package:flutter/material.dart';
import 'signal_detail_screen.dart';
class SignalsListScreen extends StatelessWidget {
  const SignalsListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final items = [
      SignalItem('BTCUSDT', 'Long', 61234.5, 62500, 59800, now.subtract(const Duration(minutes: 10))),
      SignalItem('ETHUSDT', 'Short', 2388.2, 2280, 2450, now.subtract(const Duration(minutes: 30))),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Trading Signals')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (ctx, i) {
          final s = items[i];
          return Card(
            child: ListTile(
              title: Text('${s.symbol} • ${s.side}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text('Entry: ${s.entry}  TP: ${s.tp}  SL: ${s.sl}\nTime: ${s.time}'),
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => SignalDetailScreen(item: s))),
            ),
          );
        },
      ),
    );
  }
}
class SignalItem {
  final String symbol; final String side; final double entry; final double tp; final double sl; final DateTime time;
  SignalItem(this.symbol, this.side, this.entry, this.tp, this.sl, this.time);
}
