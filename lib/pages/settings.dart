import 'package:flutter/material.dart';
class SettingsPage extends StatelessWidget { const SettingsPage({super.key});
  @override Widget build(BuildContext context)=>ListView(children: const [
    ListTile(title: Text('Language'), subtitle: Text('Auto (VI/EN)')),
    ListTile(title: Text('Theme'), subtitle: Text('Dark')),
    AboutListTile(applicationName: 'Cryptomentor', applicationVersion: '1.0.0'),
  ]);
}