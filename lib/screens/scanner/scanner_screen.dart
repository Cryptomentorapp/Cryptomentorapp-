
import 'package:flutter/material.dart';
class ScannerScreen extends StatefulWidget{ const ScannerScreen({super.key}); @override State<ScannerScreen> createState()=>_S(); }
class _S extends State<ScannerScreen>{
  final TextEditingController c = TextEditingController(); String? res;
  @override Widget build(BuildContext ctx){
    return Scaffold(
      appBar: AppBar(title: const Text('Token Scanner')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Paste token address to scan risk (demo).'),
          const SizedBox(height: 8),
          TextField(controller: c, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '0x...')),
          const SizedBox(height: 8),
          FilledButton(onPressed: () { setState(() { res = 'Risk score for ${c.text}: 72/100 (OK)'; }); }, child: const Text('Scan')),
          if (res != null) Card(child: ListTile(title: Text(res!))),
        ],
      ),
    );
  }
}
