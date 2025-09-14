import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
class ResearchHubScreen extends StatelessWidget {
  const ResearchHubScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Research Hub')),
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
