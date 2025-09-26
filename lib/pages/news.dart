import 'package:flutter/material.dart';
import '../services/rss_service.dart';
import '../widgets/cm_loading.dart';
import '../widgets/cm_error.dart';

class NewsPage extends StatefulWidget{ const NewsPage({super.key}); @override State<NewsPage> createState()=>_N(); }
class _N extends State<NewsPage>{
  List<RSSItem> items=[]; bool loading=true; String? error;
  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async {
    setState(()=>loading=true);
    try{ items = await RSSService.fetchAll(); error=null; } catch(e){ error=e.toString(); }
    setState(()=>loading=false);
  }
  @override Widget build(BuildContext c){
    if(loading) return const CMLoading();
    if(error!=null) return CMError(error!);
    return RefreshIndicator(onRefresh: _load, child: ListView.separated(
      padding: const EdgeInsets.all(12), itemCount: items.length,
      itemBuilder: (_,i){ final it=items[i]; return ListTile(title: Text(it.title), subtitle: Text(it.pubDate), trailing: const Icon(Icons.open_in_new)); },
      separatorBuilder:(_,__)=>const Divider(height:1),
    ));
  }
}