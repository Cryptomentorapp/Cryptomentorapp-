import 'package:flutter/material.dart';
class PricingPage extends StatelessWidget { const PricingPage({super.key});
  @override Widget build(BuildContext context)=>ListView(padding: const EdgeInsets.all(16), children: [
    _Plan(title:'Free', price:'\$0', features:['Signals basic','Whale list read-only']),
    const SizedBox(height:12),
    _Plan(title:'Pro', price:'\$10/mo', features:['Signals realtime','Whale alerts','DEX Pro']),
    const SizedBox(height:12),
    _Plan(title:'Year', price:'\$99/yr', features:['All Pro + Discount']),
  ]);
}
class _Plan extends StatelessWidget { final String title; final String price; final List<String> features; const _Plan({required this.title, required this.price, required this.features});
  @override Widget build(BuildContext context)=>Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
    Text(title, style: const TextStyle(fontSize:18, fontWeight: FontWeight.bold)),
    const SizedBox(height:4),
    Text(price, style: const TextStyle(fontSize:16)),
    const Divider(),
    ...features.map((f)=>ListTile(leading: const Icon(Icons.check), title: Text(f))).toList(),
    const SizedBox(height:8),
    FilledButton(onPressed: (){}, child: const Text('Choose')),
  ])));
}