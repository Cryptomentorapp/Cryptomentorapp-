import 'package:flutter/material.dart';
import '../services/coingecko.dart';
import '../utils/format.dart';

class ResearchScreen extends StatefulWidget{ const ResearchScreen({super.key}); @override State<ResearchScreen> createState()=>_ResearchScreenState(); }
class _ResearchScreenState extends State<ResearchScreen>{
  final cg = CoinGecko(); List<Map<String,dynamic>> data=[]; bool loading=true;
  Future<void> load() async { data = await cg.markets(perPage:50, sparkline:false); loading=false; setState((){}); }
  @override void initState(){ super.initState(); load(); }
  @override Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: const Text('Research Hub')), body: loading? const Center(child:CircularProgressIndicator())
     : ListView.separated(itemCount: data.length, separatorBuilder:(_,__)=>const Divider(height:1), itemBuilder: (_,i){
        final c=data[i]; return ListTile(
          leading: Text('${i+1}'),
          title: Text('${(c['symbol']??'').toString().toUpperCase()} / ${(c['name']??'')}'),
          subtitle: Text('MCAP ${fmtMoney((c['market_cap']??0) as num)}  ·  24h ${(c['price_change_percentage_24h']??0).toStringAsFixed(2)}%'),
          trailing: Text(fmtMoney((c['current_price']??0) as num)),
        );
     }));
  }
}