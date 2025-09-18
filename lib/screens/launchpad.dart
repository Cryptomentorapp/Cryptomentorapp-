import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../data/services.dart';

class LaunchpadScreen extends StatelessWidget {
  const LaunchpadScreen({super.key});

  @override Widget build(BuildContext context) {
    final repo = LaunchpadRepo();
    return Scaffold(
      appBar: AppBar(title: const Text('Launchpad')),
      body: FutureBuilder(
        future: repo.phases(),
        builder: (context, snap) {
          final phases = (snap.data ?? []) as List;
          return Padding(padding: Insets.screen, child: ListView(children: [
            for (final p in phases) ...[ _phase(p as Map<String,String>), const SizedBox(height: 12) ]
          ]));
        }
      ),
    );
  }

  Widget _phase(Map<String,String> p) {
    return Card(child: Padding(padding: Insets.card, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(p["title"]!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      const SizedBox(height: 8),
      Row(children: [
        Expanded(child: Text("Allocation: ${p["alloc"]}", style: const TextStyle(color: Colors.white70))),
        Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(color: CMColors.gold.withOpacity(.2), borderRadius: BorderRadius.circular(10)),
          child: Text("Price: ${p["price"]}", style: const TextStyle(color: CMColors.gold, fontWeight: FontWeight.w700)),
        )
      ]),
      const SizedBox(height: 6),
      Text("Start: ${p["start"]}  ·  End: ${p["end"]}", style: const TextStyle(color: Colors.white70, fontSize: 12)),
      const SizedBox(height: 12),
      ClipRRect(borderRadius: BorderRadius.circular(12), child: const LinearProgressIndicator(value: .35, minHeight: 10, backgroundColor: Colors.white10, color: CMColors.gold)),
      const SizedBox(height: 8),
      Row(children: const [Expanded(child: Text("35% filled", style: TextStyle(fontSize: 12, color: Colors.white70))), ElevatedButton(onPressed: null, child: Text("Participate"))])
    ])));
  }
}