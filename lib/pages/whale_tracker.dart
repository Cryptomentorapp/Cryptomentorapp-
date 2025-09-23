import 'package:flutter/material.dart'; import 'package:flutter/services.dart'; import 'package:provider/provider.dart'; import '../state/app_state.dart';
class WhaleTrackerPage extends StatefulWidget { const WhaleTrackerPage({super.key}); @override State<WhaleTrackerPage> createState()=>_WhaleTrackerPageState(); }
class _WhaleTrackerPageState extends State<WhaleTrackerPage> {
  String q='';
  @override Widget build(BuildContext context){
    final app=context.watch<AppState>();
    final list=q.isEmpty?app.whalesTop50:app.whalesTop50.where((e)=> ((e['address']??'') as String).toLowerCase().contains(q.toLowerCase()) || ((e['label']??'') as String).toLowerCase().contains(q.toLowerCase())).toList();
    return Column(children:[
      Padding(padding: const EdgeInsets.all(12), child: TextField(decoration: const InputDecoration(prefixIcon: Icon(Icons.search), labelText:'Filter address/label'), onChanged: (v)=>setState(()=>q=v))),
      Expanded(child: ListView.separated(padding: const EdgeInsets.all(12), itemBuilder: (_,i){
        final t=list[i];
        return Card(child: ListTile(leading: const Icon(Icons.account_balance_wallet_outlined), title: Text('${t['label']??'Whale'}'),
          subtitle: Text('Chain: ${t['chain']} · ${t['address']}'),
          trailing: IconButton(icon: const Icon(Icons.copy), onPressed: (){ Clipboard.setData(ClipboardData(text: (t['address']??'') as String)); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied address'))); }),));
      }, separatorBuilder: (_,__)=>const SizedBox(height:8), itemCount:list.length))
    ]);
  }
}