import 'package:flutter/material.dart';
class CMTHubPage extends StatelessWidget { const CMTHubPage({super.key});
  @override Widget build(BuildContext context)=>Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
    const Text('CMT Holdings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    const SizedBox(height:8), const Text('Balance: 12,345 CMT (demo)'),
    const SizedBox(height:16),
    Row(children:[FilledButton(onPressed: (){}, child: const Text('Buy CMT (demo)')), const SizedBox(width:8), OutlinedButton(onPressed: (){}, child: const Text('Sell CMT (demo)'))])
  ]));
}