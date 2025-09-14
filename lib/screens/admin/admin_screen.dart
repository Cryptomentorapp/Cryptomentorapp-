
import 'package:flutter/material.dart';
class AdminScreen extends StatelessWidget{
  const AdminScreen({super.key});
  @override Widget build(BuildContext c){
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('Feature Flags'), subtitle: Text('Enable/disable modules')),
          ListTile(title: Text('Signals Params'), subtitle: Text('EMA/RSI periods, risk thresholds')),
          ListTile(title: Text('News Sources'), subtitle: Text('RSS/API endpoints')),
        ],
      ),
    );
  }
}
