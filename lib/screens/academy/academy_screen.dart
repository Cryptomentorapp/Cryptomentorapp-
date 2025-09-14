
import 'package:flutter/material.dart';
class AcademyScreen extends StatelessWidget{
  const AcademyScreen({super.key});
  @override Widget build(BuildContext c){
    final lessons = const [
      ('Intro to crypto', 'Basics of blockchain, wallets, exchanges'),
      ('Risk management', 'Position sizing, stop-loss, RR ratio'),
      ('On-chain analysis', 'Whale tracking, token flows'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Academy')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: lessons.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (ctx, i) => ListTile(title: Text(lessons[i].$1), subtitle: Text(lessons[i].$2)),
      ),
    );
  }
}
