import 'package:flutter/material.dart';
import '../repositories/news_repo.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final repo = NewsRepo();
  late Future<List<Map<String, dynamic>>> fut;
  @override
  void initState() { super.initState(); fut = repo.list(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News (CryptoPanic)')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fut,
        builder: (c, s) {
          if (s.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (s.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text('News error: ${s.error}', style: const TextStyle(color: Colors.redAccent)),
            );
          }
          final items = s.data ?? [];
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1, color: Colors.white12),
            itemBuilder: (_, i) {
              final it = items[i];
              return ListTile(
                title: Text((it['title'] ?? '').toString()),
                subtitle: Text((it['published_at'] ?? it['created_at'] ?? '').toString()),
              );
            },
          );
        },
      ),
    );
  }
}
