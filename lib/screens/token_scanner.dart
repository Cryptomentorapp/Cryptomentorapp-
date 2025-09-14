import 'package:flutter/material.dart';

class TokenScannerPage extends StatefulWidget {
  const TokenScannerPage({super.key});

  @override
  State<TokenScannerPage> createState() => _TokenScannerPageState();
}

class _TokenScannerPageState extends State<TokenScannerPage> {
  final c = TextEditingController();
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Token Scanner')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: c,
              decoration: const InputDecoration(
                hintText: '0x...',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: ()=> setState(()=> result = (c.text.startsWith('0x') && c.text.length>10) ? 'Looks like a valid address.\n(GoPlus/Etherscan API sẽ gắn ở bản kế tiếp)' : 'Địa chỉ không hợp lệ'),
              child: const Text('Scan'),
            ),
            const SizedBox(height: 24),
            if(result!=null) Text(result!, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
