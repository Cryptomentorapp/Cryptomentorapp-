import 'package:flutter/material.dart';
import '../services/coingecko_service.dart';
import '../widgets/cm_loading.dart';
import '../widgets/cm_error.dart';

class MarketPage extends StatefulWidget{ const MarketPage({super.key}); @override State<MarketPage> createState()=>_M(); }
class _M extends State<MarketPage>{
  List<dynamic> items=[]; bool loading=true; String? error;
  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async {
    setState(()=>loading=true);
    try{ items = await CoinGeckoService.topMarkets(); error=null; } catch(e){ error=e.toString(); }
    setState(()=>loading=false);
  }
  @override Widget build(BuildContext c){
    if(loading) return const CMLoading();
    if(error!=null) return CMError(error!);
    return RefreshIndicator(onRefresh: _load, child: ListView.separated(
      padding: const EdgeInsets.all(12), itemCount: items.length,
      itemBuilder: (_,i){ final m = Map<String,dynamic>.from(items[i]);
        final img=(m['image']??'').toString(); final name=(m['name']??'').toString(); final sym=(m['symbol']??'').toString().toUpperCase();
        final price=(m['current_price'] is num)? (m['current_price'] as num).toStringAsFixed(4):'-';
        final ch24=(m['price_change_percentage_24h'] is num)? (m['price_change_percentage_24h'] as num).toStringAsFixed(2)+'%':'-';
        return Card(child: ListTile(leading: CircleAvatar(backgroundImage: NetworkImage(img)), title: Text('$name ($sym)'), subtitle: Text('Price: $price · 24h: $ch24')));
      }, separatorBuilder: (_,__)=>const SizedBox(height:8),
    ));
  }
}