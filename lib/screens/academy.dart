import 'package:flutter/material.dart';
import '../theme/styles.dart';

class AcademyScreen extends StatelessWidget {
  const AcademyScreen({super.key});

  Widget _course(String title, String level) => Card(child: Padding(padding: Insets.card, child: Row(children: [
    Container(width: 56, height: 56, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12))),
    const SizedBox(width: 12),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 4),
      Text(level, style: const TextStyle(color: Colors.white70, fontSize: 12)),
    ])),
    const ElevatedButton(onPressed: null, child: Text("Start")),
  ])));

  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Academy')), body: Padding(padding: Insets.screen, child: ListView(children: [
      _course("Crypto 101", "Beginner"), const SizedBox(height: 8),
      _course("On-chain Analytics", "Intermediate"), const SizedBox(height: 8),
      _course("Risk Management", "Advanced"),
    ])));
  }
}