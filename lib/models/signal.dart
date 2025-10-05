
class Signal {
  final int id;
  final String pair;
  final String type;
  final num entry;
  final List<num> tp;
  final num sl;
  final String risk;
  final String source;
  final String timeframe;
  final String status;

  Signal({
    required this.id,
    required this.pair,
    required this.type,
    required this.entry,
    required this.tp,
    required this.sl,
    required this.risk,
    required this.source,
    required this.timeframe,
    required this.status,
  });

  factory Signal.fromJson(Map<String, dynamic> j) => Signal(
        id: j['id'],
        pair: j['pair'],
        type: j['type'],
        entry: j['entry'],
        tp: (j['tp'] as List).map((e) => e as num).toList(),
        sl: j['sl'],
        risk: j['risk'],
        source: j['source'],
        timeframe: j['timeframe'],
        status: j['status'],
      );
}
