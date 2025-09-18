import 'package:flutter/material.dart';
import '../theme/styles.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});
  @override State<AdminScreen> createState() => _AdminScreenState();
}
class _AdminScreenState extends State<AdminScreen> {
  bool dex = true, signals = true, whales = true, community = false, academy = false;
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Admin')), body: Padding(padding: Insets.screen, child: ListView(children: [
      _tile("DEX Aggregator", dex, (v)=> setState(()=> dex=v)),
      _tile("AI Trading Signals", signals, (v)=> setState(()=> signals=v)),
      _tile("Whales Tracker", whales, (v)=> setState(()=> whales=v)),
      _tile("Community", community, (v)=> setState(()=> community=v)),
      _tile("Academy", academy, (v)=> setState(()=> academy=v)),
    ])));
  }
  Widget _tile(String label, bool value, ValueChanged<bool> onChanged) => Card(child: SwitchListTile(title: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)), value: value, onChanged: onChanged));
}