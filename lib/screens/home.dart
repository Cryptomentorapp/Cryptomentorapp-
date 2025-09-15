
import 'dart:convert'; import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../constants.dart';
import 'modules/signals.dart'; import 'modules/research.dart'; import 'modules/news.dart'; import 'modules/coming.dart'; import 'modules/scanner.dart';

class Home extends StatefulWidget{ const Home({super.key}); @override State<Home> createState()=>_HomeState();}
class _HomeState extends State<Home>{
  Map<String,dynamic>? g; @override void initState(){super.initState(); _load();}
  Future<void> _load() async{
    try{final r=await http.get(Uri.parse('https://api.coingecko.com/api/v3/global'));
      if(r.statusCode==200) setState(()=>g=json.decode(r.body)['data']);} catch(_){}
  }
  Widget metric(String t,String v)=>Container(decoration:CmtTheme.tile(),padding:const EdgeInsets.all(14),child:
    Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(t,style:const TextStyle(color:CmtTheme.sub,fontSize:12)), const SizedBox(height:8), Text(v,style:const TextStyle(fontSize:18,fontWeight:FontWeight.w800))]));
  @override Widget build(c){
    final m=g?['total_market_cap']?['usd']; final d=g?['market_cap_percentage']?['btc'];
    return Scaffold(
      appBar: AppBar(title: Row(children:[Image.asset('assets/images/cmt_shield.png',width:28,height:28), const SizedBox(width:10), const Text('Cryptomentor'),
        const Spacer(), Container(padding:const EdgeInsets.symmetric(horizontal:12,vertical:6), decoration:BoxDecoration(color:CmtTheme.card,borderRadius:BorderRadius.circular(20)), child: const Row(children:[Icon(Icons.palette,size:16), SizedBox(width:6), Text('Giao diện')]))])),
      bottomNavigationBar: NavigationBar(backgroundColor:CmtTheme.panel, indicatorColor: Colors.transparent, destinations: const [
        NavigationDestination(icon: Icon(Icons.home_rounded), label:'Home'),
        NavigationDestination(icon: Icon(Icons.chat), label:'Community'),
        NavigationDestination(icon: Icon(Icons.event), label:'Events'),
        NavigationDestination(icon: Icon(Icons.person), label:'User'),
      ], selectedIndex: 0,),
      body: ListView(padding: const EdgeInsets.fromLTRB(12,12,12,90), children:[
        const Text('Modules', style: TextStyle(fontSize:22, fontWeight: FontWeight.w900)),
        const SizedBox(height:8),
        GridView.count(crossAxisCount:4, shrinkWrap:true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing:12, mainAxisSpacing:12, childAspectRatio:.9, children:[
          tile(c, Icons.trending_up_rounded, 'Trading\nSignals', 'Signals', const SignalsPage()),
          tile(c, Icons.shield_rounded,     'Token\nScam',     'Scanner', const ScannerPage()),
          tile(c, Icons.search_rounded,     'Research',        'Hub',     const ResearchPage()),
          tile(c, Icons.extension_rounded,  'NFT',             'Meme',    const ComingSoonPage(title:'NFT Meme')),
          tile(c, Icons.info_rounded,       'CMT',             'Info',    const ComingSoonPage(title:'CMT Info')),
          tile(c, Icons.sailing_rounded,    'Whales',          'Tracker', const ComingSoonPage(title:'Whales Tracker')),
          tile(c, Icons.school_rounded,     'Academy',         '',        const ComingSoonPage(title:'Academy')),
          tile(c, Icons.article_rounded,    'News',            '',        const NewsPage()),
        ]),
        const SizedBox(height:12),
        const Text('Market Overview', style: TextStyle(fontSize:22, fontWeight: FontWeight.w900)),
        const SizedBox(height:8),
        Row(children:[
          Expanded(child: metric('Total MCap', m==null?'…':'\$'+(m/1e12).toStringAsFixed(2)+'T')),
          const SizedBox(width:10),
          Expanded(child: metric('BTC DOM', d==null?'…': d.toStringAsFixed(2)+'%')),
          const SizedBox(width:10),
          Expanded(child: metric('Fear & Greed', '—')),
        ]),
      ]),
    );
  }
  Widget tile(BuildContext ctx, IconData icon, String title, String sub, Widget page){
    return InkWell(onTap:()=>Navigator.of(ctx).push(MaterialPageRoute(builder:(_)=>page)), child:
      Container(decoration:CmtTheme.tile(), padding: const EdgeInsets.all(12), child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[
        Container(width:44,height:44, decoration: const BoxDecoration(color: Color(0xFF18202C), shape: BoxShape.circle), child: Icon(icon, color: CmtTheme.gold)),
        const SizedBox(height:10),
        Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize:16, fontWeight: FontWeight.w800)),
        if(sub.isNotEmpty) const SizedBox(height:4),
        if(sub.isNotEmpty) Text(sub, style: const TextStyle(fontSize:12, color: CmtTheme.sub)),
      ])));
  }
}
