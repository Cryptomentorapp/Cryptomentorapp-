import 'dart:async';
import 'dart:convert';
import 'dart:io';

class BinanceWS {
  final String symbol; // e.g. btcusdt
  WebSocket? _ws;
  StreamController<double> _priceCtrl = StreamController.broadcast();
  Stream<double> get prices => _priceCtrl.stream;

  BinanceWS(this.symbol);

  Future<void> start() async {
    final url = 'wss://stream.binance.com:9443/ws/${symbol.toLowerCase()}@trade';
    try{
      _ws = await WebSocket.connect(url);
      _ws!.listen((event){
        try{
          final j = jsonDecode(event);
          final p = double.tryParse((j['p'] ?? j['price'] ?? '').toString());
          if(p!=null) _priceCtrl.add(p);
        }catch(_){}
      }, onDone: _reconnect, onError: (_){ _reconnect(); });
    }catch(_){ _reconnect(); }
  }

  void _reconnect(){
    Future.delayed(const Duration(seconds: 2), (){
      if(_ws!=null) start();
    });
  }

  Future<List<double>> fetchCloses({int limit=200, String interval='1m'}) async {
    final uri = Uri.parse('https://api.binance.com/api/v3/klines?symbol=${symbol.toUpperCase()}&interval=$interval&limit=$limit');
    final client = HttpClient();
    final req = await client.getUrl(uri);
    final res = await req.close();
    final body = await res.transform(utf8.decoder).join();
    final data = jsonDecode(body) as List;
    return data.map((e)=> double.tryParse(e[4].toString()) ?? 0.0).toList();
  }

  Future<void> close() async {
    await _ws?.close();
    await _priceCtrl.close();
  }
}
