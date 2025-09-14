import 'package:flutter/material.dart';

class TokenScannerScreen extends StatefulWidget {
  const TokenScannerScreen({super.key});
  @override
  State<TokenScannerScreen> createState() => _TokenScannerScreenState();
}

class _TokenScannerScreenState extends State<TokenScannerScreen> {
  final _controller = TextEditingController();
  String? _result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Risk Scanner (demo)', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Paste token contract address',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () {
              setState(() {
                _result = _controller.text.trim().isEmpty
                    ? 'Please enter a contract address'
                    : 'Simulated scan result: Low risk (demo)';
              });
            },
            child: const Text('Scan'),
          ),
          const SizedBox(height: 12),
          if (_result != null) Card(child: Padding(padding: const EdgeInsets.all(12), child: Text(_result!))),
        ],
      ),
    );
  }
}
