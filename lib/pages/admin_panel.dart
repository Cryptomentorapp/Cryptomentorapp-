import 'package:flutter/material.dart'; import 'package:provider/provider.dart'; import '../state.dart';
class AdminPanelPage extends StatelessWidget { const AdminPanelPage({super.key});
  @override Widget build(BuildContext context){
    final app=context.watch<AppState>();
    return ListView(children:[
      SwitchListTile(title: const Text('Enable Whales'), value: app.whalesEnabled, onChanged: (v)=>context.read<AppState>().toggle('whales', v)),
      SwitchListTile(title: const Text('Enable News'), value: app.newsEnabled, onChanged: (v)=>context.read<AppState>().toggle('news', v)),
      const Divider(),
      ListTile(title: const Text('Runbook'), subtitle: const Text('Build → Test → Release')),
    ]);
  }
}