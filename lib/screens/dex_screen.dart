
import 'package:flutter/material.dart';
import '../services/dex_service.dart';
import '../widgets/cards.dart';

class DexScreen extends StatefulWidget {
  const DexScreen({super.key});
  @override
  State<DexScreen> createState() => _DexScreenState();
}

class _DexScreenState extends State<DexScreen> {
  final _from = TextEditingController(text: 'USDT');
  final _to = TextEditingController(text: 'BTC');
  final _amount = TextEditingController(text: '100');
  DexQuote? _quote;
  bool _loading = false;

  Future<void> _getQuote() async {
    setState(() => _loading = true);
    try {
      final a = double.tryParse(_amount.text) ?? 0;
      _quote = await fetchMockQuote(_from.text.trim(), _to.text.trim(), a);
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DEX (Mock)')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CMCard(child: Column(children: [
            TextField(controller: _from, decoration: const InputDecoration(labelText: 'From Token (e.g., USDT)')),
            const SizedBox(height: 12),
            TextField(controller: _to, decoration: const InputDecoration(labelText: 'To Token (e.g., BTC)')),
            const SizedBox(height: 12),
            TextField(controller: _amount, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Amount')),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _loading ? null : _getQuote, child: _loading ? const CircularProgressIndicator() : const Text('Get Quote')),
          ])),
          const SizedBox(height: 12),
          if (_quote != null) CMCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Quote Result', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('From: ${_quote!.fromToken}  →  To: ${_quote!.toToken}'),
            Text('Amount In: ${_quote!.amount}'),
            Text('Estimated Out: ${_quote!.estimatedOut}'),
            Text('Price Impact: ${_quote!.priceImpact}%'),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () {}, child: const Text('Swap (disabled in demo)')),
          ])),
        ],
      ),
    );
  }
}
