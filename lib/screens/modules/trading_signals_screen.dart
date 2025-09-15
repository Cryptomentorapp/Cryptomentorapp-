import 'package:flutter/material.dart';
import '../../services/signals_service.dart';

class TradingSignalsScreen extends StatefulWidget {
  const TradingSignalsScreen({super.key});
  @override State<TradingSignalsScreen> createState() => _SState();
}

class _SState extends State<TradingSignalsScreen> {
  final _symbols = ['BTCUSDT','ETHUSDT','BNBUSDT'];
  bool _loading = true;
  List<Signal> _sigs = [];

  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async {
    try{
      final all = <Signal>[];
      for(final s in _symbols){
        final g = await SignalsService.generate(s);
        all.addAll(g);
      }
      setState(()=>_sigs=all);
    } catch(_){}
    setState(()=>_loading=false);
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trading Signals (demo live)')),
      body: _loading ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (_, i){
              final s = _sigs[i];
              return Card(
                child: ListTile(
                  leading: Icon(
                    s.side=='Long' ? Icons.north_east_rounded : (s.side=='Short'? Icons.south_west_rounded : Icons.more_horiz_rounded),
                    color: s.side=='Long' ? Colors.greenAccent : (s.side=='Short'? Colors.redAccent : Colors.amber),
                  ),
                  title: Text('${s.symbol} • ${s.side}'),
                  subtitle: Text('Entry: ${s.entry.toStringAsFixed(2)} · TP: ${s.tp?.toStringAsFixed(2) ?? '-'} · SL: ${s.sl?.toStringAsFixed(2) ?? '-'}\n${s.note}'),
                  isThreeLine: true,
                ),
              );
            },
            separatorBuilder: (_, __)=> const SizedBox(height: 8),
            itemCount: _sigs.length,
          ),
    );
  }
}
