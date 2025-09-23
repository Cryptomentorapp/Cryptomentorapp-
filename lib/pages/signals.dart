import 'package:flutter/material.dart';
class SignalsPage extends StatefulWidget { const SignalsPage({super.key}); @override State<SignalsPage> createState()=>_SignalsPageState(); }
class _SignalsPageState extends State<SignalsPage> {
  String filter='ALL';
  final items=[{'pair':'BTC/USDT','status':'VALID','entry':'64900','sl':'63800','tp':'66200','time':'10:05'},
               {'pair':'ETH/USDT','status':'LATE','entry':'3180','sl':'3120','tp':'3260','time':'10:20'},
               {'pair':'CMT/USDT','status':'INVALID','entry':'0.046','sl':'0.044','tp':'0.052','time':'11:00'}];
  @override Widget build(BuildContext context){
    final filtered=filter=='ALL'?items:items.where((e)=>e['status']==filter).toList();
    return Column(children:[
      Padding(padding: const EdgeInsets.all(12), child: Wrap(spacing:8, children:[
        ChoiceChip(label: const Text('All'),selected:filter=='ALL',onSelected: (_){setState(()=>filter='ALL');}),
        ChoiceChip(label: const Text('Valid'),selected:filter=='VALID',onSelected: (_){setState(()=>filter='VALID');}),
        ChoiceChip(label: const Text('Late'),selected:filter=='LATE',onSelected: (_){setState(()=>filter='LATE');}),
        ChoiceChip(label: const Text('Invalid'),selected:filter=='INVALID',onSelected: (_){setState(()=>filter='INVALID');}),
      ])),
      Expanded(child: ListView.separated(padding: const EdgeInsets.all(12), itemBuilder: (_,i){
        final s=filtered[i]; Color color=Colors.grey;
        if(s['status']=='VALID') color=Colors.green; else if(s['status']=='LATE') color=Colors.orange; else if(s['status']=='INVALID') color=Colors.red;
        return Card(child: ListTile(
          title: Text('${s['pair']} · ${s['time']}'),
          subtitle: Text('Entry ${s['entry']} · SL ${s['sl']} · TP ${s['tp']}'),
          trailing: Chip(label: Text(s['status']!), backgroundColor: color.withOpacity(.15), labelStyle: TextStyle(color: color)),
        ));
      }, separatorBuilder: (_,__)=>const SizedBox(height:8), itemCount: filtered.length))
    ]);
  }
}