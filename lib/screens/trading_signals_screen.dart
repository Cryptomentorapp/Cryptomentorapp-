import 'package:flutter/material.dart';
import '../models/signal.dart';

class TradingSignalsScreen extends StatelessWidget {
  const TradingSignalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <Signal>[
      Signal(symbol: 'BTCUSDT', side: 'BUY', entry: 61234.5, tp: 62500, sl: 59800, time: DateTime.now().subtract(const Duration(minutes: 10))),
      Signal(symbol: 'ETHUSDT', side: 'SELL', entry: 2388.2, tp: 2280, sl: 2450, time: DateTime.now().subtract(const Duration(minutes: 32))),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final s = items[i];
        final sideColor = s.side == 'BUY' ? Colors.greenAccent : Colors.redAccent;
        final sig = s.side == 'BUY' ? 'Long' : 'Short';
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundColor: sideColor, child: Text(s.symbol.substring(0,1))),
            title: Text('${s.symbol} • $sig'),
            subtitle: Text(
              'Entry: ${s.entry}  TP: ${s.tp ?? '—'}  SL: ${s.sl ?? '—'}\n'
              'Time: ${s.time.toLocal()}',
            ),
            trailing: Icon(Icons.chevron_right, color: sideColor),
            onTap: (){},
          ),
        );
      },
    );
  }
}
