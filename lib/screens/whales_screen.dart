import 'package:flutter/material.dart';
class WhalesScreen extends StatelessWidget{ const WhalesScreen({super.key});
  @override Widget build(BuildContext context){
    final items=List.generate(12, (i)=>('Whale Tx ${i+1}','0x...${i.toString().padLeft(3,'0')} bought ${(100+i)} BTC'));
    return Scaffold(appBar: AppBar(title: const Text('Whales Tracker (Demo)')), body: ListView.separated(
      itemCount: items.length, separatorBuilder: (_, __)=>const Divider(height:1),
      itemBuilder: (_,i)=>ListTile(leading: const Icon(Icons.sailing), title: Text(items[i].$1), subtitle: Text(items[i].$2)),
    ));
  }
}