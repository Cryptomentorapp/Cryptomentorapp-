import 'package:flutter/material.dart';
import '../theme/styles.dart';
class SignalsScreen extends StatelessWidget { const SignalsScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Signals')), body: ListView(padding: Insets.screen, children: const [
  Card(child: ListTile(title: Text('BTC/USDT · Entry 58900 · TP 60200'), subtitle: Text('Status: Still Valid'))),
  SizedBox(height:8),
  Card(child: ListTile(title: Text('ETH/USDT · Entry 2840 · TP 2920'), subtitle: Text('Status: Late Entry'))),
]); }