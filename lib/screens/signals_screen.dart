import 'package:flutter/material.dart';
import '../services/binance.dart';
import '../utils/indicators.dart';

class SignalsScreen extends StatefulWidget{ const SignalsScreen({super.key}); @override State<SignalsScreen> createState()=>_SignalsScreenState(); }
class _SignalsScreenState extends State<SignalsScreen>{
  final symbols = ['btcusdt','ethusdt','bnbusdt'];
  final Map<String,String> signals = {};
  bool loading=true;

  Future<void> _calc(String sym) async {
    final b = BinanceWS(sym);
    final closes = await b.fetchCloses(limit: 300, interval: '1m');
    final e9 = ema(closes, 9); final e21 = ema(closes, 21); final r = rsi(closes, 14);
    String s = 'HOLD';
    if(e9.last > e21.last && r.last < 70) s='BUY';
    if(e9.last < e21.last && r.last > 30) s='SELL';
    signals[sym.toUpperCase()] = '$s  ·  EMA9:${e9.last.toStringAsFixed(2)}  EMA21:${e21.last.toStringAsFixed(2)}  RSI:${r.last.toStringAsFixed(1)}';
    setState((){});
  }

  Future<void> _load() async {
    for(final s in symbols){ await _calc(s); }
    loading=false; setState((){});
  }

  @override void initState(){ super.initState(); _load(); }

  @override Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: const Text('Trading Signals')), body:
      loading? const Center(child:CircularProgressIndicator()) :
      ListView.separated(itemCount: symbols.length, separatorBuilder:(_,__)=>const Divider(height:1), itemBuilder: (_,i){
        final key = symbols[i].toUpperCase();
        return ListTile(title: Text(key), subtitle: Text(signals[key] ?? '...'));
      }));
  }
}