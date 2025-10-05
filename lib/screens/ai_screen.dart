
import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class AIScreen extends StatefulWidget{
  const AIScreen({super.key});
  @override State<AIScreen> createState()=>_AIScreenState();
}

class _AIScreenState extends State<AIScreen>{
  final _c = TextEditingController();
  final _msgs=<String>[];
  bool _loading=false;

  Future<void> _send() async {
    final t=_c.text.trim();
    if(t.isEmpty) return;
    setState(()=>{_loading=true, _msgs.add('You: $t')});
    final ans = await askAI(t);
    setState(()=>{_msgs.add('AI: $ans'), _loading=false, _c.clear()});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('AI Assistant')),
      body: Column(children: [
        Expanded(child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _msgs.length,
          itemBuilder: (_,i)=>Padding(
            padding: const EdgeInsets.symmetric(vertical:6),
            child: Text(_msgs[i]),
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            Expanded(child: TextField(controller: _c, decoration: const InputDecoration(hintText: 'Hỏi AI…'))),
            const SizedBox(width:8),
            ElevatedButton(onPressed: _loading?null:_send, child: const Text('Send'))
          ]),
        )
      ]),
    );
  }
}
