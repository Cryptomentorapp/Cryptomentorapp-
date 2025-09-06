import 'dart:async';
import 'dart:convert';
import 'dart:io';

typedef PriceCallback = void Function(double price);

class BinanceWS {
  final String symbol; // e.g., btcusdt
  final PriceCallback onPrice;
  final Duration reconnectDelay;
  final Duration pollInterval;
  WebSocket? _ws;
  Timer? _pollTimer;
  bool _closed = false;

  BinanceWS({
    required this.symbol,
    required this.onPrice,
    this.reconnectDelay = const Duration(seconds: 3),
    this.pollInterval = const Duration(seconds: 2),
  });

  Future<void> start() async {
    _closed = false;
    await _connectWS();
  }

  Future<void> _connectWS() async {
    final url = 'wss://stream.binance.com:9443/ws/${symbol.toLowerCase()}@trade';
    try {
      _ws = await WebSocket.connect(url);
      _ws!.listen((event) {
        try {
          final data = jsonDecode(event);
          final p = double.tryParse((data['p'] ?? data['price'] ?? '').toString());
          if (p != null) onPrice(p);
        } catch (_) {}
      }, onDone: _onWSClosed, onError: (e) {
        _onWSError(e);
      });
    } catch (_) {
      _startPollingFallback();
      _scheduleReconnect();
    }
  }

  void _onWSClosed() {
    if (_closed) return;
    _startPollingFallback();
    _scheduleReconnect();
  }

  void _onWSError(Object e) {
    _startPollingFallback();
    _scheduleReconnect();
  }

  void _scheduleReconnect() {
    if (_closed) return;
    Future.delayed(reconnectDelay, () {
      if (_closed) return;
      _connectWS();
    });
  }

  void _startPollingFallback() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(pollInterval, (_) async {
      try {
        final uri = Uri.parse('https://api.binance.com/api/v3/ticker/price?symbol=${symbol.toUpperCase()}');
        final client = HttpClient();
        final req = await client.getUrl(uri);
        final res = await req.close();
        final body = await res.transform(utf8.decoder).join();
        final json = jsonDecode(body);
        final p = double.tryParse((json['price'] ?? json['p'] ?? '').toString());
        if (p != null) onPrice(p);
      } catch (_) {}
    });
  }

  Future<void> close() async {
    _closed = true;
    _pollTimer?.cancel();
    if (_ws != null) {
      await _ws!.close();
    }
  }
}
