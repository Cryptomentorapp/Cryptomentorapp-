import 'package:flutter/material.dart';
import '../theme/styles.dart';

class ResearchScreen extends StatelessWidget {
  const ResearchScreen({super.key});

  Widget _sec(String title, List<String> lines) => Card(child: Padding(padding: Insets.card, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 6),
    for (final l in lines) Padding(padding: const EdgeInsets.symmetric(vertical: 2), child: Text("• $l", style: const TextStyle(color: Colors.white70))),
  ])));

  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Research')), body: Padding(padding: Insets.screen, child: ListView(children: [
      _sec("Project Overview", ["Vision & use cases", "Key metrics", "Ecosystem"]), const SizedBox(height: 12),
      _sec("Tokenomics", ["Supply · Emissions", "Vesting schedule", "Allocation"]), const SizedBox(height: 12),
      _sec("Risks", ["Smart contract", "Liquidity", "Centralization"]),
    ])));
  }
}