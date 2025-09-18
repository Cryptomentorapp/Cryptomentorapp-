import 'package:flutter/material.dart';
import '../theme/styles.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  Widget _post(String user, String time, String content) => Card(child: Padding(padding: Insets.card, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(children: [CircleAvatar(radius: 14, backgroundColor: Colors.white10, child: Text(user[0])), const SizedBox(width: 8), Text(user, style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(width: 8), Text("· $time", style: const TextStyle(color: Colors.white60, fontSize: 12))]),
    const SizedBox(height: 8), Text(content),
    const SizedBox(height: 8),
    Row(children: const [Icon(Icons.thumb_up_alt_outlined, size: 16), SizedBox(width: 6), Text("Like"), SizedBox(width: 16), Icon(Icons.mode_comment_outlined, size: 16), SizedBox(width: 6), Text("Comment")]),
  ])));

  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Community')), body: Padding(padding: Insets.screen, child: ListView(children: [
      _post("Alice", "3m", "BTC whales đang gom mạnh quanh 59k."), const SizedBox(height: 8),
      _post("Bob", "12m", "ETH funding rate hạ nhiệt, có thể hồi."),
    ])));
  }
}