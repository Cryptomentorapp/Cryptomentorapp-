import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class NewsPage extends StatefulWidget { const NewsPage({super.key}); @override State<NewsPage> createState()=>_NewsPageState(); }
class _NewsPageState extends State<NewsPage>{
  List<_Item> items=[]; bool loading=false; String? error;
  @override void initState(){ super.initState(); fetch(); }
  Future<void> fetch() async {
    setState(()=>loading=true);
    try{
      final urls=['https://cryptopanic.com/rss/','https://cointelegraph.com/rss'];
      final all=<_Item>[];
      for(final u in urls){
        final res=await http.get(Uri.parse(u));
        if(res.statusCode==200){
          final doc=xml.XmlDocument.parse(res.body);
          for(final n in doc.findAllElements('item')){
            final title=n.getElement('title')?.text ?? '';
            final link=n.getElement('link')?.text ?? '';
            final pub=n.getElement('pubDate')?.text ?? '';
            all.add(_Item(title: title, link: link, date: pub));
          }
        }
      }
      all.sort((a,b)=> b.date.compareTo(a.date));
      items=all.take(60).toList(); error=null;
    } catch(e){ error=e.toString(); }
    setState(()=>loading=false);
  }
  @override Widget build(BuildContext context){
    if(loading) return const Center(child: CircularProgressIndicator());
    if(error!=null) return Center(child: Text('Error: '+error!));
    return RefreshIndicator(onRefresh: fetch, child: ListView.separated(
      padding: const EdgeInsets.all(12), itemCount: items.length,
      itemBuilder: (_,i){ final it=items[i]; return ListTile(title: Text(it.title), subtitle: Text(it.date), trailing: const Icon(Icons.open_in_new), onTap: (){}); },
      separatorBuilder: (_,__)=>const Divider(height:1),
    ));
  }
}
class _Item{ final String title; final String link; final String date; _Item({required this.title, required this.link, required this.date}); }