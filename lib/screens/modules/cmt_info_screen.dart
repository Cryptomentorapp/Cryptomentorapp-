import 'package:flutter/material.dart';
class CMTInfoScreen extends StatelessWidget {
  const CMTInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('CMT Info')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('CMT Max Supply = 2,000,000,000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          SizedBox(height: 12),
          Text('Contract will be announced after token creation.'),
        ]),
      ));
  }
}
