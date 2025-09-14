
import 'package:flutter/material.dart';
import '../utils/config.dart';
class SettingsScreen extends StatefulWidget { const SettingsScreen({super.key}); @override State<SettingsScreen> createState() => _SettingsScreenState(); }
class _SettingsScreenState extends State<SettingsScreen> {
  late bool demo;
  @override void initState() { super.initState(); demo = AppConfig.useDemoData; }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(title: const Text('Use demo data'), value: demo, onChanged: (v){ setState(() => demo = v); }),
          const ListTile(title: Text('API base URL'), subtitle: Text('Edit in lib/utils/config.dart')),
        ],
      ),
    );
  }
}
