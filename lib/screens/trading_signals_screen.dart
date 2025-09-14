import 'package:flutter/material.dart';
import '../utils/network.dart';
import '../utils/ta.dart';
class TradingSignalsScreen extends StatefulWidget { const TradingSignalsScreen({super.key}); @override State<TradingSignalsScreen> createState()=>_S(); }
class _S extends State<TradingSignalsScreen> {
  final pairs=['BTCUSDT','ETHUSDT','BNBUSDT']; bool loading=true; String? error; List<_Sig> items=[];
  @override void initState(){super.initState();_load();}
  Future<void> _load() async {
    setState(()=>loading=true); try{
      final out=<_Sig>[];
      for(final p in pairs){
        final k=await Net.getJson('https://api.binance.com/api/v3/klines?symbol=$p&interval=1h&limit=120') as List;
        final closes=k.map<double>((e)=>double.parse(e[4] as String)).toList();
        final e9=ema(closes,9).last; final e21=ema(closes,21).last; final r=rsi(closes, period:14);
        out.add(_Sig(pair:p, ema9:e9, ema21:e21, rsi:r, last:closes.last));
      }
      setState(()=>items=out);
    }catch(e){setState(()=>error='$e');}finally{setState(()=>loading=false);}
  }
  @override Widget build(BuildContext c){
    return Scaffold(appBar: AppBar(title: const Text('Trading Signals')),body:
      loading?const Center(child:CircularProgressIndicator()):
      error!=null?Center(child:Text(error!)):
      ListView.separated(itemCount:items.length, separatorBuilder:(_, __)=>const Divider(height:1), itemBuilder:(_,i){
        final s=items[i]; final sig=s.ema9>s.ema21?'BUY':'SELL';
        return ListTile(title: Text(s.pair, style: const TextStyle(fontSize:18,fontWeight:FontWeight.w600)),
          subtitle: Text('{sig}  ·  EMA9:{s.ema9.toStringAsFixed(2)}  EMA21:{s.ema21.toStringAsFixed(2)}  RSI:{s.rsi.toStringAsFixed(1)}'),
          onTap: ()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>_Detail(s:s, signal:sig))));
      }));
  }
}
class _Sig{final String pair;final double ema9,ema21,rsi,last;_Sig({required this.pair,required this.ema9,required this.ema21,required this.rsi,required this.last});}
class _Detail extends StatelessWidget{
  final _Sig s; final String signal; const _Detail({super.key, required this.s, required this.signal});
  @override Widget build(BuildContext c){
    return Scaffold(appBar: AppBar(title: Text('Details - ${s.pair}')),body:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text('Price: ${s.last.toStringAsFixed(2)} USDT',style: const TextStyle(fontSize:16,fontWeight:FontWeight.w600)),
      const SizedBox(height:8), Text('EMA9: ${s.ema9.toStringAsFixed(2)}'), Text('EMA21: ${s.ema21.toStringAsFixed(2)}'), Text('RSI(14): ${s.rsi.toStringAsFixed(1)}'),
      const SizedBox(height:12), Chip(label: Text(signal), backgroundColor: signal=='BUY'?Colors.green:Colors.red),
      const SizedBox(height:24), const Text('Phân tích: EMA cross + RSI momentum. (Demo)')
    ])));
  }
}
