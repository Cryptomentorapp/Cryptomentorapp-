import 'package:flutter/material.dart'; import 'package:http/http.dart' as http; import 'package:xml/xml.dart' as xml;
class NewsPage extends StatefulWidget { const NewsPage({super.key}); @override State<NewsPage> createState()=>_NewsPageState(); }
class _NewsPageState extends State<NewsPage> {
  bool loading=true; String? error; List<_NewsItem> fast=[]; List<_NewsItem> deep=[];
  @override void initState(){ super.initState(); loadNews(); }
  Future<void> loadNews() async {
    setState(()=>loading=true); error=null; fast=[]; deep=[];
    try{
      final cp = await http.get(Uri.parse('https://cryptopanic.com/rss/'));
      if(cp.statusCode==200){ final doc=xml.XmlDocument.parse(cp.body);
        fast = doc.findAllElements('item').take(20).map((n)=>_NewsItem(title: n.getElement('title')?.text ?? '', url: n.getElement('link')?.text ?? '', source: 'CryptoPanic', pubDate: n.getElement('pubDate')?.text ?? '')).toList();
      }
      final ct = await http.get(Uri.parse('https://cointelegraph.com/rss'));
      if(ct.statusCode==200){ final doc=xml.XmlDocument.parse(ct.body);
        deep = doc.findAllElements('item').take(20).map((n)=>_NewsItem(title: n.getElement('title')?.text ?? '', url: n.getElement('link')?.text ?? '', source: 'CoinTelegraph', pubDate: n.getElement('pubDate')?.text ?? '')).toList();
      }
    } catch(e){ error=e.toString(); }
    setState(()=>loading=false);
  }
  @override Widget build(BuildContext context){
    if(loading) return const Center(child:CircularProgressIndicator());
    return RefreshIndicator(onRefresh: loadNews, child: ListView(padding: const EdgeInsets.all(12), children:[
      const Text('News nhanh (CryptoPanic)', style: TextStyle(fontSize:16, fontWeight: FontWeight.bold)), const SizedBox(height:8),
      if(fast.isEmpty) const Text('Không tải được feed CryptoPanic.'),
      ...fast.map((i)=>Card(child: ListTile(title: Text(i.title), subtitle: Text(i.source+' · '+i.pubDate), trailing: const Icon(Icons.open_in_new)))),
      const SizedBox(height:16),
      const Text('Phân tích sâu (CoinTelegraph)', style: TextStyle(fontSize:16, fontWeight: FontWeight.bold)), const SizedBox(height:8),
      if(deep.isEmpty) const Text('Không tải được feed CoinTelegraph.'),
      ...deep.map((i)=>Card(child: ListTile(title: Text(i.title), subtitle: Text(i.source+' · '+i.pubDate), trailing: const Icon(Icons.open_in_new)))),
    ]));
  }
}
class _NewsItem{ final String title; final String url; final String source; final String pubDate; _NewsItem({required this.title, required this.url, required this.source, required this.pubDate}); }