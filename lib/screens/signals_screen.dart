
import 'package:flutter/material.dart';
import '../services/signal_service.dart';
import '../widgets/cards.dart';
import '../utils/format.dart';

class SignalsScreen extends StatelessWidget{
  const SignalsScreen({super.key});
  Color _c(String t)=> t.toUpperCase()=='LONG' ? Colors.greenAccent : Colors.redAccent;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Trading Signals')),
      body: FutureBuilder(
        future: loadSignals(),
        builder: (context, snap){
          if(!snap.hasData) return const Center(child: CircularProgressIndicator());
          final list=snap.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (_,i){
              final s=list[i];
              return CMCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[
                  Text(s.pair, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Chip(label: Text(s.type), backgroundColor: _c(s.type).withOpacity(.2)),
                ]),
                const SizedBox(height: 6),
                Text('Entry: ${fmt(s.entry)}  |  SL: ${fmt(s.sl)}'),
                Text('TP: ${s.tp.map(fmt).join(' / ')}'),
                const SizedBox(height: 6),
                Wrap(spacing:8, children:[
                  Chip(label: Text('Risk: ${s.risk}')), Chip(label: Text('TF: ${s.tf}')), Chip(label: Text(s.status)), Chip(label: Text('Src: ${s.source}'))
                ]),
              ]));
            },
            separatorBuilder: (_,__)=>const SizedBox(height: 12),
            itemCount: list.length,
          );
        },
      ),
    );
  }
}
