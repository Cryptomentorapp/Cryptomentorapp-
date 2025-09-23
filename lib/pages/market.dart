import 'dart:convert'; import 'package:flutter/material.dart'; import 'package:http/http.dart' as http;
class MarketPage extends StatefulWidget { const MarketPage({super.key}); @override State<MarketPage> createState()=>_MarketPageState(); }
class _MarketPageState extends State<MarketPage> {
  List<dynamic> coins=[]; bool loading=true; String? error;
  Future<void> fetchMarket() async {
    setState(()=>loading=true);
    try{
      final uri = Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1');
      final res = await http.get(uri);
      if(res.statusCode==200){ coins=jsonDecode(res.body); error=null; } else { error='HTTP ${res.statusCode}'; }
    } catch(e){ error=e.toString(); }
    setState(()=>loading=false);
  }
  @override void initState(){ super.initState(); fetchMarket(); }
  @override Widget build(BuildContext context){
    if(loading) return const Center(child:CircularProgressIndicator());
    if(error!=null) return Center(child: Text('Error: $error'));
    return RefreshIndicator(onRefresh: fetchMarket, child: ListView.separated(
      padding: const EdgeInsets.all(16), itemCount: coins.length,
      itemBuilder: (_, i){ final c = coins[i]; final ch = (c['price_change_percentage_24h']??0).toDouble(); final color = ch>=0? Colors.green: Colors.red;
        return Card(child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(c['image']??'')),
          title: Text('${c['name']} (${c['symbol']?.toUpperCase()??''})', style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text('\$${c['current_price']} · MCap Rank #${c['market_cap_rank']}'),
          trailing: Text('${ch.toStringAsFixed(2)}%', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ));
      }, separatorBuilder: (_, __)=>const SizedBox(height:8),
    ));
  }
}