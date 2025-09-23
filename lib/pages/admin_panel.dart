import 'package:flutter/material.dart'; import 'package:provider/provider.dart'; import '../state/app_state.dart';
class AdminPanelPage extends StatelessWidget { const AdminPanelPage({super.key});
  @override Widget build(BuildContext context){
    final app=context.watch<AppState>();
    return ListView(children:[
      SwitchListTile(title: const Text('Whale Tracker'), value: app.whalesEnabled, onChanged: (v)=>context.read<AppState>().toggle('whales', v)),
      SwitchListTile(title: const Text('Pricing/Premium'), value: app.premiumEnabled, onChanged: (v)=>context.read<AppState>().toggle('premium', v)),
      const Divider(),
      ListTile(title: const Text('Runbook'), subtitle: const Text('Build → Test → Release'), trailing: FilledButton(onPressed: (){}, child: const Text('Run 1-click'))),
    ]);
  }
}