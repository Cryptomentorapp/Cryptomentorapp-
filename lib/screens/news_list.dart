import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});
  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late Future<List<String>> fut;

  @override
  void initState() {
    super.initState();
    fut = _load();
  }

  Future<List<String>> _load() async {
    final url = Uri.parse('https://r.jina.ai/http://news.google.com/rss/search?q=crypto&hl=en-US&gl=US&ceid=US:en');
    final r = await http.get(url);
    final text = r.body;
    final lines = text.split('\n').where((e)=> e.trim().isNotEmpty).toList();
    return lines.take(40).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: FutureBuilder<List<String>>(
        future: fut,
        builder: (context, snap){
          if(snap.connectionState != ConnectionState.done){
            return const Center(child: CircularProgressIndicator());
          }
          if(snap.hasError){
            return Center(child: Text('Error: ${snap.error}'));
          }
          final list = snap.data ?? [];
          if(list.isEmpty) return const Center(child: Text('No news'));
          return ListView.separated(
            itemCount: list.length,
            separatorBuilder: (_, __)=> const Divider(height: 1),
            itemBuilder: (_, i)=> ListTile(title: Text(list[i], maxLines: 2, overflow: TextOverflow.ellipsis)),
          );
        },
      ),
    );
  }
}
