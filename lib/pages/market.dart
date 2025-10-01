import 'package:flutter/material.dart';
import '../services/coingecko_api.dart';
class MarketPage extends StatelessWidget {
  const MarketPage({super.key});
  @override
  Widget build(BuildContext c){
    return Scaffold(
      appBar: AppBar(title: const Text('Market')),
      body: FutureBuilder(
        future: CoinGeckoApi.markets(perPage: 100, page: 1),
        builder: (c,snap){
          if(snap.connectionState!=ConnectionState.done){ return const LinearProgressIndicator(); }
          if(snap.hasError){ return Center(child: Text('API error: ${snap.error}')); }
          final items = (snap.data as List);
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_,__)=>const Divider(height:1),
            itemBuilder: (_,i){
              final it = items[i] as Map;
              return ListTile(
                title: Text('${it['name']} (${it['symbol']})'),
                subtitle: Text('Price: ${it['current_price']} | 24h: ${it['price_change_percentage_24h']}%'),
                trailing: Text('${it['market_cap'] ?? ''}'),
              );
            },
          );
        },
      ),
    );
  }
}
