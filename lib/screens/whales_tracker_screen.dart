import 'package:flutter/material.dart';

class WhalesTrackerScreen extends StatelessWidget {
  const WhalesTrackerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(title: Text('Recent Large Transfers (placeholder)')),
        ListTile(title: Text('Smart Money Watchlist (placeholder)')),
      ],
    );
  }
}
