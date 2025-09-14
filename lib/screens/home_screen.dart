import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _KpiTile(title: 'Global Market Cap', value: '\$3.83T'),
        _KpiTile(title: '24h Volume', value: '\$116B'),
        _KpiTile(title: 'BTC Dominance', value: '54.1%'),
        SizedBox(height: 24),
        Text('Quick Links', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _QuickLinks(),
      ],
    );
  }
}

class _KpiTile extends StatelessWidget {
  final String title;
  final String value;
  const _KpiTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _QuickLinks extends StatelessWidget {
  const _QuickLinks();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _link(context, 'Signals', Icons.show_chart, 1),
        _link(context, 'Scanner', Icons.shield, 2),
        _link(context, 'Research', Icons.auto_awesome, 3),
      ],
    );
  }

  Widget _link(BuildContext context, String label, IconData icon, int tabIndex) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onPressed: () {
        // Jump to tab by popping to root and changing index if needed. For simplicity, push hint page.
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Open "$label" from bottom tabs.')));
      },
    );
  }
}
