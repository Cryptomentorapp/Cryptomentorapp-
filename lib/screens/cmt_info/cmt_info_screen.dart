
import 'package:flutter/material.dart';
class CmtInfoScreen extends StatelessWidget{
  const CmtInfoScreen({super.key});
  @override Widget build(BuildContext c){
    return Scaffold(
      appBar: AppBar(title: const Text('CMT Info')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Token Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _row('Max Supply','2,000,000,000 CMT'),
          _row('Circulating','—'),
          _row('Burned','—'),
          _row('Locked','—'),
          const SizedBox(height: 16),
          const Text('Staking (placeholder)'),
          const SizedBox(height: 8),
          Row(children: const [
            Expanded(child: OutlinedButton(onPressed: null, child: Text('Stake'))),
            SizedBox(width: 8),
            Expanded(child: OutlinedButton(onPressed: null, child: Text('Unstake'))),
          ]),
          const SizedBox(height: 16),
          const Text('Buy/Sell on DEX (outside store)'),
          const SizedBox(height: 4),
          const Text('This will deeplink to aggregator with params.'),
        ],
      ),
    );
  }
  static Widget _row(String k, String v) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(children: [
      SizedBox(width: 140, child: Text(k, style: const TextStyle(color: Colors.grey))),
      Expanded(child: Text(v, style: const TextStyle(fontWeight: FontWeight.w600))),
    ]),
  );
}
