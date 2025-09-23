import 'dart:convert'; import 'package:flutter/material.dart'; import 'package:http/http.dart' as http;

class TokenScannerPage extends StatefulWidget { const TokenScannerPage({super.key}); @override State<TokenScannerPage> createState()=>_TokenScannerPageState(); }
class _TokenScannerPageState extends State<TokenScannerPage> with TickerProviderStateMixin {
  final queryCtrl = TextEditingController();
  List<dynamic> results=[]; Map<String,dynamic>? detail; String? error; bool loading=false;
  List<_HotToken> hotlist=[]; late TabController tab;
  @override void initState(){ super.initState(); tab=TabController(length:2, vsync:this); loadHotlist(); }

  Future<void> loadHotlist() async {
    try{
      final res = await http.get(Uri.parse('https://api.coingecko.com/api/v3/search/trending'));
      if(res.statusCode==200){
        final data = jsonDecode(res.body); final coins=(data['coins'] as List?)??[];
        hotlist = coins.map((e){ final item=e['item']??{}; return _HotToken(name:item['name']??'', symbol:item['symbol']??'', id:item['id']??'', rank:item['market_cap_rank']); }).toList().cast<_HotToken>();
      }
      setState((){});
    } catch(_){}
  }

  Future<void> search() async {
    setState(()=>loading=true);
    try{
      final res = await http.get(Uri.parse('https://api.coingecko.com/api/v3/search?query=${Uri.encodeComponent(queryCtrl.text)}'));
      if(res.statusCode==200){ final data=jsonDecode(res.body); results=(data['coins'] as List?)??[]; error=null; } else { error='HTTP ${res.statusCode}'; }
    } catch(e){ error=e.toString(); }
    setState(()=>loading=false);
  }

  Future<void> scanById(String id) async {
    setState(()=>loading=true);
    try{
      final res = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/$id?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false'));
      if(res.statusCode==200){ detail=jsonDecode(res.body); error=null; tab.animateTo(0); } else { error='HTTP ${res.statusCode}'; }
    } catch(e){ error=e.toString(); }
    setState(()=>loading=false);
  }

  @override Widget build(BuildContext context){
    return Column(children:[
      TabBar(controller: tab, tabs: const [Tab(text:'Scan'), Tab(text:'Hotlist')]),
      Expanded(child: TabBarView(controller: tab, children:[ _buildScan(), _buildHotlist() ])),
    ]);
  }

  Widget _buildScan(){
    return Column(children:[
      Padding(padding: const EdgeInsets.all(12), child: Row(children:[
        Expanded(child: TextField(controller: queryCtrl, decoration: const InputDecoration(prefixIcon: Icon(Icons.search), labelText:'Nhập tên token (vd: pepe)'))),
        const SizedBox(width:8), FilledButton(onPressed: search, child: const Text('Tìm')),
      ])),
      if(loading) const LinearProgressIndicator(),
      if(error!=null) Padding(padding: const EdgeInsets.all(12), child: Text('Error: $error')),
      if(detail==null) Expanded(child: ListView.separated(padding: const EdgeInsets.all(12), itemCount: results.length, itemBuilder: (_,i){
        final r=results[i];
        return Card(child: ListTile(leading: CircleAvatar(backgroundImage: NetworkImage(r['thumb']??'')),
          title: Text('${r['name']} (${(r['symbol']??'').toString().toUpperCase()})'), subtitle: Text('Rank: ${r['market_cap_rank'] ?? '-'}'),
          trailing: const Icon(Icons.chevron_right), onTap: ()=>scanById(r['id'])));
      }, separatorBuilder: (_,__)=>const SizedBox(height:8))),
      if(detail!=null) Expanded(child: _DetailView(detail: detail!, onBack: ()=>setState(()=>detail=null))),
    ]);
  }

  Widget _buildHotlist(){
    if(hotlist.isEmpty) return const Center(child: Text('Đang tải hotlist... Kéo để reload.'));
    return RefreshIndicator(onRefresh: () async { await loadHotlist(); }, child: ListView.separated(
      padding: const EdgeInsets.all(12), itemCount: hotlist.length, itemBuilder: (_,i){
        final h=hotlist[i];
        return Card(child: ListTile(title: Text('${h.name} (${h.symbol.toUpperCase()})'), subtitle: Text('Trend · Rank #${h.rank ?? '-'}'),
          trailing: const Icon(Icons.search), onTap: ()=>scanById(h.id)));
      }, separatorBuilder: (_,__)=>const SizedBox(height:8),
    ));
  }
}

class _HotToken { final String name; final String symbol; final String id; final int? rank;
  _HotToken({required this.name, required this.symbol, required this.id, required this.rank});
}

class _DetailView extends StatelessWidget {
  final Map<String,dynamic> detail; final VoidCallback onBack;
  const _DetailView({required this.detail, required this.onBack, super.key});
  @override Widget build(BuildContext context){
    final name=detail['name']??''; final symbol=(detail['symbol']??'').toString().toUpperCase(); final img=detail['image']?['small']??'';
    final mcap=detail['market_data']?['market_cap']?['usd']; final price=detail['market_data']?['current_price']?['usd']; final vol=detail['market_data']?['total_volume']?['usd'];
    final risk=_riskLabel(detail); final explain=_riskExplain(detail);
    return ListView(padding: const EdgeInsets.all(16), children:[
      Row(children:[ CircleAvatar(backgroundImage: NetworkImage(img), radius:18), const SizedBox(width:12),
        Text('$name ($symbol)', style: const TextStyle(fontSize:18, fontWeight: FontWeight.bold)), const Spacer(),
        Chip(label: Text(risk), backgroundColor: _riskColor(risk).withOpacity(.15), labelStyle: TextStyle(color: _riskColor(risk), fontWeight: FontWeight.w600)), ]),
      const SizedBox(height:8),
      Text('Giá hiện tại: ${price!=null?'\$${price.toString()}':'-'}'),
      Text('Market cap: ${mcap!=null?'\$${mcap.toString()}':'-'}'),
      Text('Volume 24h: ${vol!=null?'\$${vol.toString()}':'-'}'),
      const SizedBox(height:12), const Text('Giải thích:', style: TextStyle(fontWeight: FontWeight.bold)), Text(explain),
      const SizedBox(height:12), const Text('Lưu ý thêm:', style: TextStyle(fontWeight: FontWeight.bold)),
      const Text('• Token mới & thanh khoản thấp thường rủi ro pump/dump.
• Kiểm tra thêm holders & liquidity trước khi mua.'),
      const SizedBox(height:12), OutlinedButton.icon(onPressed:onBack, icon: const Icon(Icons.arrow_back), label: const Text('Quay lại kết quả')),
    ]);
  }
  static String _riskLabel(Map<String,dynamic> d){ final mcap=d['market_data']?['market_cap']?['usd']??0; final vol=d['market_data']?['total_volume']?['usd']??0; int score=0;
    if(mcap is num and mcap<5000000) score+=2; if(vol is num and vol<200000) score+=1; if(score>=3) return 'HIGH RISK'; if(score>=2) return 'MEDIUM'; return 'SAFE'; }
  static String _riskExplain(Map<String,dynamic> d){ final mcap=d['market_data']?['market_cap']?['usd']; final vol=d['market_data']?['total_volume']?['usd'];
    final r=<String>[]; if(mcap is num and mcap<5000000) r.add('Market cap nhỏ (<$5M)'); if(vol is num and vol<200000) r.add('Volume 24h thấp (<$200k)');
    if(r.isEmpty) return 'Không phát hiện dấu hiệu rủi ro cao từ market data cơ bản.'; return r.join(' · ')+'. Khuyến nghị kiểm tra thêm holders & liquidity.'; }
  static Color _riskColor(String risk){ switch(risk){ case 'HIGH RISK': return Colors.red; case 'MEDIUM': return Colors.orange; default: return Colors.green; } }
}