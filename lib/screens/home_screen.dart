
import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const InfoCard(title: 'Global Market Cap', value: '\$3.83T'),
          const SizedBox(height: 12),
          const InfoCard(title: '24h Volume', value: '\$116B'),
          const SizedBox(height: 12),
          const InfoCard(title: 'BTC Dominance', value: '54.1%'),
          const SizedBox(height: 24),
          const Text('Quick Links', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Wrap(spacing: 12, runSpacing: 12, children: [
            _quick(context, Icons.show_chart, 'Signals'),
            _quick(context, Icons.shield, 'Scanner'),
            _quick(context, Icons.auto_awesome, 'Research'),
          ]),
        ],
      ),
    );
  }
  Widget _quick(BuildContext context, IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, color: Colors.amberAccent),
      label: Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), child: Text(label, style: const TextStyle(fontSize: 16))),
    );
  }
}
