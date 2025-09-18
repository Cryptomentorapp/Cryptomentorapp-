import 'package:flutter/material.dart';
import '../theme/styles.dart';

class CmtHubScreen extends StatelessWidget {
  const CmtHubScreen({super.key});

  Widget _row(String k, String v) => Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Row(children: [
    Expanded(child: Text(k, style: const TextStyle(color: Colors.white70))), Text(v, style: const TextStyle(fontWeight: FontWeight.w700)),
  ]));

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CMT Hub')),
      body: Padding(
        padding: Insets.screen,
        child: ListView(children: [
          Card(child: Padding(padding: Insets.card, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("CMT Overview", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 8),
            _row("Max Supply", "2,000,000,000 CMT"),
            _row("Circulating", "320,000,000 CMT"),
            _row("Market Cap", "\$48,000,000"),
            const SizedBox(height: 16), const SizedBox(height: 140, child: Center(child: Text("Chart Placeholder"))),
          ]))),
          const SizedBox(height: 12),
          Card(child: Padding(padding: Insets.card, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Your Holdings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 12),
            const LinearProgressIndicator(value: 0.35, minHeight: 10, backgroundColor: Colors.white10, color: CMColors.gold),
            const SizedBox(height: 8), const Text("Unlocked: 35% · Locked: 65%", style: TextStyle(fontSize: 12, color: Colors.white70)),
          ]))),
        ]),
      ),
    );
  }
}