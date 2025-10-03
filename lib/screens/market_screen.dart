import 'package:flutter/material.dart';
import '../repositories/market_repo.dart';

class MarketScreen extends StatefulWidget { const MarketScreen({super.key}); @override State<MarketScreen> createState() => _MarketScreenState(); }
class _MarketScreenState extends State<MarketScreen> {
  final repo = MarketRepo(); late Future<List<dynamic>> fut;
  @override void initState() { super.initState(); fut = repo.list(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Market')),
    body: FutureBuilder<List<dynamic>>(
      future: fut,
      builder: (c, s) {
        if (s.connectionState != ConnectionState.done) return const Center(child: CircularProgressIndicator());
        if (s.hasError) return Padding(padding: const EdgeInsets.all(16), child: Text('API error: ${s.error}', style: const TextStyle(color: Colors.redAccent)));
        final rows = s.data ?? [];
        return ListView.separated(
          itemCount: rows.length,
          separatorBuilder: (_, __) => const Divider(height: 1, color: Colors.white12),
          itemBuilder: (_, i) { final r = rows[i] as Map<String, dynamic>;
            final sym = (r['symbol'] ?? '').toString().toUpperCase();
            final price = (r['current_price'] ?? r['price'] ?? 0).toString();
            final ch = (r['price_change_percentage_24h'] ?? 0).toString();
            return ListTile(
              leading: Text('${i+1}'), title: Text('${r['name']} ($sym)'),
              subtitle: Text('MCAP: ${r['market_cap'] ?? '-'}  •  Vol24h: ${r['total_volume'] ?? '-'}'),
              trailing: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('\$${price}', style: const TextStyle(fontWeight: FontWeight.w700)),
                Text('${ch}%'),
              ]));
          });
      });
}
