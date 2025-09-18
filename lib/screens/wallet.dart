import 'package:flutter/material.dart';
import '../theme/styles.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Wallet')), body: Padding(padding: Insets.screen, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
      Text("Connect your wallet (placeholder)"),
      SizedBox(height: 12),
      Text("This screen will integrate with real providers later."),
    ])));
  }
}