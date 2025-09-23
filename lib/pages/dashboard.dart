import 'package:flutter/material.dart';
class DashboardPage extends StatelessWidget { const DashboardPage({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: const [
    _Card(title:'Balance',subtitle:'Equity & PnL'), SizedBox(height:12),
    _Card(title:'Market Overview',subtitle:'BTC/ETH/CMT snapshot'), SizedBox(height:12),
    _Card(title:'Latest Signals',subtitle:'Valid / Late / Invalid')
  ]);
}
class _Card extends StatelessWidget{ final String title; final String subtitle; const _Card({required this.title, required this.subtitle});
  @override Widget build(BuildContext context)=>Card(child: ListTile(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), subtitle: Text(subtitle), trailing: const Icon(Icons.chevron_right),
  ));
}