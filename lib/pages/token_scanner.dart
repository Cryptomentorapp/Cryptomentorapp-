import 'package:flutter/material.dart';
import '../services/coingecko_service.dart';
import '../widgets/cm_loading.dart';
import '../widgets/cm_error.dart';

class TokenScannerPage extends StatefulWidget{ const TokenScannerPage({super.key}); @override State<TokenScannerPage> createState()=>_T(); }
class _T extends State<TokenScannerPage>{
  final q=TextEditingController(); List results=[]; Map<String,dynamic>? detail; String? error; bool loading=false;

  Future<void> _search() async { setState(()=>loading=true);
    try{ final data = await CoinGeckoService.search(q.text); results = (data['coins'] as List?) ?? []; error=null; } catch(e){ error=e.toString(); }
    setState(()=>loading=false); }

  Future<void> _scanById(String id) async { setState(()=>loading=true);
    try{ detail = await CoinGeckoService.coinDetail(id); error=null; } catch(e){ error=e.toString(); }
    setState(()=>loading=false); }

  @override Widget build(BuildContext c)=>ListView(padding: const EdgeInsets.all(12), children:[
    Row(children:[ Expanded(child: TextField(controller:q, decoration: const InputDecoration(prefixIcon: Icon(Icons.search), labelText:'Nhập tên token (vd: pepe)'))),
      const SizedBox(width:8), FilledButton(onPressed:_search, child: const Text('Tìm')), ]),
    if(loading) const LinearProgressIndicator(),
    if(error!=null) Padding(padding: const EdgeInsets.all(8), child: CMError(error!)),
    if(detail==null)...[ const SizedBox(height:8),
      ...results.map((r){ final m=Map<String,dynamic>.from(r as Map);
        return Card(child: ListTile(leading: CircleAvatar(backgroundImage: NetworkImage((m['thumb']??'').toString())),
          title: Text((m['name']??'').toString()+' ('+(m['symbol']??'').toString().toUpperCase()+')'),
          subtitle: Text('Rank: '+((m['market_cap_rank']??'-')).toString()), trailing: const Icon(Icons.chevron_right),
          onTap: ()=>_scanById((m['id']??'').toString()))); })
    ] else ...[ _Detail(detail: detail!, onBack: ()=>setState(()=>detail=null)) ]
  ]);
}

class _Detail extends StatelessWidget{
  final Map<String,dynamic> detail; final VoidCallback onBack;
  const _Detail({super.key, required this.detail, required this.onBack});
  String _usd(dynamic v){ if(v is num) return '\$'+v.toStringAsFixed(2); return '-'; }
  @override Widget build(BuildContext c){
    final name=(detail['name']??'').toString(); final sym=(detail['symbol']??'').toString().toUpperCase();
    final img=(detail['image']?['small']??'').toString(); final mcap=detail['market_data']?['market_cap']?['usd'];
    final price=detail['market_data']?['current_price']?['usd']; final vol=detail['market_data']?['total_volume']?['usd'];
    final risk=_risk(detail); final exp=_exp(detail);
    return Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
      Row(children:[ CircleAvatar(backgroundImage: NetworkImage(img)), const SizedBox(width:12), Text('$name ($sym)', style: const TextStyle(fontWeight: FontWeight.bold)), const Spacer(), Chip(label: Text(risk)) ]),
      const SizedBox(height:8), Text('Giá: '+_usd(price)), Text('Market cap: '+_usd(mcap)), Text('Volume 24h: '+_usd(vol)),
      const SizedBox(height:12), const Text('Giải thích:', style: TextStyle(fontWeight: FontWeight.bold)), Text(exp),
      const SizedBox(height:12), OutlinedButton.icon(onPressed: onBack, icon: const Icon(Icons.arrow_back), label: const Text('Quay lại')) ])));
  }
  static String _risk(Map d){ final mcap=d['market_data']?['market_cap']?['usd']??0; final vol=d['market_data']?['total_volume']?['usd']??0; int s=0;
    if(mcap is num && mcap<5000000) s+=2; if(vol is num && vol<200000) s+=1; if(s>=3) return 'HIGH RISK'; if(s>=2) return 'MEDIUM'; return 'SAFE'; }
  static String _exp(Map d){ final mcap=d['market_data']?['market_cap']?['usd']; final vol=d['market_data']?['total_volume']?['usd']; final r=<String>[];
    if(mcap is num && mcap<5000000) r.add('Market cap nhỏ (<$5M)'); if(vol is num && vol<200000) r.add('Volume 24h thấp (<$200k)');
    if(r.isEmpty) return 'Không phát hiện rủi ro cao từ market data cơ bản.'; return r.join(' · ')+'. Khuyến nghị kiểm tra thêm holders & liquidity.'; }
}