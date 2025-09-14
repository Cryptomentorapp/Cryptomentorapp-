import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(title: Text('Language (auto by IP) - placeholder')),
        ListTile(title: Text('Theme - placeholder')),
        ListTile(title: Text('About - placeholder')),
      ],
    );
  }
}
