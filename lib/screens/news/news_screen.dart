
import 'package:flutter/material.dart';
class NewsScreen extends StatelessWidget{
  const NewsScreen({super.key});
  @override Widget build(BuildContext c){
    final a = const [
      ('BTC hits resistance', 'An analysis of current market structure...', 'CoinDesk'),
      ('ETH upgrade roadmap', 'Timelines and implications for staking...', 'The Block'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: a.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (ctx, i) => ListTile(title: Text(a[i].$1), subtitle: Text('${a[i].$3} · ${a[i].$2}')),
      ),
    );
  }
}
