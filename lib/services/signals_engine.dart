import 'dart:convert'; import 'package:flutter/services.dart' show rootBundle;
class SignalsEngine{ Map<String,dynamic>? playbooks; Map<String,dynamic>? regimes; Map<String,dynamic>? confluence;
  Future<void> init() async { playbooks=jsonDecode(await rootBundle.loadString('assets/ai/signals_playbooks_v2.json')); regimes=jsonDecode(await rootBundle.loadString('assets/ai/regimes_v1.json')); confluence=jsonDecode(await rootBundle.loadString('assets/ai/confluence_matrix_v1.json')); }
  Future<Map<String,dynamic>> loadFeatures(String symbol) async { try{ final m=jsonDecode(await rootBundle.loadString('assets/data/features_'+symbol+'_H4.json')); return m; }catch(_){ return {"symbol":symbol,"tf":"H4","rows":[]}; } }
  bool _gt(num? a,num b)=>(a??0)>b; bool _lt(num? a,num b)=>(a??0)<b; num _n(v)=> (v is num)?v:0;
  Map<String,dynamic> evaluate(Map<String,dynamic> last){ final scores=<String,int>{}; void add(String k,int s){scores[k]=s;}
    if(_lt(_n(last['rsi_14']),30)) add('rsi_div_bull',2); if(_n(last['macd_line'])>_n(last['macd_signal'])) add('macd_cross_up',1); if(_lt(_n(last['bb_width']),0.05)) add('bb_squeeze',1);
    if(_gt(_n(last['vol_rel_ma20']),120)) add('vol_rel_gt_120',1); if(_gt(_n(last['ema50']),_n(last['ema200']))) add('ema50_above_200',1); if(_gt(_n(last['close']),_n(last['ema200']))) add('price_above_ema200',1);
    if(_n(last['atr_pctile'])>=20 && _n(last['atr_pctile'])<=60) add('atr_pctile_20_60',1);
    final total=scores.values.fold<int>(0,(a,b)=>a+b); final th=confluence?['thresholds']??{'trade':4,'wait':2}; final verdict= total>=th['trade']?'TRADE':(total>=th['wait']?'WAIT':'NO-TRADE'); return {'scores':scores,'total':total,'verdict':verdict}; }
}