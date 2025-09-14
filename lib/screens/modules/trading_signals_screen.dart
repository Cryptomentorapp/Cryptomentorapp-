import 'package:flutter/material.dart';
import '../../utils/app_theme.dart';

class TradingSignalsScreen extends StatelessWidget {
  const TradingSignalsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trading Signals')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppTheme.card, borderRadius: BorderRadius.circular(16),
          ),
          child: const Text('Coming soon', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
