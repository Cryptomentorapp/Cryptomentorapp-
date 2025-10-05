
import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});
  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final _c = TextEditingController();
  final _messages = <String>[];
  bool _loading = false;

  Future<void> _send() async {
    final t = _c.text.trim();
    if (t.isEmpty) return;
    setState(() {
      _messages.add('You: $t');
      _loading = true;
    });
    final ans = await askAi(t);
    setState(() {
      _messages.add('AI: $ans');
      _loading = false;
      _c.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Assistant (Demo)')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(_messages[i]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _c, decoration: const InputDecoration(hintText: 'Hỏi AI…'))),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _loading ? null : _send, child: const Text('Send')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
