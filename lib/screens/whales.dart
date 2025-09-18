import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../data/services.dart';

class WhalesScreen extends StatelessWidget {
  const WhalesScreen({super.key});

  @override Widget build(BuildContext context) {
    final repo = WhalesRepo();
    return Scaffold(
      appBar: AppBar(title: const Text('Whales')),
      body: FutureBuilder(
        future: Future.wait([repo.inflows(), repo.outflows(), repo.recents()]),
        builder: (context, snap) {
          final inflows = snap.hasData ? (snap.data as List)[0] as List<Map<String,String>> : const <Map<String,String>>[];
          final outflows = snap.hasData ? (snap.data as List)[1] as List<Map<String,String>> : const <Map<String,String>>[];
          final recents = snap.hasData ? (snap.data as List)[2] as List<Map<String,String>> : const <Map<String,String>>[];
          return Padding(padding: Insets.screen, child: ListView(children: [
            const Text("Top Inflows", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 8),
            for (final r in inflows) _row(r, CMColors.green),
            const SizedBox(height: 12),
            const Text("Top Outflows", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 8),
            for (final r in outflows) _row(r, CMColors.red),
            const SizedBox(height: 12),
            const Text("Recent Large Tx", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), const SizedBox(height: 8),
            for (final r in recents) Card(child: ListTile(title: Text(r["title"]!), subtitle: Text(r["sub"]!))),
          ]));
        }
      ),
    );
  }

  Widget _row(Map<String,String> r, Color color) => Card(child: ListTile(title: Text(r["addr"]!), trailing: _pill(r["amount"]!, color)));

  Widget _pill(String text, Color color) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(color: color.withOpacity(.15), borderRadius: BorderRadius.circular(8)),
    child: Text(text, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700)),
  );
}