import 'package:flutter/material.dart';
import '../../services/news_api.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  @override State<NewsScreen> createState() => _NState();
}

class _NState extends State<NewsScreen> {
  bool _loading=true;
  List<NewsItem> _items = [];
  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async {
    try { _items = await NewsAPI.top(); } catch(_){}
    setState(()=>_loading=false);
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('News (CryptoPanic RSS)')),
      body: _loading ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
          padding: const EdgeInsets.all(12),
          itemBuilder: (_, i){
            final n = _items[i];
            return Card(child: ListTile(
              title: Text(n.title),
              subtitle: Text(n.source),
              trailing: const Icon(Icons.open_in_new_rounded),
            ));
          },
          separatorBuilder: (_, __)=> const SizedBox(height: 8),
          itemCount: _items.length,
        ));
  }
}
