import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ResearchHubPage extends StatefulWidget {
  const ResearchHubPage({super.key});
  @override
  State<ResearchHubPage> createState() => _ResearchHubPageState();
}

class _ResearchHubPageState extends State<ResearchHubPage> {
  late Future<List<_Coin>> fut;

  @override
  void initState() {
    super.initState();
    fut = _load();
  }

  Future<List<_Coin>> _load() async {
    final url = Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false');
    final r = await http.get(url);
    final arr = json.decode(r.body) as List;
    return arr.map((e)=> _Coin(e['symbol'].toString().toUpperCase(), e['name'], (e['current_price'] as num).toDouble(), e['market_cap'] as num, (e['price_change_percentage_24h'] ?? 0) as num)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.compactCurrency(symbol: '\$');
    return Scaffold(
      appBar: AppBar(title: const Text('Research Hub')),
      body: FutureBuilder(
        future: fut,
        builder: (context, snap){
          if(snap.connectionState != ConnectionState.done){
            return const Center(child: CircularProgressIndicator());
          }
          if(snap.hasError){
            return Center(child: Text('Error: ${snap.error}'));
          }
          final list = snap.data as List<_Coin>;
          return ListView.separated(
            itemCount: list.length,
            separatorBuilder: (_, __)=> const Divider(height: 1),
            itemBuilder: (_, i){
              final c = list[i];
              return ListTile(
                leading: Text('${i+1}'),
                title: Text('${c.symbol} / ${c.name}'),
                subtitle: Text('MCAP ${fmt.format(c.mcap)}  •  24h ${c.chg.toStringAsFixed(2)}%'),
                trailing: Text('\$${c.price.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
    );
  }
}

class _Coin{
  final String symbol, name;
  final double price;
  final num mcap, chg;
  _Coin(this.symbol, this.name, this.price, this.mcap, this.chg);
}
