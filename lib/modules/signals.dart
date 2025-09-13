import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

Future<List<List<num>>> fetchKlines(String symbol, String interval, int limit) async {
  final url = Uri.parse('https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval&limit=$limit');
  final res = await http.get(url);
  if (res.statusCode != 200) throw Exception('HTTP ${res.statusCode}');
  final data = jsonDecode(res.body) as List;
  return data.map((e) => (e as List).map((x) => (x is num) ? x : num.parse(x.toString())).toList()).toList();
}

List<double> ema(List<double> v, int p){ final k=2/(p+1); double? prev; return v.map((x){ prev = (prev==null)?x:(x*k+prev!*(1-k)); return prev!; }).toList(); }
List<double> rsi(List<double> v, int p){
  final g=<double>[], l=<double>[]; for(int i=1;i<v.length;i++){ final d=v[i]-v[i-1]; g.add(d>0?d:0); l.add(d<0?-d:0); }
  double ag=g.take(p).average, al=l.take(p).average; final out=<double>[];
  for (int i=p;i<g.length;i++){ ag=(ag*(p-1)+g[i])/p; al=(al*(p-1)+l[i])/p; final val= (al==0)?100:100-(100/(1+(ag/(al==0?1e-9:al)))); out.add(val.isNaN?50:val); }
  while(out.length<v.length) out.insert(0,50); return out;
}

class SignalsPage extends StatefulWidget { const SignalsPage({super.key}); @override State<SignalsPage> createState()=>_SignalsPageState(); }
class _SignalsPageState extends State<SignalsPage> {
  String symbol='BTCUSDT', interval='1h'; bool loading=true; String? error;
  List<double> closes=[], e9=[], e21=[], r14=[];

  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async {
    setState(()=>{loading=true,error=null});
    try{
      final rows=await fetchKlines(symbol, interval, 300);
      closes = rows.map((e)=> (e[4] as num).toDouble()).toList();
      e9 = ema(closes,9); e21 = ema(closes,21); r14 = rsi(closes,14);
    }catch(e){ error=e.toString(); } finally { setState(()=>loading=false); }
  }

  @override Widget build(BuildContext c){
    if (loading) return const Center(child:CircularProgressIndicator());
    if (error!=null) return Center(child: Text('Error: $error'));
    final last = closes.isNotEmpty?closes.last:0.0;
    final sBuy = e9.last>e21.last && r14.last>=45;
    final signal = sBuy?'BUY':'SELL';
    return RefreshIndicator(
      onRefresh:_load,
      child: ListView(padding: const EdgeInsets.all(16), children:[
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[
          DropdownButton(value:symbol, items: const [
            DropdownMenuItem(value:'BTCUSDT',child:Text('BTCUSDT')),
            DropdownMenuItem(value:'ETHUSDT',child:Text('ETHUSDT')),
          ], onChanged:(v){ setState(()=>symbol=v!); _load(); }),
          DropdownButton(value:interval, items: const [
            DropdownMenuItem(value:'15m',child:Text('15m')),
            DropdownMenuItem(value:'1h',child:Text('1h')),
            DropdownMenuItem(value:'4h',child:Text('4h')),
          ], onChanged:(v){ setState(()=>interval=v!); _load(); }),
        ]),
        const SizedBox(height:8),
        Card(child: ListTile(
          title: Text('$symbol • $signal', style: TextStyle(
            color: sBuy?Colors.green:Colors.red, fontWeight: FontWeight.bold)),
          subtitle: Text('Price: ${last.toStringAsFixed(2)} | EMA9:${e9.last.toStringAsFixed(2)} | EMA21:${e21.last.toStringAsFixed(2)} | RSI:${r14.last.toStringAsFixed(1)}'),
          trailing: const Icon(Icons.chevron_right),
          onTap: ()=> Navigator.of(c).push(MaterialPageRoute(builder: (_)=>SignalDetail(
            symbol:symbol, interval:interval, closes:closes, e9:e9, e21:e21, r14:r14)))
        )),
        const SizedBox(height:16),
        const Text('* Live signal (EMA/RSI). Not financial advice.'),
      ]),
    );
  }
}

class SignalDetail extends StatelessWidget {
  final String symbol, interval; final List<double> closes, e9, e21, r14;
  const SignalDetail({super.key, required this.symbol, required this.interval, required this.closes, required this.e9, required this.e21, required this.r14});

  double _atr(List<double> c, int p){ final d=<double>[]; for(int i=1;i<c.length;i++){ d.add((c[i]-c[i-1]).abs()); } final t=d.take(p).toList(); if(t.isEmpty) return 0; return t.average; }

  @override Widget build(BuildContext c){
    final last=closes.last, atr=_atr(closes,14); final isBuy=e9.last>e21.last && r14.last>=45;
    final sl = isBuy? last-1.2*atr : last+1.2*atr;
    final tp1= isBuy? last+1.0*atr : last-1.0*atr;
    final tp2= isBuy? last+2.0*atr : last-2.0*atr;

    return Scaffold(appBar: AppBar(title: Text('$symbol • $interval')), body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text('Price: ${last.toStringAsFixed(2)}'),
        Text('EMA9:${e9.last.toStringAsFixed(2)}  EMA21:${e21.last.toStringAsFixed(2)}  RSI:${r14.last.toStringAsFixed(1)}'),
        const SizedBox(height:8),
        Text('TP1:${tp1.toStringAsFixed(2)}  TP2:${tp2.toStringAsFixed(2)}  SL:${sl.toStringAsFixed(2)}  (ATR14:${atr.toStringAsFixed(2)})'),
        const Divider(),
        const Text('Mini chart placeholder – can add fl_chart later.'),
      ]),
    ));
  }
}
