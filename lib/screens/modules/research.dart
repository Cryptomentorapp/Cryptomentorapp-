
import 'dart:convert'; import 'package:flutter/material.dart'; import 'package:http/http.dart' as http;
class ResearchPage extends StatefulWidget{ const ResearchPage({super.key}); @override State<ResearchPage> createState()=>_ResearchPageState();}
class _ResearchPageState extends State<ResearchPage>{ List<dynamic>? coins; @override void initState(){super.initState(); _load();}
Future<void> _load() async{ final u=Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=30&page=1&sparkline=false&price_change_percentage=24h'); final r=await http.get(u); if(r.statusCode==200) setState(()=>coins=json.decode(r.body)); }
@override Widget build(c)=>Scaffold(appBar: AppBar(title: const Text('Research Hub')), body: coins==null? const Center(child:CircularProgressIndicator()) : ListView.separated(itemCount: coins!.length, separatorBuilder:(_, __)=> const Divider(height:1, color: Colors.white12), itemBuilder: (_, i){ final x=coins![i]; return ListTile(title: Text('${x['symbol'].toString().toUpperCase()} / ${x['name']}'), subtitle: Text('MCAP \\$'+(x['market_cap']/1e9).toStringAsFixed(1)+'B • 24h '+x['price_change_percentage_24h'].toStringAsFixed(2)+'%'), trailing: Text('\\$'+x['current_price'].toString())); }));
}
