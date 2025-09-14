import 'package:flutter/material.dart'; import '../utils/network.dart';
class ResearchHubScreen extends StatefulWidget{const ResearchHubScreen({super.key});@override State<ResearchHubScreen> createState()=>_R();}
class _R extends State<ResearchHubScreen>{bool loading=true; String? error; List coins=[];
  @override void initState(){super.initState();_load();}
  Future<void> _load() async{setState(()=>loading=true);try{final r=await Net.getJson('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false');coins=r as List;}catch(e){error='$e';}finally{setState(()=>loading=false);}}
  @override Widget build(BuildContext c){
    return Scaffold(appBar: AppBar(title: const Text('Research Hub')),body:
      loading?const Center(child:CircularProgressIndicator()):
      error!=null?Center(child:Text(error!)):
      ListView.separated(itemCount:coins.length, separatorBuilder:(_, __)=>const Divider(height:1), itemBuilder:(_,i){
        final d=coins[i]; return ListTile(leading: Text('${i+1}'), title: Text('${(d['symbol']??'').toString().toUpperCase()} / ${d['name']}'),
          subtitle: Text('MCAP \$${d['market_cap']} · 24h ${d['price_change_percentage_24h']}%'), trailing: Text('\$${d['current_price']}'));});
  }}
