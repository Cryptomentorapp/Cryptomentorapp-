import 'package:flutter/material.dart';
import '../theme/styles.dart';
class DexScreen extends StatelessWidget { const DexScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('DEX Aggregator')), body: ListView(padding: Insets.screen, children: const [
    Card(child: ListTile(title: Text('Swap demo'), subtitle: Text('Provide ONEINCH_API_KEY in .env to enable live quote'))),
  ]));
}