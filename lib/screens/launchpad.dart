import 'package:flutter/material.dart';
class LaunchpadScreen extends StatelessWidget { const LaunchpadScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Launchpad')), body: ListView(children: const [
  ListTile(title: Text('Phase 1 · 20,000,000 CMT · $0.02')),
  ListTile(title: Text('Phase 2 · 25,000,000 CMT · $0.023')),
  ListTile(title: Text('Phase 3 · 30,000,000 CMT · $0.025')),
])); }