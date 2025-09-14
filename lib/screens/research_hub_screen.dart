import 'package:flutter/material.dart';

class ResearchHubScreen extends StatefulWidget {
  const ResearchHubScreen({super.key});
  @override
  State<ResearchHubScreen> createState() => _ResearchHubScreenState();
}

class _ResearchHubScreenState extends State<ResearchHubScreen> {
  bool loading = false;
  String? error;
  final List<Map<String, dynamic>> coins = const [
    {'symbol': 'BTC', 'name': 'Bitcoin', 'market_cap': '1.2T', 'price_change_percentage_24h': 0.8, 'current_price': 61234},
    {'symbol': 'ETH', 'name': 'Ethereum', 'market_cap': '0.3T', 'price_change_percentage_24h': -0.2, 'current_price': 2388},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: coins.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, i) {
                    final d = coins[i];
                    return ListTile(
                      leading: Text('${i + 1}'),
                      title: Text('${(d['symbol'] ?? '').toString().toUpperCase()} / ${d['name']}'),
                      subtitle: Text('MCAP \$${d['market_cap']} · 24h ${d['price_change_percentage_24h']}%'),
                      trailing: Text('\$${d['current_price']}'),
                    );
                  },
                ),
    );
  }
}
