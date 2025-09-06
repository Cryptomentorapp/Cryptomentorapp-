import 'package:flutter/material.dart';
class AcademyScreen extends StatelessWidget{ const AcademyScreen({super.key});
  @override Widget build(BuildContext context){
    final items=[
      ('Crypto 101','Wallet, seed phrase, CEX vs DEX'),
      ('Trading Basics','Spot/Futures, leverage, risk control'),
      ('On-chain 101','Explorer, gas fee, pools'),
      ('Security Tips','2FA, Approval revoke, phishing'),
    ];
    return Scaffold(appBar: AppBar(title: const Text('Academy')), body: ListView.separated(
      itemCount: items.length, separatorBuilder: (_, __)=>const Divider(height:1), itemBuilder: (_,i)=>ListTile(
        title: Text(items[i].$1, style: const TextStyle(fontWeight: FontWeight.w700)), subtitle: Text(items[i].$2),
      )));
  }
}