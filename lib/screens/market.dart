import 'package:flutter/material.dart';
import '../data/services.dart';
import '../widgets/token_row.dart';
class MarketScreen extends StatefulWidget { const MarketScreen({super.key}); @override State<MarketScreen> createState()=> _MarketScreenState(); }
class _MarketScreenState extends State<MarketScreen> {
  List<dynamic> coins = []; bool loading=true; String? err;
  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async {
    final res = await FreeApis.marketTop();
    if (!mounted) return;
    if (res.ok) setState(()=> { coins = res.data!, loading=false });
    else setState(()=> { coins = [], loading=false, err=res.error });
  }
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Market')), body: loading? const Center(child:CircularProgressIndicator()) : ListView(children: [
    if (err!=null) Padding(padding: const EdgeInsets.all(12), child: Text('Fallback to mock: $err', style: const TextStyle(color: Colors.orange))),
    for (final c in coins) TokenRow(symbol: (c['symbol'] ?? '').toString().toUpperCase(), name: (c['name'] ?? ''), price: "\$${(c['current_price'] ?? 0).toString()}", change: "${(c['price_change_percentage_24h'] ?? 0).toString()}%", positive: ((c['price_change_percentage_24h'] ?? 0) as num) >= 0)
  ]));
}