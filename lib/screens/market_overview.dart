import 'package:flutter/material.dart';

class MarketOverview extends StatelessWidget {
  final Map<String, dynamic>? global;
  const MarketOverview({super.key, this.global});

  @override
  Widget build(BuildContext context) {
    final data = global?['data'] ?? {};
    final mcap = data['total_market_cap']?['usd']?.toDouble() ?? 0.0;
    final btcDom = data['market_cap_percentage']?['btc']?.toDouble() ?? 0.0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _kv('Total MCAP', _fmt(mcap)),
            _kv('BTC DOM', '${btcDom.toStringAsFixed(2)}%'),
            _kv('FGI', 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _kv(String k, String v) => Column(
    children: [
      Text(k, style: const TextStyle(color: Colors.grey)),
      const SizedBox(height: 6),
      Text(v, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ],
  );

  String _fmt(double v){
    if (v >= 1e12) return (v/1e12).toStringAsFixed(2) + ' T';
    if (v >= 1e9) return (v/1e9).toStringAsFixed(2) + ' B';
    if (v >= 1e6) return (v/1e6).toStringAsFixed(2) + ' M';
    return v.toStringAsFixed(0);
  }
}
