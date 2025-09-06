import 'package:flutter/material.dart';
import '../services/binance.dart';
import '../utils/format.dart';

class MarketScreen extends StatefulWidget{ const MarketScreen({super.key}); @override State<MarketScreen> createState()=>_MarketScreenState(); }
class _MarketScreenState extends State<MarketScreen>{
  final syms = ['BTCUSDT','ETHUSDT','BNBUSDT','SOLUSDT'];
  final Map<String,double> price = {};
  final Map<String,BinanceWS> streams = {};

  @override void initState(){
    super.initState();
    for(final s in syms){
      final ws = BinanceWS(s.toLowerCase());
      ws.start();
      streams[s] = ws;
      ws.prices.listen((p){ setState(()=> price[s]=p); });
    }
  }
  @override void dispose(){ for(final w in streams.values){ w.close(); } super.dispose(); }

  @override Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: const Text('Market Dashboard')), body: ListView.separated(
      itemCount: syms.length, separatorBuilder:(_,__)=>const Divider(height:1),
      itemBuilder: (_,i){
        final s=syms[i]; final p=price[s];
        return ListTile(title: Text(s.replaceAll('USDT','/USDT')), trailing: Text(p==null?'…':fmtMoney(p)));
      }));
  }
}