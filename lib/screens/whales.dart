import 'package:flutter/material.dart';
class WhalesScreen extends StatelessWidget { const WhalesScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Whales')), body: ListView(children: const [
  ListTile(title: Text('0xA1...3F9 · +$1.2M')),
  ListTile(title: Text('0xB4...8C2 · +$870k')),
  ListTile(title: Text('0xD7...6E1 · -$690k')),
])); }