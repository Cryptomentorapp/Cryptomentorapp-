
import 'package:flutter/material.dart';
import '../widgets/cards.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CMCard(child: ListTile(title: Text('Theme'), subtitle: Text('Dark (fixed)'))),
          SizedBox(height: 12),
          CMCard(child: ListTile(title: Text('Language'), subtitle: Text('English/Vietnamese'))),
          SizedBox(height: 12),
          CMCard(child: ListTile(title: Text('About'), subtitle: Text('Cryptomentor demo build'))),
        ],
      ),
    );
  }
}
