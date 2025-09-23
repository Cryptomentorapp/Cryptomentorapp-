import 'dart:convert'; import 'package:flutter/material.dart'; import 'package:http/http.dart' as http; import 'package:xml/xml.dart' as xml; import '../config/app_config.dart';
class NewsPage extends StatefulWidget { const NewsPage({super.key}); @override State<NewsPage> createState()=>_NewsPageState(); }
class _NewsPageState extends State<NewsPage> {
  bool loading=true; String? error; List<_NewsItem> items=[]; List<_NewsItem> deep=[];
  @override void initState(){ super.initState(); loadNews(); }
  Future<void> loadNews() async {
    setState(()=>loading=true); items=[]; deep=[]; error=null;
    try{
      if(AppConfig.cryptopanicToken.isNotEmpty){
        final res = await http.get(Uri.parse('https://cryptopanic.com/api/v1/posts/?auth_token=${AppConfig.cryptopanicToken}&kind=news'));
        if(res.statusCode==200){ final data=jsonDecode(res.body); final results=(data['results'] as List?)??[];
          items = results.map((e)=>_NewsItem(title:e['title']??'', url:e['url']??'', source:e['source']?['title']??'CryptoPanic', published: DateTime.tryParse(e['published_at']??''))).toList().cast<_NewsItem>(); }
      }
      final rss = await http.get(Uri.parse('https://cointelegraph.com/rss'));
      if(rss.statusCode==200){ final doc=xml.XmlDocument.parse(rss.body); final nodes=doc.findAllElements('item').take(20);
        deep = nodes.map((n)=>_NewsItem(title:n.getElement('title')?.text??'', url:n.getElement('link')?.text??'', source:'CoinTelegraph', published: DateTime.tryParse(n.getElement('pubDate')?.text??''))).toList();
      }
    } catch(e){ error=e.toString(); }
    setState(()=>loading=false);
  }
  @override Widget build(BuildContext context){
    if(loading) return const Center(child:CircularProgressIndicator());
    return RefreshIndicator(onRefresh: loadNews, child: ListView(padding: const EdgeInsets.all(12), children:[
      const Text('News nhanh (CryptoPanic)', style: TextStyle(fontSize:16, fontWeight: FontWeight.bold)), const SizedBox(height:8),
      if(items.isEmpty) const Text('Chưa cấu hình token CryptoPanic – vẫn có mục phân tích sâu bên dưới.'),
      ...items.map((i)=>Card(child: ListTile(title: Text(i.title), subtitle: Text('${i.source} · ${i.published??'-'}'), trailing: const Icon(Icons.open_in_new)))),
      const SizedBox(height:16),
      const Text('Phân tích sâu (CoinTelegraph)', style: TextStyle(fontSize:16, fontWeight: FontWeight.bold)), const SizedBox(height:8),
      ...deep.map((i)=>Card(child: ListTile(title: Text(i.title), subtitle: Text('${i.source} · ${i.published??'-'}'), trailing: const Icon(Icons.open_in_new)))),
    ]));
  }
}
class _NewsItem{ final String title; final String url; final String source; final DateTime? published; _NewsItem({required this.title, required this.url, required this.source, required this.published}); }