import 'package:flutter/material.dart';
import '../services/news_service.dart';
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});
  @override
  Widget build(BuildContext c){
    return Scaffold(
      appBar: AppBar(title: const Text('News (CryptoPanic + CoinTelegraph)')),
      body: FutureBuilder(
        future: NewsService.latest(),
        builder: (c,snap){
          if(snap.connectionState!=ConnectionState.done){ return const LinearProgressIndicator(); }
          if(snap.hasError){ return Center(child: Text('News error: ${snap.error}')); }
          final items = (snap.data as List<NewsItem>);
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_,__)=>const Divider(height:1),
            itemBuilder: (_,i){
              final it = items[i];
              return ListTile(title: Text(it.title), subtitle: Text(it.source));
            },
          );
        },
      ),
    );
  }
}
