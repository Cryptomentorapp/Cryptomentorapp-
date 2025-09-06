import 'package:flutter/material.dart';
import '../services/coingecko.dart';

class NewsScreen extends StatefulWidget{ const NewsScreen({super.key}); @override State<NewsScreen> createState()=>_NewsScreenState(); }
class _NewsScreenState extends State<NewsScreen>{
  final cg = CoinGecko(); List<Map<String,dynamic>> items=[]; bool loading=true;
  Future<void> load() async { items = await cg.statusUpdates(); loading=false; setState((){}); }
  @override void initState(){ super.initState(); load(); }
  @override Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: const Text('News')), body: loading? const Center(child:CircularProgressIndicator())
      : ListView.separated(itemCount: items.length, separatorBuilder:(_,__)=>const Divider(height:1), itemBuilder: (_,i){
        final it = items[i]; final p = it['project']??{};
        return ListTile(title: Text((it['description']??'').toString().trim()), subtitle: Text('Project: ${p['name']??''}'));
      }));
  }
}