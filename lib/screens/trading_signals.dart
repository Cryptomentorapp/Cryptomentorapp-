import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class SignalsPage extends StatefulWidget {
  const SignalsPage({super.key});
  @override
  State<SignalsPage> createState() => _SignalsPageState();
}

class _SignalsPageState extends State<SignalsPage> {
  final _pairs = ['bitcoin', 'ethereum', 'binancecoin']; // CoinGecko IDs
  late Future<List<_Signal>> fut;

  @override
  void initState() {
    super.initState();
    fut = _load();
  }

  Future<List<_Signal>> _load() async {
    final ids = _pairs.join(',');
    final url = Uri.parse('https://api.coingecko.com/api/v3/simple/price?ids=$ids&vs_currencies=usd');
    final r = await http.get(url);
    final data = json.decode(r.body) as Map<String, dynamic>;
    final now = DateTime.now();
    return _pairs.map((id){
      final price = (data[id]['usd'] as num).toDouble();
      // toy demo: if price last digit even -> Long else Short
      final long = (price.toInt() % 2 == 0);
      final entry = price;
      final tp = long ? price*1.02 : price*0.98;
      final sl = long ? price*0.97 : price*1.03;
      return _Signal(id.toUpperCase(), long ? 'Long' : 'Short', entry, tp, sl, now);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trading Signals')),
      body: FutureBuilder(
        future: fut,
        builder: (context, snap){
          if(snap.connectionState != ConnectionState.done){
            return const Center(child: CircularProgressIndicator());
          }
          if(snap.hasError){
            return Center(child: Text('Error: ${snap.error}'));
          }
          final list = snap.data as List<_Signal>;
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            separatorBuilder: (_, __)=> const SizedBox(height: 12),
            itemBuilder: (_, i){
              final s = list[i];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  title: Text('${s.symbol} • ${s.side}'),
                  subtitle: Text('Entry: ${s.entry.toStringAsFixed(2)}  TP: ${s.tp.toStringAsFixed(2)}  SL: ${s.sl.toStringAsFixed(2)}\nTime: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(s.time)}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> SignalDetailPage(s:s))),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SignalDetailPage extends StatelessWidget {
  final _Signal s;
  const SignalDetailPage({super.key, required this.s});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${s.symbol} • ${s.side}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Entry: ${s.entry.toStringAsFixed(2)}'),
            Text('Take Profit: ${s.tp.toStringAsFixed(2)}'),
            Text('Stop Loss: ${s.sl.toStringAsFixed(2)}'),
            const SizedBox(height: 16),
            const Text('Phân tích (demo):'),
            const Text('• EMA/RSI sẽ được gắn engine thật ở bản tiếp theo.'),
          ],
        ),
      ),
    );
  }
}

class _Signal{
  final String symbol;
  final String side;
  final double entry, tp, sl;
  final DateTime time;
  _Signal(this.symbol, this.side, this.entry, this.tp, this.sl, this.time);
}
