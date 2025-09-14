import 'package:flutter/material.dart';
class TokenScannerScreen extends StatelessWidget{const TokenScannerScreen({super.key});
  @override Widget build(BuildContext c){
    final t=TextEditingController();
    return Scaffold(appBar: AppBar(title: const Text('Token Scanner')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[
      TextField(controller:t,decoration:const InputDecoration(labelText:'0x...',border:OutlineInputBorder()),),
      const SizedBox(height:12),
      SizedBox(width:double.infinity,child:ElevatedButton(onPressed:(){ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content: Text('Scan demo – sẽ gắn GoPlus/Etherscan API')));}, child: const Text('Scan'))),
      const SizedBox(height:8), const Text('Có thể gắn API GoPlus/Etherscan keys để mở rộng kiểm tra.')
    ])));
  }
}
