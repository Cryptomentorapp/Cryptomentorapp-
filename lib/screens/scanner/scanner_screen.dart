
import 'package:flutter/material.dart';
class ScannerScreen extends StatefulWidget { const ScannerScreen({super.key}); @override State<ScannerScreen> createState() => _ScannerScreenState(); }
class _ScannerScreenState extends State<ScannerScreen> {
  final _c = TextEditingController(); String? _result;
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Token Scanner')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Risk Scanner (demo)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          TextField(
            controller: _c,
            decoration: const InputDecoration(hintText: 'Paste token contract address', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
          ),
          const SizedBox(height: 12),
          FilledButton(onPressed: () { setState(() { _result = 'Demo score for ${_c.text}: 72/100 (OK).'; }); }, child: const Text('Scan')),
          const SizedBox(height: 16),
          if (_result != null) Card(child: ListTile(title: Text(_result!))),
        ],
      ),
    );
  }
}
