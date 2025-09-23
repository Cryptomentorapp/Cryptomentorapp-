import 'package:flutter/material.dart'; import 'package:provider/provider.dart'; import '../state/app_state.dart';
class DEXAggregatorPage extends StatefulWidget { const DEXAggregatorPage({super.key}); @override State<DEXAggregatorPage> createState()=>_DEXAggregatorPageState(); }
class _DEXAggregatorPageState extends State<DEXAggregatorPage> {
  final fromCtrl=TextEditingController(text:'100.00'); String result='';
  @override Widget build(BuildContext context){
    final app=context.watch<AppState>();
    return Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
      Row(children: const [ Expanded(child:_TokenField(label:'From', token:'USDT')), SizedBox(width:12), Expanded(child:_TokenField(label:'To', token:'CMT')) ]),
      const SizedBox(height:12),
      Row(children:[Expanded(child: TextField(controller: fromCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText:'Amount (USDT)', border: OutlineInputBorder()))),
        const SizedBox(width:12), FilledButton(onPressed: (){ final amt=double.tryParse(fromCtrl.text)??0; final fee=app.estimateFee(amt); setState(()=>result='Estimated fee: ' + fee + ' USDT · Router: 1inch (demo)');}, child: const Text('Estimate'))]),
      const SizedBox(height:12), Text(result), const SizedBox(height:12), FilledButton(onPressed: (){}, child: const Text('Swap (testnet demo)')),
    ]));
  }
}
class _TokenField extends StatelessWidget{ final String label; final String token; const _TokenField({required this.label, required this.token});
  @override Widget build(BuildContext context)=>TextField(decoration: InputDecoration(labelText:'$label token', suffixText: token, border: const OutlineInputBorder()));
}