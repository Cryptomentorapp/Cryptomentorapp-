
import 'package:flutter/material.dart';
import '../services/signal_service.dart';
import '../utils/format.dart';
import '../widgets/cards.dart';

class SignalsScreen extends StatelessWidget {
  const SignalsScreen({super.key});

  Color _typeColor(String t) => t.toUpperCase() == 'LONG' ? Colors.greenAccent : Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signals')),
      body: FutureBuilder(
        future: loadSignals(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final list = snap.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (_, i) {
              final s = list[i];
              return CMCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(s.pair, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Chip(label: Text(s.type), backgroundColor: _typeColor(s.type).withOpacity(0.2)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('Entry: ${fmt(s.entry)}  |  SL: ${fmt(s.sl)}'),
                    Text('TP: ${s.tp.map(fmt).join(' / ')}'),
                    const SizedBox(height: 6),
                    Wrap(spacing: 8, runSpacing: 8, children: [
                      Chip(label: Text('Risk: ${s.risk}')),
                      Chip(label: Text('TF: ${s.timeframe}')),
                      Chip(label: Text(s.status)),
                      Chip(label: Text('Src: ${s.source}')),
                    ]),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: list.length,
          );
        },
      ),
    );
  }
}
