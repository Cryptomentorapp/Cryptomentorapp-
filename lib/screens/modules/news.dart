
import 'package:flutter/material.dart'; import 'package:http/http.dart' as http; import 'package:xml/xml.dart' as xml;
class NewsPage extends StatefulWidget{ const NewsPage({super.key}); @override State<NewsPage> createState()=>_NewsPageState();}
class _NewsPageState extends State<NewsPage>{ List<Map<String,String>> items=[]; bool loading=true; @override void initState(){super.initState(); _load();}
Future<void> _load() async{ try{ final r=await http.get(Uri.parse('https://www.coindesk.com/arc/outboundfeeds/rss/')); if(r.statusCode==200){ final d=xml.XmlDocument.parse(r.body); items=d.findAllElements('item').take(40).map((n)=>{'title':n.getElement('title')?.text??'', 'link':n.getElement('link')?.text??''}).toList(); }} finally { setState(()=>loading=false); } }
@override Widget build(c)=>Scaffold(appBar: AppBar(title: const Text('News')), body: loading? const Center(child:CircularProgressIndicator()) : ListView.builder(itemCount: items.length, itemBuilder: (_, i){ final it=items[i]; return ListTile(title: Text(it['title']!), subtitle: Text(it['link']!)); }));
}
