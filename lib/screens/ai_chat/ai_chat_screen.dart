
import 'package:flutter/material.dart';
class AiChatScreen extends StatefulWidget{ const AiChatScreen({super.key}); @override State<AiChatScreen> createState()=>_S(); }
class _S extends State<AiChatScreen>{
  final TextEditingController c = TextEditingController();
  final List<Map<String,String>> msgs = [];
  @override Widget build(BuildContext ctx){
    return Scaffold(
      appBar: AppBar(title: const Text('CMT AI Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: msgs.length,
              itemBuilder: (_, i){
                final m = msgs[i]; final isUser = m['role']=='user';
                return Align(
                  alignment: isUser?Alignment.centerRight:Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser? const Color(0xFFD4AF37): const Color(0xFF2A221A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(m['text'] ?? ''),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(child: TextField(controller: c, decoration: const InputDecoration(hintText: 'Ask something...', border: OutlineInputBorder()))),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: (){
                    final t = c.text.trim(); if (t.isEmpty) return;
                    setState((){ msgs.add({'role':'user','text': t}); });
                    c.clear();
                    Future.delayed(const Duration(milliseconds: 200), (){
                      setState((){ msgs.add({'role':'bot','text': 'Demo reply for: $t'}); });
                    });
                  },
                  child: const Icon(Icons.send),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
