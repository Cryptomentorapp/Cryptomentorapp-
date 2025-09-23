import 'package:flutter/material.dart';
class WalletPage extends StatelessWidget { const WalletPage({super.key});
  @override Widget build(BuildContext context)=>Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
    const Text('Wallet', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)),
    const SizedBox(height:8),
    Row(children:[FilledButton(onPressed: (){}, child: const Text('Create')), const SizedBox(width:8), OutlinedButton(onPressed: (){}, child: const Text('Import'))]),
    const SizedBox(height:12), const Text('Networks: ETH · BSC (demo)'),
  ]));
}