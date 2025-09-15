
import 'dart:convert'; import 'dart:math';
import 'package:flutter/material.dart'; import 'package:http/http.dart' as http;
class SignalsPage extends StatefulWidget{ const SignalsPage({super.key}); @override State<SignalsPage> createState()=>_SignalsPageState();}
class _SignalsPageState extends State<SignalsPage>{ bool loading=true; List<Map<String,dynamic>> rows=[]; String? error;
@override void initState(){super.initState(); _load();}
Future<void> _load() async{
  setState(()=>loading=true); rows.clear();
  final syms=['BTCUSDT','ETHUSDT','BNBUSDT'];
  try{
    for(final s in syms){
      final r=await http.get(Uri.parse('https://api.binance.com/api/v3/klines?symbol='+s+'&interval=1h&limit=120'));
      if(r.statusCode!=200) throw Exception('Binance ${r.statusCode}');
      final data=(json.decode(r.body) as List).map((e)=>double.parse(e[4].toString())).toList();
      double ema(List<double> p,int n){final k=2/(n+1); double e=p.first; for(int i=1;i<p.length;i++){e=p[i]*k+e*(1-k);} return e;}
      double rsi(List<double> p,{int n=14}){ if(p.length<n+1) return 50; double g=0,l=0; for(int i=1;i<=n;i++){final d=p[i]-p[i-1]; if(d>=0) g+=d; else l-=d;} double ag=g/n, al=l/n; for(int i=n+1;i<p.length;i++){final d=p[i]-p[i-1]; final gg=max(0,d), ll=max(0,-d); ag=(ag*(n-1)+gg)/n; al=(al*(n-1)+ll)/n;} if(al==0) return 70; final rs=ag/al; return 100-(100/(1+rs)); }
      final e9=ema(data,9), e21=ema(data,21), r=rsi(data); final px=data.last;
      final dir=e9>e21?'Long':'Short'; final tp=dir=='Long'?px*1.02:px*0.98; final sl=dir=='Long'?px*0.97:px*1.03;
      rows.add({'symbol':s,'dir':dir,'entry':px,'tp':tp,'sl':sl,'ema9':e9,'ema21':e21,'rsi':r});
    }
  } catch(e){ error = e.toString(); }
  setState(()=>loading=false);
}
@override Widget build(c){
  return Scaffold(appBar: AppBar(title: const Text('Trading Signals (live)')), body:
    loading? const Center(child:CircularProgressIndicator()) : error!=null? Center(child: Text(error!, style: const TextStyle(color: Colors.red))) :
    ListView.separated(itemCount: rows.length, separatorBuilder: (_, __)=> const Divider(height:1,color:Colors.white12), itemBuilder: (_, i){
      final x=rows[i];
      return ListTile(
        leading: CircleAvatar(backgroundColor: x['dir']=='Long'? Colors.green: Colors.red, child: Text((x['symbol'] as String)[0])),
        title: Text('${x['symbol']} • ${x['dir']}'),
        subtitle: Text('Entry ${x['entry'].toStringAsFixed(2)}  TP ${x['tp'].toStringAsFixed(2)}  SL ${x['sl'].toStringAsFixed(2)}\nEMA9 ${x['ema9'].toStringAsFixed(2)}  EMA21 ${x['ema21'].toStringAsFixed(2)}  RSI ${x['rsi'].toStringAsFixed(1)}'),
        trailing: const Icon(Icons.chevron_right));
    }));
}
