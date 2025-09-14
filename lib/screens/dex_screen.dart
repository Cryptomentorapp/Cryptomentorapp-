import 'package:flutter/material.dart';

class DexScreen extends StatelessWidget {
  const DexScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('DEX (placeholder)'),
              SizedBox(height: 8),
              Text('Connect wallet / Swap UI to be integrated.'),
            ],
          ),
        ),
      ),
    );
  }
}
