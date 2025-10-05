
import 'package:flutter/material.dart';
import '../widgets/cards.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    final items=[
      ('Trading Signals', Icons.show_chart),
      ('Token Scam', Icons.shield_moon_outlined),
      ('Research', Icons.search),
      ('NFT Meme', Icons.emoji_emotions_outlined),
      ('CMT Info', Icons.info_outline),
      ('Whales Tracker', Icons.sailing_outlined),
      ('Academy', Icons.school_outlined),
      ('News', Icons.newspaper_outlined),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text('Cryptomentor', style: TextStyle(fontWeight: FontWeight.w800)),
          Text('AI Trading Suite', style: TextStyle(fontSize: 12, color: Colors.white70)),
        ]),
        actions: [Padding(padding: const EdgeInsets.only(right:12), child: goldBadge('🎨 Giao diện'))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CMCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Modules', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              Text('8 tab topside', style: TextStyle(color: Colors.white60)),
            ]),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: .9, mainAxisSpacing: 12, crossAxisSpacing: 12),
              itemBuilder: (_,i)=>Container(
                decoration: BoxDecoration(color: const Color(0xFF0F121C), borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.white10)),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(items[i].$2, color: Colors.amberAccent, size: 22),
                  const SizedBox(height: 8),
                  Text(items[i].$1, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
                ]),
              ),
            ),
          ])),
          const SizedBox(height: 14),
          CMCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('Market Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              goldBadge('Dashboard'),
            ]),
            const SizedBox(height: 12),
            Wrap(spacing: 10, runSpacing: 10, children: const [
              _Metric(title:'Total MCap', value:'—'),
              _Metric(title:'BTC DOM', value:'—'),
              _Metric(title:'Fear & Greed', value:'50 Neutral'),
              _Metric(title:'TOTAL1', value:'—'),
              _Metric(title:'TOTAL2', value:'—'),
              _Metric(title:'TOTAL3', value:'—'),
            ]),
          ])),
          const SizedBox(height: 14),
          CMCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Market', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: TextField(decoration: InputDecoration(hintText: 'Tìm coin...', filled: true, fillColor: const Color(0xFF0F121C), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.white12)), contentPadding: const EdgeInsets.symmetric(horizontal:12, vertical:10)))),
              const SizedBox(width:10),
              goldBadge('Xem thêm'),
            ]),
            const SizedBox(height: 12),
            const ListTile(
              leading: Text('BTC', style: TextStyle(fontWeight: FontWeight.bold)),
              title: Text('Bitcoin'),
              subtitle: Text('\$65,000   0.80%'),
              trailing: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('\$1.28T'), Text('\$25.00B', style: TextStyle(color: Colors.white60, fontSize: 12))
              ]),
            ),
          ])),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget{
  final String title; final String value;
  const _Metric({required this.title, required this.value});
  @override
  Widget build(BuildContext context){
    return Container(
      width: (MediaQuery.of(context).size.width-16*2-10)/2 - 2,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF0F121C), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: Colors.white60, fontSize: 12)),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ]),
    );
  }
}
