import 'package:flutter/material.dart';
import '../theme/styles.dart';
class CMTHubScreen extends StatelessWidget { const CMTHubScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('CMT Hub')), body: ListView(padding: Insets.screen, children: const [
  Card(child: Padding(padding: EdgeInsets.all(12), child: Column(children: [Text('CMT Overview', style: TextStyle(fontWeight: FontWeight.w800)), SizedBox(height:8), Text('Chart placeholder')]))),
]); }