import 'package:flutter/material.dart';
import '../services/token_scanner.dart';

class TokenScannerScreen extends StatefulWidget{ const TokenScannerScreen({super.key}); @override State<TokenScannerScreen> createState()=>_TokenScannerScreenState(); }
class _TokenScannerScreenState extends State<TokenScannerScreen>{
  final c = TextEditingController(); ScanResult? res;
  Future<void> _do() async {
    final s = TokenScanner();
    res = await s.scan(c.text.trim());
    setState((){});
  }
  @override Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: const Text('Token Scanner')), body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Row(children:[ Expanded(child: TextField(controller:c, decoration: const InputDecoration(hintText:'0x...', border: OutlineInputBorder()))),
          const SizedBox(width:8), FilledButton(onPressed:_do, child: const Text('Scan')) ]),
        const SizedBox(height:12),
        if(res!=null) ...[ Text(res!.verdict, style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height:8),
          Wrap(spacing:8, children: res!.badges.map((b)=>Chip(label: Text(b))).toList()) ],
        const SizedBox(height:12),
        const Text('Có thể gắn API GoPlus/Etherscan keys để mở rộng kiểm tra.'),
      ]),
    ));
  }
}