
class Signal{
  final String pair;
  final String type;
  final num entry;
  final List<num> tp;
  final num sl;
  final String risk;
  final String tf;
  final String source;
  final String status;
  Signal({required this.pair, required this.type, required this.entry, required this.tp, required this.sl, required this.risk, required this.tf, required this.source, required this.status});
  factory Signal.fromJson(Map<String,dynamic> j)=>Signal(
    pair:j['pair'], type:j['type'], entry:j['entry'], tp:(j['tp'] as List).map((e)=>e as num).toList(),
    sl:j['sl'], risk:j['risk'], tf:j['tf'], source:j['source'], status:j['status']
  );
}
