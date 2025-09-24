import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/cm_card.dart';

class MarketPage extends StatefulWidget { const MarketPage({super.key}); @override State<MarketPage> createState()=>_MarketPageState(); }
class _MarketPageState extends State<MarketPage>{
  List<dynamic> items=[]; bool loading=false; String? error;
  @override void initState(){ super.initState(); fetch(); }
  Future<void> fetch() async {
    setState(()=>loading=true);
    try{
      const url='https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false&price_change_percentage=24h';
      final res=await http.get(Uri.parse(url));
      if(res.statusCode==200){ items=jsonDecode(res.body) as List<dynamic>; error=null; } else { error='HTTP '+res.statusCode.toString(); }
    }catch(e){ error=e.toString(); }
    setState(()=>loading=false);
  }
  @override Widget build(BuildContext context){
    if(loading) return const Center(child: CircularProgressIndicator());
    if(error!=null) return Center(child: Text('Error: '+error!));
    return RefreshIndicator(onRefresh: fetch, child: ListView.separated(
      padding: const EdgeInsets.all(12), itemCount: items.length,
      itemBuilder: (_,i){
        final Map<String,dynamic> c=Map<String,dynamic>.from(items[i] as Map);
        final img=(c['image']??'').toString();
        final name=(c['name']??'').toString();
        final sym=(c['symbol']??'').toString().toUpperCase();
        final price=(c['current_price'] is num)? (c['current_price'] as num).toStringAsFixed(4):'-';
        final ch24=(c['price_change_percentage_24h'] is num)? (c['price_change_percentage_24h'] as num).toStringAsFixed(2)+'%':'-';
        return CMCard(child: Row(children:[
          CircleAvatar(backgroundImage: NetworkImage(img.isEmpty? 'https://via.placeholder.com/32':img)),
          const SizedBox(width:12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
            Text(name+' ('+sym+')', style: const TextStyle(fontWeight: FontWeight.w600)),
            Text('Price: '+price+' · 24h: '+ch24),
          ])),
        ]));
      }, separatorBuilder: (_,__)=>const SizedBox(height:8),
    ));
  }
}